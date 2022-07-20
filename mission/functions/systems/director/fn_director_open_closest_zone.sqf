/*
    File: fn_director_open_closest_zone.sqf
    Author: Cerebral
    Public: No
    
    Description:
        No description added yet.
    
    Parameter(s):
        _localVariable - Description [DATATYPE, defaults to DEFAULTVALUE]
    
    Returns:
        Function reached the end [BOOL]
    
    Example(s):
        [parameter] call vn_fnc_myFunction
*/

private _uncapturedZones = mf_s_zone_markers select { !(localNamespace getVariable _x select struct_zone_m_captured) };
private _startingPoint = getMarkerPos "starting_point";
private _nearestMarker = [_uncapturedZones, _startingPoint] call BIS_fnc_nearestPosition;
[_nearestMarker] call vn_mf_fnc_director_open_zone;