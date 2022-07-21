/*
	File: fn_action_capture_player.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Capture a incapacitated opponent
	
	Parameter(s): none
	
	Returns:
	
	Example(s):
		call vn_mf_fnc_action_capture_player;
*/

params ["_player"];

[
	_player,											// Object the action is attached to
	format ["<t color='#0000FF'>%1</t>", localize 'STR_vn_mf_capture_player'],							// Title of the action
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",	// Idle icon shown on screen
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_secure_ca.paa",	// Progress icon shown on screen
	"side _this != side _target && _this distance _target <= 3 && {_target isKindOf 'Man' && {alive _target && { [_target] call vn_fnc_revive_moving && {[_this] call vn_fnc_revive_moving && { [_target] call vn_fnc_revive_incap && { !([_this] call vn_fnc_revive_incap) }}}}}}",	// Condition for the action to be shown
	"_this distance _target < 5",						// Condition for the action to progress
	{},	// Code executed when action starts
	{},	// Code executed on every progress tick
	{
		[_target] call vn_mf_fnc_capture_player;
	},// Code executed on completion
	{},	// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	1,													// Action duration [s]
	100,													// Priority
	false,											// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;
