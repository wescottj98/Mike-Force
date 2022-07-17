/*
	File: fn_create_tunnel_buildings.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Creates buildings for a tunnel.
	
	Parameter(s):
		_position - Position [Position]
	
	Returns: nothing
	
	Example(s): none
	
	0: STRING	- Classname
	1: ARRAY	- Position [delta X, delta Y, z]
	2: NUMBER	- Azimuth
	3: NUMBER	- Fuel
	4: NUMBER	- Damage
	5: ARRAY	- Return from BIS_fnc_getPitchBank (only if 2nd param is true)
	6: STRING	- vehicleVarName
	7: STRING	- Initialization commands
	8: BOOLEAN	- Enable simulation
	9: BOOLEAN	- Position is ASL
*/

params ["_position"];

private _tunnel = [["Land_vn_o_trapdoor_01", _position] call para_g_fnc_create_vehicle, [], grpNull];
		
private _vehicles = [_tunnel select 0];
private _units = _tunnel select 1;
private _groups = [_tunnel select 2];

[[_vehicles, _units, _groups], [_tunnel select 0]]