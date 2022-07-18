
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
	_zone setMarkerColor "ColorBlue";
	_zone setMarkerBrush "DiagGrid";

	_taskDataStore setVariable ["startTime", serverTime];

	["AttackPreparing", ["", ((serverTime + 300) / 60) toFixed 0]] remoteExec ["para_c_fnc_show_notification", 0];
	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
	["Attack Operation preparation", serverTime + 300, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;

	[[
		["prepare", getMarkerPos "starting_point"]
	]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["prepare", {
	params ["_taskDataStore"];

	private _startTime = _taskDataStore getVariable ["startTime", 0];

	if(_startTime == 0) exitWith
	{
		_taskDataStore setVariable ["prepared", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};

	private _secondsPassed = serverTime - _startTime;
	private _minutesPassed = _secondsPassed / 60;

	if (_minutesPassed >= 5) exitWith
	{
		_taskDataStore setVariable ["prepared", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if ( _taskDataStore getVariable ["prepared", false] ) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	private _zone = _taskDataStore getVariable "taskMarker";
	[_zone] call vn_mf_fnc_sites_generate;
	_taskStore = ["capture_zone", _zone] call vn_mf_fnc_task_create;
	_zone setMarkerColor "ColorRed";
	_zone setMarkerBrush "DiagGrid";
}];
