/*
	File: fn_force_team_change.sqf
	Author: Savage Game Design
	Public: No

	Description:
		Forces a player to switch to the given team.

	Parameter(s):
		_player - Player to force the team switch on [Object]
		_team - Name of the team [String]

	Returns: nothing

	Example(s):
		[player, "MikeForce"] call vn_mf_fnc_force_team_change
*/

params ["_player", "_team"];

private _playerGroup = _player getVariable ["vn_mf_db_player_group", "FAILED"];
private _playerGroupArray = missionNamespace getVariable [_playerGroup,[]];
private _playerUID = getPlayerUID _player;
private _isWhitelisted = [_player, _team] call para_g_fnc_db_check_whitelist;

if (_isWhitelisted) then {
	_player setVariable ["vn_mf_db_player_group", _team, true]; 
} else {
	_player setVariable ["vn_mf_db_player_group", "MikeForce", true]; 	
	_team = "MikeForce";
};

["changedTeams", [_player, _team]] call para_g_fnc_event_dispatch;

// Remove the player from their original team's group array
missionNamespace setVariable [_playerGroup, _playerGroupArray - [_player]];
publicVariable _playerGroup;

// add them to the new group
private _nextPlayerGroup = _player getVariable ["vn_mf_db_player_group", "FAILED"]; //did vn_mf_db_player_group fail to set?
private _nextPlayerGroupArray = missionNamespace getVariable [_nextPlayerGroup, []];
_nextPlayerGroupArray pushBackUnique _player;

missionNamespace setVariable [_nextPlayerGroup, _nextPlayerGroupArray];
publicVariable _nextPlayerGroup;

[[_team], {
	[] call vn_mf_fnc_task_refresh_tasks_client;
	[] call vn_mf_fnc_tr_overview_team_update;
	[] call vn_mf_fnc_update_channels;
}] remoteExec ["spawn", _player];

[] remoteExecCall ["vn_mf_fnc_apply_unit_traits", _player];