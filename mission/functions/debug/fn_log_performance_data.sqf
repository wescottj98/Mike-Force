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

private _allUnits = allUnits;
private _deadUnitCount = {!alive _x} count _allUnits;
private _enemyUnitCount = {side _x == east} count _allUnits;
private _vehicleCount = count vehicles;


private _message = format [
  "ServerFPS:%1, Players:%2, DeadUnits:%3, EnemyUnits:%4, AllUnits:%5, AllVehicles:%6",
  diag_fps,
  count allPlayers,
  _deadUnitCount,
  _enemyUnitCount,
  count _allUnits,
  _vehicleCount
];

["INFO", _message] call para_g_fnc_log;