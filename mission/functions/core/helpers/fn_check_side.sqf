/*
	File: fn_check_side.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Tests if a player is within a given radius of a position.
		Implement as a function, so we can optimise it easily later.
	
	Parameter(s):
		_player - Callee [OBJECT];
		_target - Target player [OBJECT];
	
	Returns:
		False if a player is not on the same side [Boolean]
	
	Example(s):
		[_player, _target] call vn_mf_fnc_check_side;
*/

params ["_player", "_target"];

if (isNil "_target") exitWith { _result };

private _playerSide = _player getVariable "vn_mf_side";
private _targetSide = _target getVariable "vn_mf_side";

if (isNil "_targetSide") exitwith { false };
if (_playerSide == _targetSide) exitWith { true };

false
