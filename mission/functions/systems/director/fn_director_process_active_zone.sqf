/*
    File: fn_director_process_active_zone.sqf
    Author: Spoffy
    Date: 2023-01-07
    Last Update: 2023-01-07
    Public: Yes
    
    Description:
	   	Checks the current status of the zone, and handles the flow for that zone if needed.
		For example, creating a new task or completing the zone.
    
    Parameter(s):
		_zone - The zone name [STRING]
    
    Returns:
	   	Nothing
    
    Example(s):
		["zone_ba_ria"] call vn_mf_fnc_director_process_active_zone;
*/

params ["_zone"];

if !(_zone in mf_s_dir_activeZones) exitWith {
	["WARNING", format ["Attempted to process inactive zone '%1'", _zone]] call para_g_fnc_log;
};

private _zoneInfo = mf_s_dir_activeZones get _zone;

private _currentState = _zoneInfo get "state";
private _task = _zoneInfo get "currentTask";
private _taskIsCompleted = [_task] call vn_mf_fnc_task_is_completed;
private _taskResult = _task getVariable ["taskResult", ""];

if (_taskIsCompleted) then {

	/*
	Preparation phase has ended.

	Either:
	(a) all site compositions generated and players did not enter zone (move to capture)
	(b) players entered the zone (move to go_away)
	*/
	if (_currentState isEqualTo "prepare") exitWith {

		["INFO", format ["Zone '%1' preparation successful, moving to 'capture'", _zone]] call para_g_fnc_log;

		// players didn't enter the AO, we're okay to move on to capture phase
		private _captureTask = ((["capture_zone", _zone] call vn_mf_fnc_task_create) # 1);

		_zoneInfo set ["state", "capture"];
		_zoneInfo set ["currentTask", _captureTask];
	};

	/*
	All capture site sub tasks have been completed. End of the capture phase.

	Trigger the Zone's counterattack state.
	*/

	if (_currentState isEqualTo "capture") exitWith {

		["INFO", format ["Zone '%1' captured, moving to 'counterattack'", _zone]] call para_g_fnc_log;

		private _counterattackTask = ((["defend_counterattack", _zone, [["prepTime", 180]]] call vn_mf_fnc_task_create) # 1);
		_zoneInfo set ["state", "counterattack"];
		_zoneInfo set ["currentTask", _counterattackTask];
	};

	/*
	Counterattack results are in!

	Do some clean up (remove dc respawns/compositions) then either:

	(a) counterattack phase failed -- reset back to prepare phase (players need to leave zone).
	(b) counterattack phase successful -- close the zone (opening a new zone after).
	*/

	if (_currentState isEqualTo "counterattack") exitWith {

		// delete DC spawns etc.
		{
		    private _marker = _x # 0;
		    private _respawnID = _x # 1;

		    _respawnID call BIS_fnc_removeRespawnPosition;
		    deleteMarker _marker;
		} forEach vn_dc_adhoc_respawns;

		// delete all site composition objects.
		{
		    deleteVehicle _x;
		} forEach vn_site_objects;

		if (_taskResult isEqualTo "FAILED") exitWith {

			/*
			TODO -- this is probably going to cause us problems with site generation
			and might require a new intermediate phase to ask players to leave the AO.
			*/

			["INFO", format ["Zone '%1' defend against counterattack failed, moving to 'prepare' phase", _zone]] call para_g_fnc_log;
			// private _zoneData = mf_s_zones select (mf_s_zones findIf {_zone isEqualTo (_x select struct_zone_m_marker)});
			// [[_zoneData]] call vn_mf_fnc_sites_generate;

			private _prepareTask = ((["prepare_zone", _zone] call vn_mf_fnc_task_create) # 1);
			_zoneInfo set ["state", "prepare"];
			_zoneInfo set ["currentTask", _prepareTask];
		};

		["INFO", format ["Zone '%1' counterattack successfully defended against, completing zone", _zone]] call para_g_fnc_log;
		// Task is finished, and hasn't failed
		[_zone] call vn_mf_fnc_director_complete_zone;
	};
};

