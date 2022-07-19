/*
    File: fn_sites_create_hq.sqf
    Author: Savage Game Design
    Public: No
    
    Description:
		Creates a new HQ site in the given location.
    
    Parameter(s):
		_pos - Position to spawn the HQ site at
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [markerPos "myHq"] call vn_mf_fnc_sites_create_hq
*/

params ["_pos"];

[
	"hq",
	_pos,
	"hq",
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		missionNamespace getVariable ["current_hq", _siteStore];

		_hqObjects = [_spawnPos] call vn_mf_fnc_create_hq_buildings;
		private _objectsToDestroy = _hqObjects select {_x in ["Land_vn_pavn_launchers", "vn_b_ammobox_01", "Land_vn_pavn_weapons_wide", "Land_vn_pavn_weapons_cache", "Land_vn_pavn_ammo", "Land_vn_pavn_weapons_stack1", "Land_vn_pavn_weapons_stack2",
							   "Land_vn_pavn_weapons_stack3", "vn_b_ammobox_full_02", "vn_o_ammobox_wpn_04", "vn_o_ammobox_full_03", "vn_o_ammobox_full_07", "vn_o_ammobox_full_06", "StaticWeapon"]};
		private _intel = _hqObjects select {typeOf _x == "Land_Map_unfolded_F"};
		missionNamespace setVariable ["hq_intel", _intel];
		missionNamespace setVariable ["hqPosition", _pos];

		{
			private _objectType = typeOf _x;

			if(_objectType in ["vn_o_prop_t102e_01", "Land_WoodenTable_small_F", "Land_vn_lobby_table", "Land_Map_unfolded_F", "Land_vn_pavn_launchers", "vn_b_ammobox_01", "Land_vn_pavn_weapons_wide", "Land_vn_pavn_weapons_cache", "Land_vn_pavn_ammo", "Land_vn_pavn_weapons_stack1", "Land_vn_pavn_weapons_stack2",
							   "Land_vn_pavn_weapons_stack3", "vn_b_ammobox_full_02", "vn_o_ammobox_wpn_04", "vn_o_ammobox_full_03", "vn_o_ammobox_full_07", "vn_o_ammobox_full_06", "StaticWeapon"]) then {
				[_x, true] call para_s_fnc_enable_dynamic_sim;
			};
		} forEach _hqObjects;

		{
			[_x, true] call para_s_fnc_enable_dynamic_sim;
		} forEach _objectsToDestroy;

		//Create a HQ marker.
		private _markerPos = _spawnPos getPos [20 + random 30, random 360];
		private _hqMarker = createMarker [format ["HQ_%1", _siteId], _markerPos];
		_hqMarker setMarkerType "o_hq";
		_hqMarker setMarkerText "HQ";
		_hqMarker setMarkerAlpha 0;
	
		private _guns = _hqObjects select {_x isKindOf "StaticWeapon"};
		private _objectives = [];
		{
			_objectives pushBack ([_x] call para_s_fnc_ai_obj_request_crew);
		} forEach _guns;
		_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);

		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["markers", [_hqMarker]];
		_siteStore setVariable ["staticGuns", _guns];
		_siteStore setVariable ["vehicles", _hqObjects]; 
		_siteStore setVariable ["objectsToDestroy", _objectsToDestroy];
	},
	//Teardown condition check code
	{
		//Check if we need to teardown every 15 seconds.
		15 call _fnc_periodicallyAttemptTeardown;
	},
	//Teardown condition
	{
		params ["_siteStore"];

		true
	},
	//Teardown code
	{
		params ["_siteStore"];

		private _objectsToDestroy = _siteStore getVariable "objectsToDestroy";
		private _respawnToDelete = _siteStore getVariable "respawnPointsDC";

		{
			deleteVehicle _x;
		} forEach _objectsToDestroy;

		{
			deleteMarker _x;
		} forEach (_siteStore getVariable "markers");
	}
] call vn_mf_fnc_sites_create_site;