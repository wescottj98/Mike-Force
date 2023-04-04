
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
	players have stayed out of the AO's blue circle
	we're good to end the objective and move to the next one
	*/
	if (serverTime > _endTime and not _arePlayersInArea) exitWith {
		_taskDataStore setVariable ["prepared", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};

	/*
	players have not stayed out of the AO's blue circle so set the sub task as failed
	then enter a blocking loop checking whether players have left blue zone.
	if not, send player information to logs if in blue zone (possible trolls).
	and spam notifications to all players every X seconds until they leave.
	*/
	if (_arePlayersInArea) exitWith {

		// used in AFTER_STATES_RUN and FINISH to check the end state of the objective
		// i.e. it failed because players did the bad thing
		_taskDataStore setVariable ["badPlayer", true];
		["FAILED"] call _fnc_finishSubtask;

		// TODO: duplicates '_arePlayersInArea' logic above. needs optimisation.
		while {(count (allPlayers inAreaArray _areaDescriptor)) > 0} do {

			private _pollDelaySeconds = 60;

			diag_log format [
				"Prepare AO: Failing because of bad players: serverTime=%1 players=%2",
				serverTime,
				_playersInArea
			];

			private _hudOverlayParams = [
				"Move out of the blue circle!",
				serverTime + _pollDelaySeconds,
				true
			];

			["AttackPreparingFailed", []] remoteExec ["para_c_fnc_show_notification", 0];
			[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
			_hudOverlayParams call vn_mf_fnc_timerOverlay_setGlobalTimer;

			sleep _pollDelaySeconds;
		};
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	// players HAVE stayed out of the AO's blue circle
	private _prepared = _taskDataStore getVariable ["prepared", false];

	// players HAVE NOT stayed out of the AO's blue circle
	private _badPlayer = _taskDataStore getVariable ["badPlayer", false];

	diag_log format [
		"Prepare AO: After tick: serverTime=%1 prepared=%2 badPlayer=%3",
		serverTime,
		_prepared,
		_badPlayer,
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
	private _zone = _taskDataStore getVariable "taskMarker";

	if (_taskDataStore getVariable ["taskResult", "FAILED"] == "FAILED") then {

		diag_log format [
			"Prepare AO: Finish Tick: Task failed, starting new prepare task."
		];
		// start the same task again
		_taskStore = ["prepare_zone", _zone] call vn_mf_fnc_task_create;

	} else {

		/*
		TODO: Site generation can take anywhere up to 3-4 minutes
		depending on the compositions and server state.
		We probably need to add a "delete all sites" script to handle the case
		where players enter the zone during this time.
		
		TL;DR -- if players enter the zone at this stage they will still
		screw up the compositions.
		*/
		diag_log format [
			"Prepare AO: Finish Tick: Creating sites for zone."
		];
		private _zone = _taskDataStore getVariable "taskMarker";
		[_zone] call vn_mf_fnc_sites_generate;

		_zone setMarkerColor "ColorRed";
		_zone setMarkerBrush "DiagGrid";
		diag_log format [
			"Prepare AO: Finish Tick: Creating new capture task."
		];
		_taskStore = ["capture_zone", _zone] call vn_mf_fnc_task_create;

	};

	// delete the big BN circle AO marker
	deleteMarker _areaMarkerName;

}];
