/*
    File: fn_sites_load.sqf
    Author: Savage Game Design
    Public: No
    
    Description:
        Loads saved sites.
    
    Parameter(s):
        None
    
    Returns:
        Load successful [BOOL]
    
    Example(s):
        [] call vn_mf_fnc_sites_load;
*/

(["GET", "sites", []] call para_s_fnc_profile_db) params ["","_sitesData"];

if (_sitesData isEqualTo []) exitWith { false; };

private _sites = _sitesData apply {createHashMapFromArray _x};

private _siteCreationFunctions = createHashmapFromArray [
    ["aa", vn_mf_fnc_sites_create_aa_site],
    ["hq", vn_mf_fnc_sites_create_hq],
    ["factory", vn_mf_fnc_sites_create_factory],
    ["radar", vn_mf_fnc_sites_create_radar],
    ["artillery", vn_mf_fnc_sites_create_artillery_site],
    ["camp", vn_mf_fnc_sites_create_camp_site],
    ["tunnel", vn_mf_fnc_sites_create_tunnel_site],
    ["water_supply", vn_mf_fnc_sites_create_tunnel_water_supply_site]
];

{
    private _site = _x;
    private _pos = _site get "pos";
    private _type = _site get "type";

    [_pos] call (_siteCreationFunctions get _type);
} forEach _sites;

true