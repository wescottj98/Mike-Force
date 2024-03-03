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
private _sitesUndiscoveredArr = _sitesArr select {!(_x getVariable ["discovered", false])} select {!(_x getVariable ["partiallyDiscovered", false])};

// no undiscovered sites -- nothing to do.
if ((count _sitesUndiscoveredArr) == 0) exitWith {deleteVehicle _radioObj};

// registered in fn_sites_generate
private _radiosArr = missionNamespace getVariable ["siteRadios", []];

/* 
nested arrays of [site distance from radio, site object]
sorted by ascending distance
first one is usually always the site the radio is in
then resize to the random N sites to reveal
*/ 
private _sitesDistanceSortedAscArr = _sitesUndiscoveredArr apply {[_x distance2d _radioPos, _x]};
_sitesDistanceSortedAscArr sort true;

// get the ratio of remaining sites to remaining radios so we can work out how many sites to reveal
// 'ceil' it to guarantee we can radio tap the entire AO
// 'max' it to ensure we always show 2 sites (sites are linked by radios)
// '+1' otherwise we end up with N-2 sites being revealed for some reason. >:|
private _nSitesToRevealPerRadio = ((ceil ((count _sitesDistanceSortedAscArr) / (count _radiosArr))) max 2) + 1;

if (_nSitesToRevealPerRadio > count _sitesDistanceSortedAscArr) then {
    // if there's only one site left, reveal only that site.
    _nSitesToRevealPerRadio = count _sitesDistanceSortedAscArr;
} else {
    // otherwise we only want the closest N sites.
    _sitesDistanceSortedAscArr resize _nSitesToRevealPerRadio;
};

// reveal the sites
_sitesDistanceSortedAscArr apply {
    private _candidateSiteObj = _x # 1;
    private _markersArr = _candidateSiteObj getVariable ["partialMarkers", []];
    _markersArr apply {_x setMarkerAlpha 0.35};
    _candidateSiteObj setVariable ["partiallyDiscovered", true];
};

// delete the radio set so action cannot be used multiple times
deleteVehicle _radioObj;
