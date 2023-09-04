/*
	File: fn_zones_create_aa_site.sqf
	Author: Savage Game Design
	Modified: @dijksterhuis
	Public: No
	
	Description:
		Creates an AA site in the given zone.
		(An 'AA' site is 1x ZPU that needs to be destroyed)
	
	Parameter(s):
		_zone - Zone marker name [STRING]
	
	Returns:
		Task data store [NAMESPACE]
	
	Example(s):
		["zone_saigon"] call vn_mf_fnc_zones_create_aa_site
*/

params ["_pos"];

[
	"aa",
	_pos,
	"factory",
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		private _objects = [_spawnPos] call vn_mf_fnc_create_aa_buildings;

		vn_site_objects append _objects;

		_objects apply {
			[_x, true] call para_s_fnc_enable_dynamic_sim;
			createVehicleCrew _x;
		};

		private _markerPos = _spawnPos getPos [10 + random 20, random 360];

		private _aaMarker = createMarker [format ["AA_%1", _siteId], _markerPos];
		_aaMarker setMarkerType "o_antiair";
		_aaMarker setMarkerText "AA";
		_aaMarker setMarkerAlpha 0;

		_siteStore setVariable ["aiObjectives", [_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend];
		_siteStore setVariable ["markers", [_aaMarker]];
		_siteStore setVariable ["objectsToDestroy", _objects];
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