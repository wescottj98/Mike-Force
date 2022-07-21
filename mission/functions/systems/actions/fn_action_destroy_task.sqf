/*
	File: fn_action_destroy_task.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Pops a task
	
	Parameter(s): none
	
	Returns:
	
	Example(s):
		_task call vn_mf_fnc_action_destroy_task;
*/
params ["_task"];

[
	_task,											// Object the action is attached to
	localize "STR_vn_mf_destroy_task",							// Title of the action
	"custom\holdactions\holdAction_destroy_ca.paa",	// Idle icon shown on screen
	"custom\holdactions\holdAction_destroy_ca.paa",	// Progress icon shown on screen
	"_this distance _target <= 8 && side _this != east",	// Condition for the action to be shown
	"_this distance _target <= 8",						// Condition for the action to progress
	{},	// Code executed when action starts
	{},	// Code executed on every progress tick
	{
		[_target] call vn_mf_fnc_destroy_task;
	},// Code executed on completion
	{},	// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	5,													// Action duration [s]
	100,													// Priority
	false,											// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;
