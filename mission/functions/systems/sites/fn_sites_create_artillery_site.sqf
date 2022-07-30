/*
	File: fn_zones_create_artillery_site.sqf
	Author: Savage Game Design
	Public: No
	
	Description:
		Creates an artillery site in the given zone.
	
	Parameter(s):
		_zone - Zone marker name [STRING]
	
	Returns:
		Task Data store [NAMESPACE]
	
	Example(s):
		["zone_saigon"] call vn_mf_fnc_zones_create_artillery_site
*/

params ["_pos"];

[
	"artillery",
	_pos,
	"factory",
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		private _artyObjs = [_spawnPos] call vn_mf_fnc_create_mortar_buildings;
		{
			if(_x isKindOf "StaticWeapon" || _x isKindOf "Building" || _x isKindOf "House" || _x isKindOf "LandVehicle" || _x isKindOf "Air") then {
				[_x, true] call para_s_fnc_enable_dynamic_sim;
			};
		} forEach _artyObjs;

		vn_site_objects append _artyObjs;

		private _objectsToDestroy = _artyObjs select {typeOf _x in ["vn_o_nva_navy_static_mortar_type63", "vn_o_nva_65_static_mortar_type53", "vn_o_nva_static_d44_01"]};

		private _markerPos = _spawnPos getPos [10 + random 20, random 360];
		private _artilleryMarker = createMarker [format ["Artillery_%1", _siteId], _markerPos];
		_artilleryMarker setMarkerType "o_art";
		_artilleryMarker setMarkerText "Arty";
		_artilleryMarker setMarkerAlpha 0;

		private _objectives = [];
		{
			//Disable weapon dissassembly - statics don't get deleted properly when disassembled, so it breaks the site/mission.
			[_x, true] call para_s_fnc_enable_dynamic_sim;
			_x enableWeaponDisassembly false;
			_objectives pushBack ([_x] call para_s_fnc_ai_obj_request_crew);
		} forEach _objectsToDestroy;
		_objectives pushBack ([_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend);

		_siteStore setVariable ["aiObjectives", _objectives];
		_siteStore setVariable ["markers", [_artilleryMarker]];
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

		{
			deleteVehicle _x;
		} forEach ((_siteStore getVariable "objectsToDestroy"));

		{
			[_x] call para_s_fnc_ai_obj_finish_objective;
		} forEach (_siteStore getVariable ["aiObjectives", []]);
	}
] call vn_mf_fnc_sites_create_site;