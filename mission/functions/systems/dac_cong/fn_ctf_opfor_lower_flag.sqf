/*
    File: fn_ctf_opfor_lower_flag.sqf
    Author: "DJ" Dijksterhuis
    Public: No

    Description:
       Lower the flag on clients and server simulateneously.

       Flags lowered on server are not visibly lowered on client and vice versa.

       So this script has to be executed on every machine.

    Parameter(s):
        - _target -- flag we'll be raising
        - _maxProgress -- maximum number of steps to lower the flag height with

    Returns: nothing

    Example(s):
	[_target, 4] call vn_mf_fnc_ctf_opfor_lower_flag;
*/

params ["_target", "_maxProgress"];

private _startingFlagHeight = flagAnimationPhase _target;
private _newHeight = _startingFlagHeight - (1 / _maxProgress);

if (isServer && _newHeight <= 0) exitWith {
    deleteVehicle _target;
};

_target setFlagAnimationPhase _newHeight;
