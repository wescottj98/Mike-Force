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

removeAllAssignedItems _target;
removeAllItems _target;
removeAllWeapons _target;
removeAllContainers _target;
removeGoggles _target;
removeHeadgear _target;

_target forceAddUniform (selectRandom ["vn_o_uniform_nva_army_01_02","vn_o_uniform_nva_army_02_01","vn_o_uniform_nva_army_01_01","vn_o_uniform_nva_army_03_02","vn_o_uniform_nva_army_02_02","vn_o_uniform_nva_army_03_01"]);
_target addItem "FirstAidKit";
_target addItem "FirstAidKit";
_target addItem "FirstAidKit";
_target addItem "FirstAidKit";

private _message = format ["%1 has captured %2!", name player, name _target];
private _nearbyCages = nearestObjects [getPos _target, ["Logic"], 10, false];
if (count _nearbyCages != 0) exitWith {
	["CagesTooClose", ["Prisoner is already captured!"]] call para_c_fnc_show_notification;
};



if(player getVariable 'vn_mf_side' == east) then {
	private _cage = selectRandom vn_mf_cages;
	["POWCapturedRed", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];

	_target setPosASL _cage;
} else {
	private _cage = selectRandom vn_dc_cages;
	["POWCapturedBlue", [_message]] remoteExec ["para_c_fnc_show_notification", allPlayers];

	_target setPosASL _cage;
};


