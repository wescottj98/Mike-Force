/*
	File: fn_action_destroy_respawn.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Pops a respawn building
	
	Parameter(s): none
	
	Returns:
	
	Example(s):
		call vn_mf_fnc_action_destroy_respawn;
*/


[
	player,											// Object the action is attached to
	localize "STR_vn_mf_destroy_respawn",							// Title of the action
	"custom\holdactions\holdAction_destroy_ca.paa",	// Idle icon shown on screen
	"custom\holdactions\holdAction_destroy_ca.paa",	// Progress icon shown on screen
	"(typeOf cursorObject == 'Land_vn_o_platform_04' && player distance cursorObject < 5 && side player != east)",	// Condition for the action to be shown
	"player distance cursorObject < 5",						// Condition for the action to progress
	{},	// Code executed when action starts
	{},	// Code executed on every progress tick
	{
		[cursorObject, player] remoteExec ["vn_mf_fnc_destroy_task", 2];
	},// Code executed on completion
	{},	// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	5,													// Action duration [s]
	100,													// Priority
	false,											// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;
