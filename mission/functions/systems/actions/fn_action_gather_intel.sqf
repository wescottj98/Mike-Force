params ["_intel"];

[
	_intel,		// Object the action is attached to
	"Gather Enemy Intel",		// Title of the action
	"custom\holdactions\holdAction_documents_ca.paa",	// Idle icon shown on screen
	"custom\holdactions\holdAction_documents_ca.paa",	// Progress icon shown on screen
	"_this distance _target <= 8 && side _this != east",	// Condition for the action to be shown
	"_this distance _target <= 8",						// Condition for the action to progress
	{},	// Code executed when action starts
	{},	// Code executed on every progress tick
	{
		deleteVehicle _target;
	},// Code executed on completion
	{},	// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	5,													// Action duration [s]
	100,													// Priority
	false,											// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;
