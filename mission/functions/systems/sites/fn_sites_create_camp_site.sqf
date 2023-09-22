/*
    File: fn_sites_create_camp_site.sqf
    Author: Cerebral
    Public: No
    
    Description:
		Creates a new Factory site in the given location.
    
    Parameter(s):
		_pos - Position to spawn the HQ site at
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [markerPos "myHq"] call vn_mf_fnc_sites_create_camp_site
*/

params ["_pos"];

[
	"camp",
	_pos,
	"hq",
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		private _campObjs = [_spawnPos] call vn_mf_fnc_create_camp_buildings;

		{
			if(_x isKindOf "StaticWeapon" || _x isKindOf "Building" || _x isKindOf "House" || _x isKindOf "LandVehicle" || _x isKindOf "Air") then {
				[_x, true] call para_s_fnc_enable_dynamic_sim;
			};
		} forEach _campObjs;

		vn_site_objects append _campObjs;

		private _campObjectiveTypes = [
			"Land_vn_o_shelter_06",
			"Land_vn_pavn_launchers",
			"vn_b_ammobox_01",
			"Land_vn_pavn_weapons_wide",
			"Land_vn_pavn_weapons_cache",
			"Land_vn_pavn_ammo",
			"Land_vn_pavn_weapons_stack1",
			"Land_vn_pavn_weapons_stack2",
			"Land_vn_pavn_weapons_stack3",
			"vn_b_ammobox_full_02",
			"vn_o_ammobox_wpn_04",
			"vn_o_ammobox_full_03",
			"vn_o_ammobox_full_07",
			"vn_o_ammobox_full_06"
		];

		private _objectsToDestroy = _campObjs select {typeOf _x in _campObjectiveTypes};
		_objectsToDestroy apply {[_x, true] call para_s_fnc_enable_dynamic_sim};

		private _markerPos = _spawnPos getPos [10 + random 20, random 360];
		private _campMarker = createMarker [format ["Camp_%1", _siteId], _markerPos];
		_campMarker setMarkerType "o_recon";
		_campMarker setMarkerText "Camp";
		_campMarker setMarkerAlpha 0;

		private _staticWeapons = _campObjs select {_x isKindOf "StaticWeapon"};
		_staticWeapons apply {[_x, true] call para_s_fnc_enable_dynamic_sim};

		// 30% chance to spawn an ambush
		// @dijksterhuis: we don't assign AI to every camp site to save AI budget on other assignments
		// like tracker teams or factory/HQ/arty sites. 
		// also reduce the scaling factor (affects how many AI should be assigned to this specific location)
		if (random 1 < 0.3) then {
			_siteStore setVariable ["aiObjectives", [[_spawnPos, 0.5, 1] call para_s_fnc_ai_obj_request_ambush]];
		};

		_siteStore setVariable ["markers", [_campMarker]];
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
		//Teardown when all guns destroyed
		(_siteStore getVariable "objectsToDestroy" findIf {alive _x} == -1)
	},
	//Teardown code
	{
		params ["_siteStore"];

		{
			deleteMarker _x;
		} forEach (_siteStore getVariable "markers");

		private _objectsToDestroy = _siteStore getVariable "objectsToDestroy";
		{
			deleteVehicle _x;
		} forEach _objectsToDestroy;

		{
			[_x] call para_s_fnc_ai_obj_finish_objective;
		} forEach (_siteStore getVariable ["aiObjectives", []]);
	}
] call vn_mf_fnc_sites_create_site;