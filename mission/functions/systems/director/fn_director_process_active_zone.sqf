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

		private _zone = _taskDataStore getVariable "taskMarker";
		private _areaMarkerName = _taskDataStore getVariable "areaMarkerName";
		deleteMarker _areaMarkerName;

		if (_taskResult isEqualTo "FAILED") exitWith {

			// players have borked the compositions (probably).
			// switch the zone to the 'go away' task
			["INFO", format ["Zone '%1' preparation failed, moving to 'go_away'", _zone]] call para_g_fnc_log;
			private _goAwayTask = ((["go_away_zone", _zone] call vn_mf_fnc_task_create) # 1);

			_zoneInfo set ["state", "go_away"];
			_zoneInfo set ["currentTask", _goAwayTask];
		};

		["INFO", format ["Zone '%1' preparation successful, moving to 'capture'", _zone]] call para_g_fnc_log;

		// players didn't enter the AO, we're okay to move on to capture phase
		private _captureTask = ((["capture_zone", _zone] call vn_mf_fnc_task_create) # 1);

		_zoneInfo set ["state", "capture"];
		_zoneInfo set ["currentTask", _captureTask];
	};

	/*
	Players have left the zone now.

	Trigger a new prepare phase for the zone.
	*/

	if (_currentState isEqualTo "go_away") exitWith {

		["INFO", format ["Zone '%1' players are no longer in zone, moving to 'prepare'", _zone]] call para_g_fnc_log;

		private _zone = _taskDataStore getVariable "taskMarker";
		private _areaMarkerName = _taskDataStore getVariable "areaMarkerName";
		deleteMarker _areaMarkerName;

		// start the prepare task again
		private _prepareTask = ((["prepare_zone", _zone] call vn_mf_fnc_task_create) # 1);

		_zoneInfo set ["state", "prepare"];
		_zoneInfo set ["currentTask", _prepareTask];

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

	If failed, reset back to the capture state.
	Otherwise close the zone.
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

		private _zone = _taskDataStore getVariable "taskMarker";

		if (_taskResult isEqualTo "FAILED") exitWith {

			/*
			TODO -- this is probably going to cause us problems with site generation
			and might require a new intermediate phase to ask players to leave the AO.
			*/

			["INFO", format ["Zone '%1' defend against counterattack failed, moving to 'go_away' phase", _zone]] call para_g_fnc_log;
			private _zoneData = mf_s_zones select (mf_s_zones findIf {_zone isEqualTo (_x select struct_zone_m_marker)});
			[[_zoneData]] call vn_mf_fnc_sites_generate;

			private _goAwayTask = ((["go_away_zone", _zone] call vn_mf_fnc_task_create) # 1);
			_zoneInfo set ["state", "go_away"];
			_zoneInfo set ["currentTask", _goAwayTask];
		};

		["INFO", format ["Zone '%1' counterattack successfully defended against, completing zone", _zone]] call para_g_fnc_log;
		// Task is finished, and hasn't failed
		[_zone] call vn_mf_fnc_director_complete_zone;
	};
};

