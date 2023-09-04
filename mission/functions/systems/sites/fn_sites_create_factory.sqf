/*
    File: fn_sites_create_factory.sqf
    Author: Cerebral
    Public: No
    
    Description:
		Creates a new Factory site in the given location.
    
    Parameter(s):
		_pos - Position to spawn the HQ site at
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [markerPos "myHq"] call vn_mf_fnc_sites_create_factory
*/

params ["_pos"];

[
	"factory",
	_pos,
	"factory",
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		missionNamespace getVariable ["current_factory", _siteStore];

		private _factoryObjects = [_spawnPos] call vn_mf_fnc_create_factory_buildings;
		private _intel = _factoryObjects select {typeOf _x == "Land_Map_unfolded_Malden_F"};
		missionNamespace setVariable ["factory_intel", _intel];
		missionNamespace setVariable ["factoryPosition", _pos];

		_intel call vn_mf_fnc_action_gather_intel;
		private _currentVehicles = vehicles;

		vn_site_objects append _factoryObjects;

		private _objectTypesToDestroy = ["Land_vn_wf_vehicle_service_point_east"];
		
		private _objectTypesForDynamicSim = [
			"Land_Map_unfolded_Malden_F",
			"Land_vn_wf_vehicle_service_point_east",
			"Land_vn_fuel_tank_stairs",
			"Land_Net_Fence_Gate_F"
		];

		private _fnc_dynSimKindOfChecker = {
			params ["_object"];
			(_x isKindOf "StaticWeapon" || _x isKindOf "Building" || _x isKindOf "House" || _x isKindOf "LandVehicle" || _x isKindOf "Air")
		};

		_factoryObjects apply {
			if(typeOf _x in _objectTypesToDestroy + _objectTypesForDynamicSim || [_x] call _fnc_dynSimKindOfChecker) then {
				[_x, true] call para_s_fnc_enable_dynamic_sim;
			};
		};

		_factoryObjects apply {
			if (_x in _currentVehicles) then {
				[_x, ["DacCong"]] call vn_mf_fnc_lock_vehicle_to_teams;
				vn_mf_dc_assets pushBack _x;
			};
		};

		//Create a factory marker.
		private _markerPos = _spawnPos getPos [20 + random 30, random 360];
		private _factoryMarker = createMarker [format ["factory_%1", _siteId], _markerPos];
		_factoryMarker setMarkerType "o_Ordnance";
		_factoryMarker setMarkerText "Factory";
		_factoryMarker setMarkerAlpha 0;

		private _factoryRespawnMarker = createMarker [format ["dc_respawn_adhoc_%1", _siteId], _markerPos];
		_factoryRespawnMarker setMarkerType "o_Ordnance";
		_factoryRespawnMarker setMarkerAlpha 0;
		
		private _respawnID = [east, _factoryRespawnMarker] call BIS_fnc_addRespawnPosition;
		private _respawnObj = createVehicle ["Land_vn_o_platform_04", _markerPos, [], 5, "NONE"];
		_respawnObj setVariable ["vn_respawn", [_factoryRespawnMarker, _respawnID]];
	
		vn_dc_adhoc_respawns pushBack [_factoryRespawnMarker, _respawnID];
		
		// 2x ai objectives to replace other factory / hq AI that never get freed in task system
		private _objectives = [
			[_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend,
			[_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend
		];

		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["markers", [_factoryMarker]];
		_siteStore setVariable ["staticGuns", _factoryObjects select {_x isKindOf "StaticWeapon"}];
		_siteStore setVariable ["vehicles", _factoryObjects]; 
		_siteStore setVariable ["objectsToDestroy", _factoryObjects select {typeOf _x in _objectTypesToDestroy}];
	},
	//Teardown condition check code
	{
		//Check if we need to teardown every 15 seconds.
		15 call _fnc_periodicallyAttemptTeardown;
	},
	//Teardown condition
	{
		params ["_siteStore"];

		(_siteStore getVariable "objectsToDestroy" findIf {alive _x} == -1)
	},
	//Teardown code
	{
		params ["_siteStore"];

		{
			deleteMarker _x;
		} forEach (_siteStore getVariable "markers");

		// release AI from associated objectives
		// note -- AI can vanish in front of players when this is executed
		_siteStore getVariable "aiObjectives" apply {[_x] call para_s_fnc_ai_obj_finish_objective};
	}
] call vn_mf_fnc_sites_create_site;