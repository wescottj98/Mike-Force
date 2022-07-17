/*
    File: fn_capture_player.sqf
    Author: Cerebral
    Public: No

    Description:
	Capture target player and strip/send them to the cages.

    Parameter(s): _target - [PLAYER]

    Returns: nothing

    Example(s):
	[_target] call vn_mf_fnc_capture_player;
*/
params ["_target"];

if !(isPlayer _target) exitWith {};

private _message = format ["%1 has captured %2!", name player, name _target];

removeAllWeapons _target;
removeAllContainers _target;
removeGoggles _target;
removeHeadgear _target;

private _nearbyCages = nearestObjects [getPos _target, ["Logic"], 10, false];
if (count _nearbyCages != 0) exitWith {
	["CagesTooClose", ["Prisoner is already captured!"]] call para_c_fnc_show_notification;
};

if(side _target != east) then {
	private _cage = selectRandom vn_dc_cages;
	["POWCapturedBlue", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];

	_target setPosASL _cage;
} else {
	private _cage = selectRandom vn_mf_cages;
	["POWCapturedRed", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];

	_target setPosASL _cage;
};
