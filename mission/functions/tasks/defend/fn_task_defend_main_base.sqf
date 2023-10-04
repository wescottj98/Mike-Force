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

/*
CONSTANTS
*/

// anywhere from 25 to 35 minutes
_taskDataStore setVariable [
	"attackEndTime",
	serverTime + (60 * (25 min (random 35)))
];

// setup the default nAttacks variable
// 2 <= n <= 4
_taskDataStore setVariable [
	"nAttacks", 
	1 + ceil (random 3)
];

// setup available respawns
_taskDataStore setVariable [
	"availableRespawns",
	(
		[west, false] call BIS_fnc_getRespawnPositions
	) select {
		// only respawns deliberately placed down on map in editor,
		// not spawns placed down as part of building
		(_x find "mf_respawn") != -1
	} select {
		// not press as non combatants
		_x != "mf_respawn_presscorp"
		// not monties because arma players can be toxic 
		&& _x != "mf_respawn_montagnard"
	} apply {
		getMarkerPos _x
	} inAreaArray [
		getMarkerPos "starting_point",
		2500,
		2500, 
		0, 
		false
	]
];

/*
TASK LOGIC
*/

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	private _subTaskIds = (
		[1, _taskDataStore getVariable "nAttacks"] call vn_mf_fnc_range
	) apply {
		format ["defend_respawn_%1", _x]
	};

	_subTaskIds apply {
		// generate the actual subtask code here with incrementing IDs 
		// up to a maximum of 9 (increase the number of config subtasks 
		// if you want to go above this maximum ... i hope you have a 
		// lot of headless clients if that is the case!)
		_taskDataStore setVariable [
			_x, 
			{
				params ["_taskDataStore"];
				if (_taskDataStore getVariable "attackEndTime" > serverTime) exitWith {};
				// TODO: Add a failure condition like no bluefor in the area for 5+ minutes
				_taskDataStore setVariable ["nDefended", (_taskDataStore getVariable ["nDefended", 0]) + 1];
				["SUCCEEDED"] call _fnc_finishSubtask;
			}
		];
	};

	private _attackPositions = _subTaskIds apply {
		selectRandom (_taskDataStore getVariable "availableRespawns")
	};

	_taskDataStore setVariable [
		"attackObjectives", 
		_attackPositions apply {
			// keep sending reinforcements no matter what
			[_x, 1, 20] call para_s_fnc_ai_obj_request_attack
		}
	];

	private _fnc_zip = {
		params ["_a", "_b"];
		private _res = [];
		{
			_res pushBack [_x, _b select _forEachIndex];
		} forEach _a;

		_res
	};

	private _subTaskArgs = [_subTaskIds, _attackPositions] call _fnc_zip;

	_taskDataStore setVariable ["subtasks", _subTaskArgs];

	diag_log format [
		"Defend Main Base: SubTasks: %1", _subTaskArgs
	];

	["MainBaseAttackStarting"] remoteExec ["para_c_fnc_show_notification", 0];
	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
	[
		"Main Base Counter-Attack", 
		_taskDataStore getVariable "attackEndTime", 
		true
	] call vn_mf_fnc_timerOverlay_setGlobalTimer;

	[_subTaskArgs] call _fnc_initialSubtasks;

}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];
	if (
		(_taskDataStore getVariable ["nDefended", 0]) == (_taskDataStore getVariable "nAttacks")
	) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	params ["_taskDataStore"];
	(_taskDataStore getVariable ["attackObjectives", []]) apply {
		[_x] call para_s_fnc_ai_obj_finish_objective
	};
}];
