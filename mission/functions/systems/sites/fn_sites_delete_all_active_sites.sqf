/*
    File: fn_sites_delete_all_active_sites.sqf
    Author: "DJ" dijksterhuis
    Public: No
    
    Description:
		Globally deletes all active sites and their compositions.
		Can only be used on sites that are currently registered as active objective sites.
		Used to clean up sites if prepare/counterattack tasks were failed.
		Can be be used in DEBUG to skip the capture phase.

		WARNING: **This is a global action. Use with care!**

		TODO: Should we parameterise this to help with clean up?
    
    Parameter(s):
		None

    Returns:
		None
    
    Example(s):
		[] call vn_mf_fnc_sites_delete_all_active_sites
*/

private _sites = missionNamespace getVariable ["sites", []];

//side_sites_hq

diag_log format [
	"DeleteAllSites: Current sites to clean up: count=%1", 
	count _sites
];


while { count (missionNamespace getVariable ["sites", []]) > 0 } do {
	private _sites = missionNamespace getVariable ["sites", []];
	_sites apply {[_x] call vn_mf_fnc_sites_delete_site};
};

// HACK: this is a massive hack because some sites refuse to get deleted
// on the first try. So this spams delete call a bunch of times until 
// they are probably gone.
// for "_i" from 1 to 10 do {_sites apply {[_x] call vn_mf_fnc_sites_delete_site};};

private _sitesAfter = missionNamespace getVariable ["sites", []];

diag_log format [
	"DeleteAllSites: After deleting, current sites to clean up: count=%1", 
	count _sitesAfter
];

true;