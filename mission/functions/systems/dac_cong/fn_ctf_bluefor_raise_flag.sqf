/*
    File: fn_ctf_bluefor_raise_flag.sqf
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

private _startingFlagHeight = flagAnimationPhase _target;
private _newHeight = _startingFlagHeight + (1 / _maxProgress);

if (_newHeight >= 1) exitWith {
    allPlayers apply {["BlueforRaisedFlag", []] remoteExec ["para_c_fnc_show_notification", _x]};
    _target setFlagAnimationPhase 1;
};

_target setFlagAnimationPhase _newHeight;
