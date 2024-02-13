/*
	File: fn_sites_utils_std_check_teardown.sqf
	Author: "DJ" Dijksterhuis
	Public: No
	
	Description:
		Checks if an object is within a specified radius.
	
	Parameter(s):
		_siteStore - Site to check the teardown condition of.
		_radius - [OPTIONAL] radius of search area for aliveness.
	
	Returns:
		true if object is alive within radius, false otherwise
	
	Example(s):
 		[_siteStore] call vn_mf_fnc_sites_utils_std_check_teardown;
 		[_siteStore, 25] call vn_mf_fnc_sites_utils_std_check_teardown;
*/

params ["_siteStore", ["_radius", 50]];

private _pos = getPos _siteStore;
private _objects = _siteStore getVariable "objectsToDestroy";

// every object is ALIVE WITHIN specified radius
private _objectsAreAlive = _objects findIf {
	(alive _x) && (count ([_x] inAreaArray [_pos, _radius, _radius, 0, false]) > 0)
};

_objectsAreAlive == -1