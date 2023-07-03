/*
	File: fn_player_markers_delete_marker.sqf
	Author: Savage Game Design
	Public: No
	
	Description:
	    EVent Handler for when a player deletes a marker
	
	Parameter(s): none
	
	Returns: nothing
	
	Example(s):
	    call vn_mf_fnc_player_markers_delete_marker;
*/

params ["_marker", "_local"];

if (!(_local)) exitWith {};

{
	private _inMACV = [_x, "MACV"] call para_g_fnc_db_check_whitelist;
	private _instigatorIsMACV = [player] call para_g_fnc_db_check_curator;
	//if (_instigatorIsMACV) then { continue };
	if !(_inMACV) then { continue };
	
	systemChat format ["[MACV] %1 has deleted a map marker. Contents: %2", name player, markerText _marker];
	["AdminLog", [format ["%1 has deleted a map marker.", name player]]] remoteExec ["para_c_fnc_show_notification", _x];
} forEach allPlayers;