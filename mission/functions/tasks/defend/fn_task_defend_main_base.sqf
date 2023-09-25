/*
	File: fn_task_defend_main_base.sqf
	Author: "DJ" Dijksterhuis
	Public: No

	Description:
		Defend respawns within a specific radius around the starting point on the map.

	Parameter(s):
		_taskDataStore - Namespace for storing task info [Object]

	Returns: nothing

	Example(s):
		Not directly called.
*/

/*
	Requires Task Variables: taskMarker (starting point)
*/

params ["_taskDataStore"];

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	private _candidateRespawnPositionsToAttack = (
		[west, false] call BIS_fnc_getRespawnPositions
	) select {
		(_x find "mf_respawn") != -1
	} select {
		_x != "mf_respawn_presscorp"
	} apply {
		getMarkerPos _x
	} inAreaArray [
		getMarkerPos "starting_point",
		vn_mf_bn_s_zone_radius * 2,
		vn_mf_bn_s_zone_radius * 2, 
		0, 
		false
	];

	// setup the default nAttacks variable
	_taskDataStore setVariable [
		"nAttacks", 
		9 min (_taskDataStore getVariable ["nAttacks", 3])
	];
	_taskDataStore setVariable ["attackEndTime", serverTime + (60 * 5)];

	private _attackPositions = (
		[1, _taskDataStore getVariable "nAttacks"] call vn_mf_fnc_range
	) apply {
		_taskDataStore setVariable [format ["defend_respawn_subtask_%1", _x], {
			params ["_taskDataStore"];
			if (_taskDataStore getVariable "attackEndTime" > serverTime) exitWith {};
			_taskDataStore setVariable ["nDefended", (_taskDataStore getVariable ["nDefended", 0]) + 1];
			["SUCCEEDED"] call _fnc_finishSubtask;
		}];
	} apply {
		selectRandom _candidateRespawnPositionsToAttack
	};

	diag_log format ["POSITIONS: %1", _attackPositions];

	_taskDataStore setVariable [
		"attackObjectives", 
		_attackPositions apply {
			[_x, 1, 10] call para_s_fnc_ai_obj_request_attack
		}
	];

	[
		"CounterAttackPreparing", ["", 0 toFixed 0]
	] remoteExec ["para_c_fnc_show_notification", 0];

	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;

	[
		"Counter-Attack at Main Base", 
		_taskDataStore getVariable "attackEndTime", 
		true
	] call vn_mf_fnc_timerOverlay_setGlobalTimer;

	private _i = 0;
	private _subtasksArgs = _attackPositions apply {
		_i = _i + 1;
		[format ["defend_respawn_%1", _i], _x]
	};

	[_subtasksArgs] call _fnc_initialSubtasks;
}];


_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];
	if ((_taskDataStore getVariable ["nDefended", 0]) == (_taskDataStore getVariable "nAttacks")) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	params ["_taskDataStore"];
	(_taskDataStore getVariable ["attackObjectives", []]) call para_s_fnc_ai_obj_finish_objective;
}];
