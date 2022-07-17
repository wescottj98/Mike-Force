/*
	File: fn_destroy_task.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Pops a task
	
	Parameter(s): none
	
	Returns:
	
	Example(s):
		[_object] call vn_mf_fnc_destroy_task;
*/

params ["_buildingObject"];

private _fnc_useExplosives = {
	private _neededExplosiveTypes = ["vn_mine_satchel_remote_02_mag", "vn_mine_m112_remote_mag"]; 
	private _mags = magazines player; 
	private _availableExplosives = _mags arrayIntersect _neededExplosiveTypes;
	if (count _availableExplosives == 0) exitWith { false };
	if (count _availableExplosives >= 1) then {
		player removeMagazine (_availableExplosives select 0);
	};
	true;
};


private _building = _buildingObject getVariable ["para_g_building", objNull];
if !(_building isEqualTo objNull) then
{
	private _usedExplosives = call _fnc_useExplosives;
	if !(_usedExplosives) exitWith { ["NoExplosives"] call para_c_fnc_show_notification; };

	private _nearPlayers = (getPos _buildingObject) nearObjects ["Man", 50];
	{
		if (isPlayer _x) then {
			["FireInTheHole"] remoteExec ["para_c_fnc_show_notification", _x];
		};
	} forEach _nearPlayers;

	[_building, _buildingObject] spawn {
		params ["_building", "_buildingObject"];
		sleep 15;
		private _bomb = createVehicle ["Rocket_04_HE_F", getPos _buildingObject, [], 0, "CAN_COLLIDE"];
		[_building, "onBuildingDeleted", [_building]] call para_g_fnc_building_fire_feature_event;
		[_building] call para_s_fnc_building_delete;
	};
};


