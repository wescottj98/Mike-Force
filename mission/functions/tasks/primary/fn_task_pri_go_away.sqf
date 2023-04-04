/*
	File: fn_task_pri_go_away.sqf
	Author: DJ Dijksterhuis
	Public: No

	Description:
		Runs a loop checking whether players are in an AO's playable area,
		repeatedly telling them to leave.

		This should ONLY be used when players enter an AO during the 
		'prepare zone' task.

	Parameter(s):
		_taskDataStore - Namespace for storing task info [Object]

	Returns: nothing

	Example(s):
		Not directly called.
*/

/*
 * Task Parameters:
 *    None
 * Subtask Parameters:
 * 	  None
 * Runtime Parameters:
 *    None
 */

params ["_taskDataStore"];

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	diag_log format [
		"Go Away AO: Init: serverTime=%1",
		serverTime
	];

	_taskDataStore setVariable ["no_players", false];
	private _zone = _taskDataStore getVariable "taskMarker";

	// base Mike Force AO marker.
	private _zonePosition = getMarkerPos _zone;
	_zone setMarkerColor "ColorBlack";
	_zone setMarkerBrush "DiagGrid";

	/*
	area marker is the outer BN circle, or effective AO play area.
	if players enter this area they're liable to screw up site generation.
	WARNING: Do not change size here without checking the capture logic too!
	NOTE: marker is deleted during task clean up (bottom of script file)
	*/
	private _areaMarkerSize = 1100;
	private _areaDescriptor = [_zonePosition, _areaMarkerSize, _areaMarkerSize, 0, false];

	private _areaMarker = createMarker ["goAwayZoneCircle", _zonePosition];

	_areaMarker setMarkerShape "ELLIPSE";
	_areaMarker setMarkerSize [_areaMarkerSize, _areaMarkerSize];
	_areaMarker setMarkerAlpha 0.5;
	_areaMarker setMarkerBrush "DiagGrid";
	_areaMarker setMarkerColor "ColorBlack";

	_taskDataStore setVariable ["areaMarkerName", _areaMarker];
	_taskDataStore setVariable ["areaDescriptor", _areaDescriptor];

	// cleanup any existing sites objectives and their composition objects
	[] call vn_mf_fnc_sites_delete_all_sites;

	[[
		["go_away_zone", getMarkerPos "starting_point"]
	]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["go_away_zone", {
	params ["_taskDataStore"];

	private _areaDescriptor = _taskDataStore getVariable ["areaDescriptor", []];
	private _playersInArea = allPlayers inAreaArray _areaDescriptor;
	private _arePlayersInArea = (count _playersInArea) > 0;

	/*
	players have left the AO's blue circle
	we're good to end this task and move back to the prepare task
	*/
	if (not _arePlayersInArea) exitWith {
		_taskDataStore setVariable ["playersInAO", false];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};

	/*
	players have not stayed out of the AO's blue circle so set the sub task as failed
	send player information to logs if in blue zone (possible trolls).
	and spam notifications to all players until they leave.
	*/
	if (_arePlayersInArea) exitWith {

		_taskDataStore setVariable ["playersInAO", true];

		diag_log format [
			"Go Away AO: Players inside the AO area: serverTime=%1 players=%2",
			serverTime,
			_playersInArea
		];

		private _hudOverlayParams = [
			"Leave the area immediately!",
			serverTime,
			true
		];

		["AttackPreparingFailed", []] remoteExec ["para_c_fnc_show_notification", 0];
		[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
		_hudOverlayParams call vn_mf_fnc_timerOverlay_setGlobalTimer;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	// players have left AO's playable area
	private _playersInAO = _taskDataStore getVariable ["playersInAO", true];

	diag_log format [
		"Prepare AO: After tick: serverTime=%1 playersInAO=%2",
		serverTime,
		_playersInAO
	];

	if (not _playersInAO) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	params ["_taskDataStore"];

	private _areaMarkerName = _taskDataStore getVariable "areaMarkerName";
	private _zone = _taskDataStore getVariable "taskMarker";

	if (_taskDataStore getVariable ["taskResult", "FAILED"] == "SUCCEEDED") then {

		diag_log format [
			"Go Away AO: Finish Tick: Players have left, starting new prepare task."
		];
		// start the prepare task again
		_taskStore = ["prepare_zone", _zone] call vn_mf_fnc_task_create;

		// delete the big BN circle AO marker
		deleteMarker _areaMarkerName;

	};

}];
