/*
    File: fn_sites_generate.sqf
    Author: Savage Game Design
    Public: No
    
    Description:
		Places new sites down on the map procedurally. 
    
    Parameter(s):
		_zone - Targeted zone

    Returns:
		None
    
    Example(s):
		[] call vn_mf_fnc_sites_generate
*/
params ["_zone"];

private _zoneData = [_zone] call vn_mf_fnc_zones_load_zone;
private _allTerrainObjects = 	["TREE", "HIDE", "WATERTOWER", "BUSH", "SMALL TREE", "ROCK", "ROCKS", "STACK", "FOUNTAIN", "RUIN", "TOURISM", "CHURCH", "CHAPEL", "BUILDING", "HOUSE", "FUELSTATION", "HOSPITAL", "FORTRESS", "BUNKER", "FENCE", "WALL"];
private _unnaturalObjects = 	["ROCK", "ROCKS", "HIDE", "WATERTOWER", "STACK", "FOUNTAIN", "RUIN", "TOURISM", "CHURCH", "CHAPEL", "BUILDING", "HOUSE", "FUELSTATION", "HOSPITAL", "FORTRESS", "BUNKER", "FENCE", "WALL"];
private _center = markerPos (_zoneData select struct_zone_m_marker);
private _size = markerSize (_zoneData select struct_zone_m_marker);
private _sizeX = _size select 0;

//Create zone factory
private _factoryPosition = [_center, vn_mf_bn_s_zone_radius, 0, 55, 5, _allTerrainObjects] call vn_mf_fnc_sites_get_safe_location;
[_factoryPosition, _zone] call vn_mf_fnc_sites_create_factory;

//Create zone HQ
private _hqPosition = [_center, vn_mf_bn_s_zone_radius, 0, 55, 5, _allTerrainObjects] call vn_mf_fnc_sites_get_safe_location;
[_hqPosition, _zone] call vn_mf_fnc_sites_create_hq;

// for "_i" from 1 to (1 + ceil random (vn_mf_s_max_radars_per_zone - 1)) do
// {
// 	private _radar = [_center, vn_mf_bn_s_zone_radius, 0, 55, 5, _allTerrainObjects] call vn_mf_fnc_sites_get_safe_location;
// 	[_radar, _zone] call vn_mf_fnc_sites_create_radar;
// };

for "_i" from 1 to (3 + ceil random (vn_mf_s_max_camps_per_zone - 1)) do
{
	//[_zoneData] call vn_mf_fnc_sites_create_camp;
	private _campSite = [_center, vn_mf_bn_s_zone_radius, 0, 8, 15, _unnaturalObjects] call vn_mf_fnc_sites_get_safe_location;
	[_campSite, _zone] call vn_mf_fnc_sites_create_camp_site;
};

//Create initial artillery emplacements
for "_i" from 1 to (1 + ceil random (vn_mf_s_max_artillery_per_zone - 1)) do
{
	private _artySite = [_center, vn_mf_bn_s_zone_radius, 0, 15, 10, _allTerrainObjects] call vn_mf_fnc_sites_get_safe_location;
	[_artySite, _zone] call vn_mf_fnc_sites_create_artillery_site;
};

//Create AA emplacements (ZPUs)
// create a minimum of 5 AAs
for "_i" from 1 to (5 + ceil random (vn_mf_s_max_aa_per_zone - 5)) do
{
	private _aaSite = [_center, vn_mf_bn_s_zone_radius, 0, 20, 10, _allTerrainObjects] call vn_mf_fnc_sites_get_safe_location;
	[_aaSite, _zone] call vn_mf_fnc_sites_create_aa_site;
};

for "_i" from 1 to (1 + ceil random (vn_mf_s_max_tunnels_per_zone - 1)) do
{
	private _tunnelSite = [_center, vn_mf_bn_s_zone_radius, 0, 5, 20, _unnaturalObjects] call vn_mf_fnc_sites_get_safe_location;
	[_tunnelSite, _zone] call vn_mf_fnc_sites_create_tunnel_site;
};

for "_i" from 1 to (1 + ceil random (vn_mf_s_max_water_supply_per_zone - 1)) do
{
	private _tunnelWaterSupply = [_center, vn_mf_bn_s_zone_radius, 2, 5, 20, _unnaturalObjects] call vn_mf_fnc_sites_get_safe_location;
	[_tunnelWaterSupply, _zone] call vn_mf_fnc_sites_create_water_supply_site;
};

// add the "Tap Radio Comms" hold action to all generated radio sets
private _radios = vn_site_objects select {
	typeOf _x in ["vn_o_prop_t102e_01", "vn_o_prop_t884_01"];
};

_radios apply {_x call vn_mf_fnc_action_radiotap};