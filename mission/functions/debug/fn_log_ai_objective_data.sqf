/*
    File: fn_log_performance_data.sqf
    Author: Savage Game Design
    Public: No

    Description:
    Logs a line of performance data

    Parameter(s): None

    Returns: Nothing

    Example(s):
		call vn_mf_fnc_init_performance_logging
*/


["INFO", format ["Current AI Objectives:%1", count para_s_ai_obj_objectives]] call para_g_fnc_log;

para_s_ai_obj_objectives apply {
	private _msg = format [
		"AI Obj: ID: %1, Type: %2, Priority: %3, Groups: %4, AliveUnits: %5, FixedUnitCount: %6, ScalingFactor: %7, DesiredCount: %8, SquadSize: %9, ReinforceFactor: %10, ReinforceRemain: %11",
		_x getVariable ["id", objNull],
		_x getVariable ["type", objNull],
		_x getVariable ["priority", objNull],
		count (_x getVariable ["assignedGroups", []]),
		_x getVariable ["total_alive_units", objNull],
		_x getVariable ["fixed_unit_count", objNull],
		_x getVariable ["scaling_factor", objNull],
		_x getVariable ["desired_unit_count", objNull],
		_x getVariable ["squad_size", objNull],
		_x getVariable ["reinforcements_factor", objNull],
		_x getVariable ["reinforcements_remaining", objNull]
	];
	["INFO", _msg] call para_g_fnc_log;
};
