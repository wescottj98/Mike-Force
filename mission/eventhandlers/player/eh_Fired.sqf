params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

if (isNil "vn_mf_c_last_fire_time") then {
	vn_mf_c_last_fire_time = 0;
};

{
	if (player inArea _x) then
	{
		deleteVehicle _projectile;
		if((diag_TickTime - vn_mf_c_last_fire_time) > 5)then {
			["NoFireZone"] call para_c_fnc_show_notification;
			vn_mf_c_last_fire_time = diag_TickTime;
		};
	};
} forEach vn_mf_arsenal_circles;