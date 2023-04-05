/*
    File: fn_sites_delete_active_site.sqf
    Author: "DJ" dijksterhuis
    Public: No
    
    Description:
		Globally deletes a site and its corresponding composition objects.
		Used to clean up sites if prepare/counterattack tasks were failed.
    
    Parameter(s):
		_siteStore -- the site to delete

    Returns:
		None
    
    Example(s):
		[_siteStore] call vn_mf_fnc_sites_delete_active_site
*/


params ["_siteStore"];

// private _objs = _siteStore getVariable ["objects", []];
private _siteId = _siteStore getVariable "site_id";
private _siteType = _siteStore getVariable "site_type";
private _sitePos = getPos _siteStore;
private _nearbyObjects = nearestObjects [_sitePos, ["all"], 100];

diag_log format [
	"DeleteSite: Site objects to delete id=%1 type=%2 pos=%3 nObjectsIn100mRadius=%4", 
	_siteId,
	_siteType,
	_sitePos,
	count _nearbyObjects
];

{
	private _obj = _x;

	/*
	we **must** delete any crews before deleting the vehicle 
	to avoid glitchy deletes where crew member is still "crewing" the objective
	*/ 

	{_obj deleteVehicleCrew _x} forEach crew _obj;
	deleteVehicle _obj;

} forEach _nearbyObjects;

private _nearbyObjectsAfter = nearestObjects [_sitePos, ["all"], 100];

diag_log format [
	"DeleteSite: Site objects should be deleted id=%1 type=%2 pos=%4 nObjectsIn100mRadius=%4", 
	_siteId, 
	_siteType,
	_sitePos,
	count _nearbyObjectsAfter
];

[_siteStore] call vn_mf_fnc_sites_teardown_site;

true;