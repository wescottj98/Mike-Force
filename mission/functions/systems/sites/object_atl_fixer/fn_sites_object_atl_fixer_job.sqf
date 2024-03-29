/*
    File: fn_sites_object_atl_fixer_job.sqf
    Author: 'DJ' Dijksterhuis
    Public: No
    
    Description:
		Checks that objects in the 'sites_object_atl_fixer_objects' localNamespace variable 
		have z-axis ATL position >= 0 and if not, makes them >= 0.

		During site spawns, we manually set the z-axis of ATL positions to 0. But for some
		reason mortars keep falling below the terrain.
		
		So this has been implemented as a 'nuclear' fail safe. i.e. something is very wrong,
		brute force deal with it.

		This was rewritten from the paradigm fallthrough checker system
		- while loops make code unreadable most of the time
		- we need 0 ATL Z-pos, not -1 ATL or ASL Z-pos

		We do iterate over the objects to check several times, but we shouldn't see too much
		of a performance impact as this job runs on a very slow schedule.
    
    Parameter(s):
		none

    Returns:
		None
    
    Example(s):
		[] call vn_mf_fnc_sites_object_atl_checker_job;
*/

private _objects_to_check = localNamespace getVariable ["sites_object_atl_fixer_objects", []];

private _valid_objects = _objects_to_check select {!(isNull _x) && (alive _x)};

diag_log format ["Sites: AtlZFixer: Valid objects count: %1", count _valid_objects];

/*
if object ATL Z-coord is less than 0 then reset it to 0.

NOTE: Some objects (mostly things like ZPUs/other vehicles) naturally 
have ATL Z-co-ords in the range -1x10^-8 < x < -0.05 etc. so we test 
for objects with ATL Z-co-ords less than -0.1

*/

_valid_objects select {(getPosATL _x) select 2 < -0.1} apply {

	private _pAtl = getPosATL _x;

	_x setPosATL [_pAtl # 0, _pAtl # 1, 0];

	diag_log format [
		"Sites: AtlZFixer: fixing ATL Z-pos: obj=%1 startATL=%2 endATL=%3",
		_x,
		_pAtl,
		getPosATL _x
	];

};

// ignore deleted / unalive objects in future checks
localNamespace setVariable ["sites_object_atl_fixer_objects", _valid_objects];
