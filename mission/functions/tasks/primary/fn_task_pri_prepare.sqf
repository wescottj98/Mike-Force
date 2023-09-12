
/*
 * Task Parameters:
 *    None
 * Subtask Parameters:
 * 	  None
 * Runtime Parameters:
 *    None
 */

params ["_taskDataStore"];

/*
CONSTANTS
*/
_taskDataStore setVariable ["subtaskDurationSeconds", 3 * 60];
_taskDataStore setVariable ["subtaskStartTimeRTB", 0];
_taskDataStore setVariable ["subtaskStartTimePrepare", 0];

/*
METHODS

The following function definitions are basically hacking the task definition
to work in an object orientated manner as a class with methods ... sort of.

If you've ever seen python OOP code you should be able to spot the method 
pattern below -- it just uses _taskStore instead of self

class A:
    def method(self, x, y):
        return x
*/

/*
PRIVATE METHOD -- should only be used by methods defined below.

Get safe subtask end time a.k.a. the time when the subtask is marked as complete.

The code for specific subtasks is run on a tick	so if we restart the subtask later
we have to reset the start time to zero beforehand (on the subtask's initial failure)
and then work it out again on the first tick when the subtask is triggered again.
*/
_taskDataStore setVariable ["_fnc_getSubtaskEndTime", {

	params ["_taskStore", "_subtaskStartTimeVarName"];

	if ((_taskStore getVariable _subtaskStartTimeVarName) == 0) then {
		_taskStore setVariable [_subtaskStartTimeVarName, serverTime];
	};

	private _startTime = _taskStore getVariable _subtaskStartTimeVarName;
	_startTime + (_taskStore getVariable "subtaskDurationSeconds")

}];

/* Work out when the RTB subtask is scheduled to end. */
_taskDataStore setVariable ["fnc_getSubtaskEndTimeRTB", {
	params ["_taskStore"];
	[_taskStore, "subtaskStartTimeRTB"] call (_taskStore getVariable "_fnc_getSubtaskEndTime")
}];

/* Work out when the Prepare subtask is scheduled to end. */
_taskDataStore setVariable ["fnc_getSubtaskEndTimePrepare", {
	params ["_taskStore"];
	[_taskStore, "subtaskStartTimePrepare"] call (_taskStore getVariable "_fnc_getSubtaskEndTime")
}];

/* 
PRIVATE METHOD -- should only be used by methods defined below.

Get all players that match specific conditions in a specific area.
_playersToCheck should be all players that you want to check the location of.
*/
_taskDataStore setVariable ["_fnc_getPlayersInArea", {
	params ["_taskStore", "_playersToCheck"];
	private _areaDescriptor = _taskStore getVariable ["areaDescriptor", []];
	_playersToCheck inAreaArray _areaDescriptor
}];

/* Find out if ANY players have entered the zone while the RTB subtask is active. */
_taskDataStore setVariable ["fnc_getPlayersInAreaRTB", {
	params ["_taskStore"];
	[_taskStore, allPlayers select {alive _x}] call (_taskStore getVariable "_fnc_getPlayersInArea")
}];

/* Find out if non-DC players have entered the zone while the prepare subtask is active. */
_taskDataStore setVariable ["fnc_getPlayersInAreaPrepare", {
	params ["_taskStore"];
	[_taskStore, (allPlayers select {alive _x}) select {side _x != east}] call (_taskStore getVariable "_fnc_getPlayersInArea")
}];

