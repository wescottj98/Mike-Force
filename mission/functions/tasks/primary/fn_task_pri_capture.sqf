/*
	File: fn_task_pri_capture.sqf
	Author: Savage Game Design
	Public: No

	Description:
		Primary task to take over a zone - clearing enemy forces out of it.
		Uses the state machine task system.

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

	private _zone = _taskDataStore getVariable "taskMarker";
	private _zonePosition = getMarkerPos _zone;

	// change the zone's hexagon colour and shading
	_zone setMarkerColor "ColorRed";
	_zone setMarkerBrush "DiagGrid";

	private _areaMarkerSize = vn_mf_bn_s_zone_radius + 100;

	// custom BN: yellow circle around the AO
	private _areaMarker = createMarker ["activeZoneCircle", _zonePosition];
	_areaMarker setMarkerShape "ELLIPSE";
	_areaMarker setMarkerSize [_areaMarkerSize, _areaMarkerSize];
	_areaMarker setMarkerAlpha 1;
	_areaMarker setMarkerBrush "Border";
	_areaMarker setMarkerColor "ColorYellow";

	private _hqPosition = missionNamespace getVariable ["hqPosition", _zoneposition];
	private _factoryPosition = missionNamespace getVariable ["factoryPosition", _zoneposition];
	_taskDataStore setVariable ["startTime", serverTime];
	_taskDataStore setVariable ["hq_sites_destroyed", false];
	_taskDataStore setVariable ["factory_sites_destroyed", false];

	private _initialTasks = [
		["destroy_hq_sites", _zonePosition getPos [100, 0]],
		["destroy_factory_sites", _zonePosition getPos [100, 90]],
		["build_situation_room", _zonePosition getPos [100, 180]]
	];

	[_initialTasks] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["destroy_hq_sites", {
	params ["_taskDataStore"];

	private _side_sites_hq = missionNamespace getVariable ["side_sites_hq", []];

	// check each hq site to see if it's been destroyed
	{
		if (isNull _x || !(alive _x)) then
		{
			//remove from list
			_side_sites_hq deleteAt _forEachIndex;
		}
	} forEach _side_sites_hq;

	private _numberOfSites = count _side_sites_hq;
	if (_numberOfSites == 0) exitWith
	{
		_taskDataStore setVariable ["hq_sites_destroyed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["destroy_factory_sites", {
	params ["_taskDataStore"];

	private _side_sites_factory = missionNamespace getVariable ["side_sites_factory", []];

	//check each site to see if it's destroyed
	{
		if (isNull _x || !(alive _x)) then
		{
			//remove from list
			_side_sites_factory deleteAt _forEachIndex;
		};
	} forEach _side_sites_factory;

	private _numberOfSites = count _side_sites_factory;
	if (_numberOfSites == 0) exitWith
	{
		_taskDataStore setVariable ["factory_sites_destroyed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["build_situation_room", {
        params ["_taskDataStore"];

        private _possibleBases = para_g_bases inAreaArray [
		getMarkerPos (_taskDataStore getVariable "taskMarker"),
		selectMax (getMarkerSize (_taskDataStore getVariable "taskMarker") apply {abs _x}),
		selectMax (getMarkerSize (_taskDataStore getVariable "taskMarker") apply {abs _x}),
		0
	];

        if !(_possibleBases isEqualTo []) then {
		_taskDataStore setVariable ["fob_built", true];
		_taskDataStore setVariable ["fob_position", getPos (_possibleBases select 0)];
		private _nextTasks = [
			["build_respawn", (_taskDataStore getVariable "fob_position") getPos [50, 90]],
			["build_flag", (_taskDataStore getVariable "fob_position") getPos [50, 270]]
		];
                ["SUCCEEDED", _nextTasks] call _fnc_finishSubtask;
        };
}];

_taskDataStore setVariable ["build_respawn", {
        params ["_taskDataStore"];

        private _possibleRespawns = nearestObjects [
		_taskDataStore getVariable "fob_position",
		["Land_vn_guardhouse_01", "Land_vn_b_trench_bunker_01_01", "Land_vn_hootch_01_01"],
		200
	];

        if !(_possibleBases isEqualTo []) then {
		_taskDataStore setVariable ["respawn_built", true];
                ["SUCCEEDED"] call _fnc_finishSubtask;
        };
}];

_taskDataStore setVariable ["build_flag", {
        params ["_taskDataStore"];

        private _possibleRespawns = nearestObjects [
		_taskDataStore getVariable "fob_position",
		["vn_flag_usa", "vn_flag_aus", "vn_flag_arvn", "vn_flag_nz"],
		200
	];

        if !(_possibleBases isEqualTo []) then {
		_taskDataStore setVariable ["flag_built", true];
                ["SUCCEEDED"] call _fnc_finishSubtask;
        };
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if (
		_taskDataStore getVariable ["hq_sites_destroyed", false]
		&& _taskDataStore getVariable ["factory_sites_destroyed", false]
	) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	deleteMarker "activeZoneCircle";
}];
