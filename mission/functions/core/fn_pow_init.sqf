/*
	File: fn_pow_init.sqf
	Author: Cerebral
	Public: No

	Description:
		Initialises pow system

	Parameter(s): none

	Returns: nothing

	Example(s):
		[] call vn_mf_fnc_pow_init
*/

vn_mf_cages = []; 
vn_dc_cages = []; 
 
{  
	private _logicName = vehicleVarName _x;  
  
	if (_logicName find "vn_mf_capture_" != -1) then { vn_mf_cages pushBack (getPosASL _x); }; 
	if (_logicName find "vn_dc_capture_" != -1) then { vn_dc_cages pushBack (getPosASL _x); }; 
} forEach allMissionObjects "Logic"; 
 
publicVariable "vn_mf_cages"; 
publicVariable "vn_dc_cages";