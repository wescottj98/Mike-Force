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
		False if a player is on the same side [Boolean]
	
	Example(s):
		[_player, _target] call vn_mf_fnc_check_side;
*/

params ["_player", "_target"];

private _playerSide = _player getVariable "vn_mf_side";
private _targetSide = _target getVariable "vn_mf_side";
private _result = true;

if ((_playerSide == west || _playerSide == independent) &&
	(_targetSide == west || _targetSide == independent)) then 
{
	_result = false;
};

if ((_playerSide == east) &&
	(_targetSide == east)) then 
{
	_result = false;
};

_result
