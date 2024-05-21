/*
	File: fn_player_can_enter_vehicle.sqf
	Author: Savage Game Design
	Public: No

	Description:
		Check if the player can enter the vehicle.
		'DJ' Note -- this is a basic authorization/permissions check (AuthZ)

	Parameter(s):
	_player - Player that wants to enter [Object]
	_role - Role in the vehicle they want to enter [String]
	_vehicle - Vehicle that the player is entering [Object]

	Returns:
		Can they enter the vehicle? [Boolean]

	Example(s): none
*/


/* Local function to check player AuthZ */
private _fnc_player_is_authorized = {
	params ["_vehicle", "_player"];

	private _teamsVehicleIsLockedTo = _vehicle getVariable ["teamLock", []];
	private _playerGroup = _player getVariable ["vn_mf_db_player_group", "FAILED"];

	if (!(_teamsVehicleIsLockedTo isEqualTo [])) then {
		_teamsVehicleIsLockedTo = _teamsVehicleIsLockedTo select 0;
	};

	if (
		_playerGroup in _teamsVehicleIsLockedTo
		|| typeName _teamsVehicleIsLockedTo != "ARRAY"
		|| count(_teamsVehicleIsLockedTo) isEqualTo 0
	) exitWith {true};

	false
};

params ["_player", "_role", "_vehicle"];

/* statics -- only AuthZ'd players */
if (_vehicle isKindOf "StaticWeapon") exitWith {
	[_vehicle, _player] call _fnc_player_is_authorized
};

private _isCopilot = (getNumber ([_vehicle, _vehicle unitTurret _player] call BIS_fnc_turretConfig >> "isCopilot") > 0);

/*
other vehicles

- only authZ'd players can get in as pilot/driver/copilot
- all players can get in as passangers
*/

if (_role == "driver" || _isCoPilot) exitWith {
	[_vehicle, _player] call _fnc_player_is_authorized
};

true
