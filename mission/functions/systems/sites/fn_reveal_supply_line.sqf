params ["_intel"];

private _intelType = typeOf _intel;

if (_intelType == 'Land_Map_unfolded_F') then
{
	private _hqSites = missionNamespace getVariable ["side_sites_hq", []];
	{
		private _markers = _x getVariable ["markers", []];
		{
			_x setMarkerAlpha 0.5;
		} forEach _markers;
	} forEach _hqSites;
} else {
	private _factorySites = missionNamespace getVariable ["side_sites_factory", []];
	{
		private _markers = _x getVariable ["markers", []];
		{
			if((_x find "AA_zone_") >= 0) then {
				_x setMarkerAlpha 0.3;
			} else {
				_x setMarkerAlpha 0.5;
			};
		} forEach _markers;
	} forEach _factorySites;
};

deleteVehicle _intel;