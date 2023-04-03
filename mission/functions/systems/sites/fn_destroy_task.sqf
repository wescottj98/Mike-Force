/*
	File: fn_destroy_task.sqf
	Author: Cerebral
	Public: No
	
	Description:
		Pops a task
	
	Parameter(s): none
	
	Returns:
	
	Example(s):
		[_object, _player] call vn_mf_fnc_destroy_task;
*/

params ["_task", "_player"];

private _fnc_useExplosives = {
	private _neededExplosiveTypes = ["vn_mine_satchel_remote_02_mag", "vn_mine_m112_remote_mag", "vn_mine_limpet_02_mag", "vn_mine_bangalore_mag"]; 
	private _mags = magazines _player; 
	private _availableExplosives = _mags arrayIntersect _neededExplosiveTypes;

	if (count _availableExplosives == 0) exitWith { false };
	_player removeMagazine (_availableExplosives select 0);

	true;
};

private _fnc_hasLighter = {
	private _mags = magazines _player;  
	private _lighterExists = _mags arrayIntersect ["vn_b_item_lighter_01"]; 
	if (count _lighterExists == 0) exitWith { false };

	true;
};

if(typeOf _task == "Land_vn_o_shelter_06" && call _fnc_hasLighter) exitWith {
	[_task] spawn {
		params ["_task"];

		["CampBurnt", ["The camp has been set on fire!"]] call para_c_fnc_show_notification;

		// Light
		private _light = "#lightpoint" createVehicle getpos _task; 
		_light setLightDayLight true; 
		_light setLightColor [5, 2.5, 0]; 
		_light setLightBrightness 0.1; 
		_light setLightAmbient [5, 2.5, 0]; 
		_light lightAttachObject [_task, [0, 0, 0]]; 
		_light setLightAttenuation [3, 0, 0, 0.6]; 

		// Fire
		private _ps0 = "#particlesource" createVehicle getpos _task;
		_ps0 setParticleParams [
			["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 10, 32], "", "Billboard",
			0, 1, [0, 0, 0.25], [0, 0, 0.5], 1, 1, 0.9, 0.3, [1.5],
			[[1,1,1, 0.0], [1,1,1, 0.3], [1,1,1, 0.0]],
			[0.75], 0, 0, "", "", _ps0, rad -45];
		_ps0 setParticleRandom [0.2, [1, 1, 0], [0.5, 0.5, 0], 0, 0.5, [0, 0, 0, 0], 0, 0];
		_ps0 setDropInterval 0.03;

		// Smoke part 1
		private _ps1 = "#particlesource" createVehicle getpos _task;
		_ps1 setParticleParams [
			["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 7, 1], "", "Billboard",
			1, 10, [0, 0, 0.5], [0, 0, 2.9], 1, 1.275, 1, 0.066, [4, 5, 10, 10],
			[[0.3, 0.3, 0.3, 0.33], [0.4, 0.4, 0.4, 0.33], [0.2, 0.2, 0, 0]],
			[0, 1], 1, 0, "", "", _ps1];
		_ps1 setParticleRandom [0, [0, 0, 0], [0.33, 0.33, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.05], 0, 0];
		_ps1 setDropInterval 0.5;

		// Smoke part 2
		private _ps2 = "#particlesource" createVehicle getpos _task;
		_ps2 setParticleParams [
			["\A3\Data_F\ParticleEffects\Universal\Universal", 16, 9, 1], "", "Billboard",
			1, 15, [0, 0, 0.5], [0, 0, 2.9], 1, 1.275, 1, 0.066, [4, 5, 10, 10],
			[[0.1, 0.1, 0.1, 0.75], [0.4, 0.4, 0.4, 0.5], [1, 1, 1, 0.2]],
			[0], 1, 0, "", "", _ps2];
		_ps2 setParticleRandom [0, [0, 0, 0], [0.5, 0.5, 0], 0, 0.25, [0.05, 0.05, 0.05, 0.05], 0, 0];
		_ps2 setDropInterval 0.25;

		sleep 10;
		lightDetachObject _light;
		deleteVehicle _light;
		deleteVehicle _ps0;
		deleteVehicle _ps1;
		deleteVehicle _ps2;

		deleteVehicle _task;
	};
};


private _usedExplosives = call _fnc_useExplosives;
if !(_usedExplosives) exitWith { ["NoExplosives"] call para_c_fnc_show_notification; };

private _nearPlayers = (getPos _task) nearObjects ["Man", 50];
{
	if (isPlayer _x) then {
		["FireInTheHole"] remoteExec ["para_c_fnc_show_notification", _x];
	};
} forEach _nearPlayers;

if (typeOf _task == "Land_vn_o_platform_04") then 
{
	private _respawnInfo = _task getVariable ["vn_respawn", []];

	if !(_respawnInfo isEqualTo []) then
	{
		private _marker = _respawnInfo # 0;
		private _respawnID = _respawnInfo # 1;

		_respawnID call BIS_fnc_removeRespawnPosition;
		deleteMarker _marker;
	};
};

private _building = _task getVariable ["para_g_building", objNull];
if !(_building isEqualTo objNull) then
{
	[_building, _task] spawn {
		params ["_building", "_task"];
		sleep 15;
		private _bomb = createVehicle ["Rocket_04_HE_F", getPos _task, [], 0, "CAN_COLLIDE"];
		[_building, "onBuildingDeleted", [_building]] call para_g_fnc_building_fire_feature_event;
		[_building] call para_s_fnc_building_delete;
	};
} else {
	[_task] spawn {
		params ["_task"];
		sleep 30;
		private _bomb = createVehicle ["Rocket_04_HE_F", getPos _task, [], 0, "CAN_COLLIDE"];
		deleteVehicle _task;
	};
};

