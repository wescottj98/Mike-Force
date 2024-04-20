/*
    File: fn_ctf_opfor_lower_flag.sqf
    Author: "DJ" Dijksterhuis
    Public: No

    Description:
	   TODO

    Parameter(s):
        - _target
        - _progress
        - _maxProgress

    Returns: TODO

    Example(s):
	[_target] call vn_mf_fnc_capture_player;
*/


params ["_target", "_maxProgress"];

diag_log format [
    "FlagLower: target=%1 maxProgress=%2 start=%3", 
    _target, _maxProgress, flagAnimationPhase _target
];

private _startingFlagHeight = flagAnimationPhase _target;
private _newHeight = _startingFlagHeight - (1 / _maxProgress);

if (_newHeight <= 0) exitWith {
    deleteVehicle _target;
    allPlayers apply {["DacCongCapturedFlag", []] remoteExec ["para_c_fnc_show_notification", _x]};
};

_target setFlagAnimationPhase _newHeight;


