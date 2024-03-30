/*
	File: fn_sites_utils_normalise_object_placement.sqf
	Author: 'DJ' Dijksterhuis
	Public: No
	
	Description:
		
	
	Parameter(s):
		_zone - Zone marker name [STRING]
	
	Returns:
		Task Data store [NAMESPACE]
	
	Example(s):
		["zone_saigon"] call vn_mf_fnc_zones_create_artillery_site
*/

params ["_obj"];

_obj setVectorUp (surfaceNormal getPos _obj);

// place objects SLIGHTLY above ground to account for gradient variations
_obj setPos [getPos _obj # 0, getPos _obj # 1, 0.1];
