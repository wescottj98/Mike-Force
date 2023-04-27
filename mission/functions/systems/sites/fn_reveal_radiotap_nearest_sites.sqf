/*
    File: fn_reveal_radiotap_nearest_sites.sqf
    Author: DJ Dijksterhuis
    Public: No

    Description:
	    Perform a tap on a radio within a site to reveal the next closest site on map.

    Parameter(s):
        _radioObj - the radio object the player is performing the holdAction on

    Returns:
        None
    
    Example(s):
        // execute only on the server
        [_myRadioObj] remoteExec ["vn_mf_fnc_reveal_radiotap_nearest_sites", 2];
        
*/

params ["_radioObj"];

// starting vars
private _radioPos = getPos _radioObj;
private _sitesArr = missionNamespace getVariable ["sites",[]];
private _sitesUndiscoveredArr = _sitesArr select {!(_x getVariable ["discovered", false])};

/* 
nested arrays of [site distance from radio, site object]
sorted by ascending distance
first one is usually always the site the radio is in
then resize to the random N sites to reveal
*/ 
private _sitesDistanceSortedAscArr = _sitesUndiscoveredArr apply {[_x distance2d _radioPos, _x]};
_sitesDistanceSortedAscArr sort true;

// randomised number of sites to reveal on map to make life interesting
// this is set to two or three to cover the case where
// - the marker discovery system is disabled (BN MF#1 and MF#2) -- reveals current + 1 or 2 others
// - the marker discovery system is enabled (others) -- reveals 2 or 3 others
private _nSitesToReveal = (selectRandom [2, 3]);

// we can end up trying to select too many and ending up with null values
if (_nSitesToReveal > count _sitesDistanceSortedAscArr) then {
    _nSitesToReveal = count _sitesDistanceSortedAscArr;
};

_sitesDistanceSortedAscArr resize _nSitesToReveal;

// no need for messy forEach loops or multiple searches 
// as we can do one apply call
_sitesDistanceSortedAscArr apply {
    private _candidateSiteObj = _x # 1;
    private _markersArr = _candidateSiteObj getVariable ["markers", []];
    _markersArr apply {_x setMarkerAlpha 0.5};
    _candidateSiteObj setVariable ["discovered", true];
};

// delete the radio set so action cannot be used multiple times
deleteVehicle _radioObj;
