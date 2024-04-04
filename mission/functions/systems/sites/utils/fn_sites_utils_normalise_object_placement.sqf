/*
	File: fn_sites_utils_normalise_object_placement.sqf
	Author: 'DJ' Dijksterhuis
	Public: No
	
	Description:
		Given a object:
			1. set the correct 'up' vector (perpendiculalr to the terrain's gradient).
			2. set the z-coord AGSL pos SLIGHTLY above ground so that
				a. on terrain with changing graidents, the object doesn't clip through ground.
				b. when sim kicks in the object is flat on ground.

	
	Parameter(s):
		_obj - object to normalise placement
	
	Returns:
		Nothing
	
	Example(s):
		[_myObj] call vn_mf_fnc_sites_utils_normalise_object_placement;
		_myObjs apply {[_x] call vn_mf_fnc_sites_utils_normalise_object_placement};
*/

params ["_obj"];

_obj setVectorUp (surfaceNormal getPos _obj);

// place objects SLIGHTLY above ground to account for gradient variations
_obj setPos [getPos _obj # 0, getPos _obj # 1, 0.1];