/* Change the colour of the BN circular area marker */
_taskDataStore setVariable ["fnc_changeAreaMarkerColor", {
	params ["_taskStore", "_color"];
	(_taskStore getVariable "areaMarkerName") setMarkerColor _color;
}];

	
/*
"Go Away" logic -- the logic for both go away subtasks is identical, except for the players we filter on.
*/
_taskDataStore setVariable ["fnc_subtaskGoAway", {

	params ["_taskStore", "_nextSubTask", "_playersInArea", "_obj_pos"];

	[_taskStore, "ColorBlack"] call (_taskStore getVariable "fnc_changeAreaMarkerColor");

	/*
	players have left the AO's blue circle
	we're good to end this task and move back to the DC prepare task
	*/
	if ((count _playersInArea) == 0) exitWith {
		// we need to set the timer overlay up before we start the task
		// otherwise task block above will call this on every task tick
		private _nextsubtaskDurationSeconds = _taskStore getVariable "subtaskDurationSeconds";
		
		[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
		["Attack Operation preparation", serverTime + _nextsubtaskDurationSeconds, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;

		diag_log format [
			"Prepare AO: GoAway subtask success, switching to %1 subtask", 
			_nextSubtask
		];
		
		[
			"SUCCEEDED", 
			[[_nextSubtask, _obj_pos]]
		] call _fnc_finishSubtask;

	};

	/*
	players have not stayed out of the AO's blue circle so set the sub task as failed
	send player information to logs if in blue zone (possible trolls).
	and spam notifications to all players until they leave.
	*/
	if ((count _playersInArea) > 0) exitWith {
		/*
		players have not stayed out of the AO's blue circle so set the sub task as failed
		send player information to logs if in blue zone (possible trolls).
		and spam notifications to all players until they leave.
		*/

		private _pollingDelay = 30;

		diag_log format [
			"Prepare AO: Players inside AO area during RTB subtask: serverTime=%1 playerUIDs=%2",
			serverTime,
			_playersInArea apply {getPlayerUID _x}
		];

		private _hudOverlayParams = [
			"Leave the area immediately!",
			serverTime + _pollingDelay,
			true
		];

		["AttackPreparingFailed", ["Leave the area immediately! Charlie isn't ready!"]] remoteExec ["para_c_fnc_show_notification", 0];
		[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
		_hudOverlayParams call vn_mf_fnc_timerOverlay_setGlobalTimer;

		sleep _pollingDelay;
	};
}];

// no players allowed into the AO, so we can spawn in sites safely
_taskDataStore setVariable ["fnc_subtaskRTB", {
	params ["_taskStore"];

	[_taskStore, "ColorBlue"] call (_taskStore getVariable "fnc_changeAreaMarkerColor");

	private _subtaskEndTime = [_taskStore] call (_taskStore getVariable "fnc_getSubtaskEndTimeRTB");
	private _playersInArea = [_taskStore] call (_taskStore getVariable "fnc_getPlayersInAreaRTB");

	/*
	players have stayed out of the AO's blue circle...
	and we have not generated any sites already...

	looks like we're okay to spawn in sites for now
	*/
	if (serverTime > _subtaskEndTime and not (_taskStore getVariable ["generated", false])) exitWith {
		// NOTE: vn_mf_fnc_sites_generate is a blocking call which
		// stops the prepare task doing any ticks while it's executing
		[_taskStore getVariable "taskMarker"] call vn_mf_fnc_sites_generate;
		_taskStore setVariable ["generated", true];
	};

	/*
	players have not stayed out of the AO's blue circle
	set the sub task as failed, reset the state and move to the "Go away" phase

	this needs to be immediately after the if block for the generate site to
	ensure we are checking immediately if players shjowed up during site generation
	*/

	if ((count _playersInArea) > 0) exitWith {

		/* set start time to zero so we know next time we trigger the subtask that we'll need to recalculate */
		_taskStore setVariable ["subtaskStartTimeRTB", 0];
		diag_log format ["Prepare AO: RTB subtask failed, switching to GoAwayRTB subtask"];

		/*
		immediately cleanup any existing sites objectives and composition objects
		then reset the task state so we can go back to the first sub task
		and generate sites all over again
		*/
		[] call vn_mf_fnc_sites_delete_all_active_sites;
		_taskStore setVariable ["generated", false];

		[
			"FAILED", 
			[
				["go_away_rtb", getMarkerPos "starting_point"]
			]
		] call _fnc_finishSubtask;
	};

	/* we actually generated the sites and haven't triggered a subtask failure. great success! */
	if (_taskStore getVariable ["generated", false]) exitWith {
		diag_log format ["Prepare AO: RTB subtask success, switching to Prepare subtask"];
		[
			"SUCCEEDED",
			[
				["prepare", _taskStore getVariable ["stagingPos", getMarkerPos "starting_point"]]
			]
		] call _fnc_finishSubtask;
	};
}];

/*
"Prepare" logic
*/
_taskDataStore setVariable ["fnc_subtaskPrepare", {

	params ["_taskStore"];

	[_taskStore, "ColorBlue"] call (_taskStore getVariable "fnc_changeAreaMarkerColor");
	private _subtaskEndTime = [_taskStore] call (_taskStore getVariable "fnc_getSubtaskEndTimePrepare");
	private _playersInArea = [_taskStore] call (_taskStore getVariable "fnc_getPlayersInAreaPrepare");

	/* success -- everything has gone smoothly and we can now close out the final subtask */
	if (serverTime > _subtaskEndTime and (count _playersInArea) == 0) exitWith {
		diag_log format ["Prepare AO: Prepare subtask success, ending task"];
		_taskStore setVariable ["prepared", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};

	/* players have not stayed out of the AO's blue circle so set the sub task as failed */
	
	if ((count _playersInArea) > 0) exitWith {
		diag_log format ["Prepare AO: Prepare subtask failed, switching to GoAwayNotDC subtask"];
		_taskStore setVariable ["subtaskStartTimePrepare", 0];
		[
			"FAILED", 
			[
				["go_away_prepare", _taskStore getVariable ["stagingPos", getMarkerPos "starting_point"]]
			]
		] call _fnc_finishSubtask;
	};
}];


/*
ACTUAL TASK DEFINITION
*/

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	private _zone = _taskDataStore getVariable "taskMarker";

	diag_log format [
		"Prepare AO: Init: serverTime=%1 zone=%2",
		serverTime,
		_zone
	];

	/* base Mike Force AO marker. */
	private _zonePosition = getMarkerPos _zone;
	_zone setMarkerColor "ColorBlue";
	_zone setMarkerBrush "DiagGrid";

	/* area marker is the outer BN circle, or effective AO play area. */
	private _areaMarkerSize = vn_mf_bn_s_zone_radius + 100;
	private _areaDescriptor = [_zonePosition, _areaMarkerSize, _areaMarkerSize, 0, false];
	_taskDataStore setVariable ["areaDescriptor", _areaDescriptor];

	/*
	Initial changes to the marker for the BN playable area.

	Don't set the colour during init as we'll handle it during subtasks
	so we can switch colours based on conditions
	*/
	private _areaMarker = createMarker ["prepZoneCircle", _zonePosition];
	_areaMarker setMarkerShape "ELLIPSE";
	_areaMarker setMarkerSize [_areaMarkerSize, _areaMarkerSize];
	_areaMarker setMarkerAlpha 0.5;
	_areaMarker setMarkerBrush "DiagGrid";

	_taskDataStore setVariable ["areaMarkerName", _areaMarker];

	/*
	the staging position is where the Arma objective marker changes to when the
	zone flips from the RTB subtask to the Prepare subtask
	*/
	private _stagingPos = _zonePosition getPos [vn_mf_bn_s_zone_radius + 300, _zonePosition getDir (getMarkerPos "starting_point")];
	_taskDataStore setVariable ["stagingPos", _stagingPos];

	/* send notifications about starting the next AO */
	private _totalTaskDurationSeconds = (_taskDataStore getVariable ["subtaskDurationSeconds", 0]) * 2;
	["AttackPreparing", [format ["%1", _totalTaskDurationSeconds / 60]]] remoteExec ["para_c_fnc_show_notification", 0];
	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
	["Attack Operation preparation", serverTime + _totalTaskDurationSeconds, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;

	diag_log format ["Prepare AO: Init Finished, switching to RTB subtask"];

	[[
		["rtb", getMarkerPos "starting_point"]
	]] call _fnc_initialSubtasks;
}];

// actual rtb logic is called via method above
_taskDataStore setVariable ["rtb", {
	params ["_taskDataStore"];
	[_taskDataStore] call (_taskDataStore getVariable "fnc_subtaskRTB");
}];

// actual prepare logic is called via method above
_taskDataStore setVariable ["prepare", {
	params ["_taskDataStore"];
	[_taskDataStore] call (_taskDataStore getVariable "fnc_subtaskPrepare");
}];

// players entered the AO during the RTB subtask, spam notifications until they leave
_taskDataStore setVariable ["go_away_rtb", {
	params ["_taskDataStore"];

	private _playersInArea = [_taskDataStore] call (_taskDataStore getVariable "fnc_getPlayersInAreaRTB");
	private _objPos = getMarkerPos "starting_point";

	[_taskDataStore, "rtb", _playersInArea, _objPos] call (_taskDataStore getVariable "fnc_subtaskGoAway");
}];

// non-DC players entered the AO during prepare subtask, spam notifications until non-DC players leave
_taskDataStore setVariable ["go_away_prepare", {
	params ["_taskDataStore"];

	private _playersInArea = [_taskDataStore] call (_taskDataStore getVariable "fnc_getPlayersInAreaPrepare");
	private _objPos = _taskDataStore getVariable ["stagingPos", getMarkerPos "starting_point"];

	[_taskDataStore, "prepare", _playersInArea, _objPos] call (_taskDataStore getVariable "fnc_subtaskGoAway");
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	private _generated = _taskDataStore getVariable ["generated", false];
	private _prepared = _taskDataStore getVariable ["prepared", false];

	if (_generated and _prepared) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	diag_log format ["Prepare AO: Task complete, cleaning up."];
	private _areaMarkerName = _taskDataStore getVariable "areaMarkerName";
	deleteMarker _areaMarkerName;
}];
