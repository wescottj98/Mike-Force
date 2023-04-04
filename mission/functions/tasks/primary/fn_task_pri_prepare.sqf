
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

	private _durationMinutes = 5;
	private _endTime = serverTime + (_durationMinutes * 60);
	_taskDataStore setVariable ["endTime", _endTime];

	diag_log format [
		"Prepare AO: Init: serverTime=%1 endTime=%2",
		serverTime,
		_endTime
	];

	private _zone = _taskDataStore getVariable "taskMarker";

	// base Mike Force AO marker.
	private _zonePosition = getMarkerPos _zone;
	_zone setMarkerColor "ColorBlue";
	_zone setMarkerBrush "DiagGrid";

	/*
	area marker is the outer BN circle, or effective AO play area.
	if players enter this area they're liable to screw up site generation.
	WARNING: Do not change size here without checking the capture logic too!
	NOTE: marker is deleted during task clean up (bottom of script file)
	*/
	private _areaMarkerSize = 1100;
	private _areaDescriptor = [_zonePosition, _areaMarkerSize, _areaMarkerSize, 0, false];

	private _areaMarker = createMarker ["prepZoneCircle", _zonePosition];

	_areaMarker setMarkerShape "ELLIPSE";
	_areaMarker setMarkerSize [_areaMarkerSize, _areaMarkerSize];
	_areaMarker setMarkerAlpha 0.5;
	_areaMarker setMarkerBrush "DiagGrid";
	_areaMarker setMarkerColor "ColorBlue";

	_taskDataStore setVariable ["areaMarkerName", _areaMarker];
	_taskDataStore setVariable ["areaDescriptor", _areaDescriptor];

	["AttackPreparing", [format ["%1", _durationMinutes]]] remoteExec ["para_c_fnc_show_notification", 0];
	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
	["Attack Operation preparation", serverTime + _durationMinutes * 60, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;

	[[
		["prepare", getMarkerPos "starting_point"]
	]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["prepare", {
	params ["_taskDataStore"];

	private _endTime = _taskDataStore getVariable ["endTime", 0];
	private _areaDescriptor = _taskDataStore getVariable ["areaDescriptor", []];
	private _playersInArea = allPlayers inAreaArray _areaDescriptor;
	private _arePlayersInArea = (count _playersInArea) > 0;

	/*
	1. players have stayed out of the AO's blue circle...
	and we have not generated any sites already...

	looks like we're okay to spawn in sites for now
	*/
	if (serverTime > _endTime and not (_taskDataStore getVariable ["generated", false])) exitWith {

		private _zone = _taskDataStore getVariable "taskMarker";

		// TODO: vn_mf_fnc_sites_generate is a blocking call which
		// stops the prepare task doing any ticks while it's executing
		[_zone] call vn_mf_fnc_sites_generate;
		_taskDataStore setVariable ["generated", true];
		diag_log format [
			"Prepare AO: 'prepare' SubTick: Generated sites zone=%1",
			_zone
		];
	};

	/*
	2. players have not stayed out of the AO's blue circle,

	set the sub task as failed
	*/
	if (_arePlayersInArea) exitWith {
		_taskDataStore setVariable ["badPlayer", true];
		["FAILED"] call _fnc_finishSubtask;
	};

	/*
	3. we actually generated the sites and haven't triggered a subtask failure

	great success!
	*/
	if (_taskDataStore getVariable ["generated", false]) exitWith {
		_taskDataStore setVariable ["prepared", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};


}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	private _prepared = _taskDataStore getVariable ["prepared", false];
	private _badPlayer = _taskDataStore getVariable ["badPlayer", false];

	diag_log format [
		"Prepare AO: After tick: serverTime=%1 prepared=%2 badPlayer=%3",
		serverTime,
		_prepared,
		_badPlayer
	];

	if (_badPlayer) then {
		["FAILED"] call _fnc_finishTask;
	};
	if (_prepared) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	params ["_taskDataStore"];

	private _areaMarkerName = _taskDataStore getVariable "areaMarkerName";
	// delete the big BN circle AO marker
	deleteMarker _areaMarkerName;

	private _zone = _taskDataStore getVariable "taskMarker";

	if (_taskDataStore getVariable ["taskResult", "FAILED"] == "FAILED") then {

		diag_log format [
			"Prepare AO: FinishTick: Task failed, starting 'Go Away' AO task."
		];

		// switch to the "go away" task
		_taskStore = ["go_away_zone", _zone] call vn_mf_fnc_task_create;

	} else {

		// sites were generated, no players entered the zone
		// we're good to move on
		_zone setMarkerColor "ColorRed";
		_zone setMarkerBrush "DiagGrid";
		diag_log format [
			"Prepare AO: FinishTick: Task success, Creating new 'Capture' AO task."
		];
		_taskStore = ["capture_zone", _zone] call vn_mf_fnc_task_create;

	};

}];
