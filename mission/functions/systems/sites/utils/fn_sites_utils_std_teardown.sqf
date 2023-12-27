/*
	File: fn_sites_utils_std_teardown.sqf
	Author: "DJ" Dijksterhuis
	Public: No
	
	Description:
		Tears down a site in standardised manner.
	
	Parameter(s):
		_siteStore - Site store object.
		_markers - [OPTIONAL] Boolean whether to remove markers or not.
		_objects - [OPTIONAL] Boolean whether to remove objects or not.
		_ai - [OPTIONAL] Boolean whether to remove ai objectives or not.
	
	Returns:
		None
	
	Example(s):
 		[_siteStore] call vn_mf_fnc_sites_utils_do_teardown;
		[_siteStore, true, false, false] call vn_mf_fnc_sites_utils_do_teardown;
		[_siteStore, true, true, false] call vn_mf_fnc_sites_utils_do_teardown;
*/


params [
	"_siteStore", 
	["_markers", true], 
	["_objects", true], 
	["_ai", true]
];

if (_markers) then {
	((_siteStore getVariable "markers") apply {deleteMarker _x})
};

if (_objects) then {
	((_siteStore getVariable "objectsToDestroy") apply {deleteVehicle _x})
};

if (_ai) then {
	((_siteStore getVariable ["aiObjectives", []]) apply {[_x] call para_s_fnc_ai_obj_finish_objective})
};
