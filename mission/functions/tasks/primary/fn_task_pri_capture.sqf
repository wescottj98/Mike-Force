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

	private _areaMarker = createMarker ["activeZoneCircle", _zonePosition];
	_areaMarker setMarkerShape "ELLIPSE";
	_areaMarker setMarkerSize [1100, 1100];
	_areaMarker setMarkerAlpha 1;
	_areaMarker setMarkerBrush "Border";
	_areaMarker setMarkerColor "ColorYellow";

	private _hqPosition = missionNamespace getVariable ["hqPosition", _zoneposition];
	private _defendHqObj = [_hqPosition, 1, 1] call para_s_fnc_ai_obj_request_defend;

	private _factoryPosition = missionNamespace getVariable ["factoryPosition", _zoneposition];
	private _defendFactoryObj = [_factoryPosition, 1, 1] call para_s_fnc_ai_obj_request_defend;

	_taskDataStore setVariable ["aiObjectives", [_defendHqObj, _defendFactoryObj]];
	_taskDataStore setVariable ["startTime", serverTime];
	_taskDataStore setVariable ["hq_sites_destroyed", false];
	_taskDataStore setVariable ["factory_sites_destroyed", false];

	[[["locate_hq_intel", _zonePosition], ["locate_factory_intel", _zonePosition]]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["locate_hq_intel", {
	params ["_taskDataStore"];

	if (missionNamespace getVariable "hq_intel" findIf {isNull _x || damage _x >= 1} == -1) exitWith {};
	_taskDataStore setVariable ["hq_intel_found", true];

	private _hqPosition = missionNamespace getVariable ["hqPosition",[0,0,0]];
	private _hqSites = missionNamespace getVariable ["side_sites_hq", []];

	{
		private _markers = _x getVariable ["markers", []];
		{
			_x setMarkerAlpha 0.5;
		} forEach _markers;
	} forEach _hqSites;

	["SUCCEEDED", [["destroy_hq_sites", _hqPosition]]] call _fnc_finishSubtask;
}];

_taskDataStore setVariable ["locate_factory_intel", {
	params ["_taskDataStore"];

	if (missionNamespace getVariable "factory_intel" findIf {isNull _x || damage _x >= 1} == -1) exitWith {};
	_taskDataStore setVariable ["factory_intel_found", true];

	private _factoryPosition = missionNamespace getVariable ["factoryPosition",[0,0,0]];
	private _factorySites = missionNamespace getVariable ["side_sites_factory", []];

	{
		private _markers = _x getVariable ["markers", []];
		{
			if((_x find "AA_zone_") >= 0) then {
				_x setMarkerAlpha 0.3;
			} else {
				_x setMarkerAlpha 0.5;
			};
		} forEach _markers;
	} forEach _factorySites;

	["SUCCEEDED", [["destroy_factory_sites", _factoryPosition]]] call _fnc_finishSubtask;
}];

_taskDataStore setVariable ["destroy_hq_sites", {
	params ["_taskDataStore"];

	private _numberOfSites = count (missionNamespace getVariable ["side_sites_hq",[]]);
	if (_numberOfSites == 0) exitWith
	{
		_taskDataStore setVariable ["hq_sites_destroyed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["destroy_factory_sites", {
	params ["_taskDataStore"];

	private _numberOfSites = count (missionNamespace getVariable ["side_sites_factory",[]]);
	if (_numberOfSites == 0) exitWith
	{
		_taskDataStore setVariable ["factory_sites_destroyed", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if (
		_taskDataStore getVariable ["hq_intel_found", false]
		&& _taskDataStore getVariable ["factory_intel_found", false]
		&& _taskDataStore getVariable ["hq_sites_destroyed", false]
		&& _taskDataStore getVariable ["factory_sites_destroyed", false]
	) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	private _zone = _taskDataStore getVariable "taskMarker";

	_taskDataStore getVariable "aiObjectives" apply {[_x] call para_s_fnc_ai_obj_finish_objective};

	deleteMarker "activeZoneCircle";

	_zone setMarkerColor "ColorYellow";
	_zone setMarkerBrush "DiagGrid";
	private _taskStore = ((["defend_counterattack", _zone, [["prepTime", 180]]] call vn_mf_fnc_task_create) # 1);

	//Put the besieged zone off to the side for now to prevent an infinite loop
	private _selectZone = mf_s_activeZones findIf {_zone isEqualTo (_x select struct_zone_m_marker)};
	mf_s_siegedZones pushBack [_zone, _taskStore];
	mf_s_activeZones deleteAt _selectZone;

}];
