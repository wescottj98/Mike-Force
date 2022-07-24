[
	player,		// Object the action is attached to
	"Gather Enemy Intel",		// Title of the action
	"custom\holdactions\holdAction_documents_ca.paa",	// Idle icon shown on screen
	"custom\holdactions\holdAction_documents_ca.paa",	// Progress icon shown on screen
	"(typeOf cursorObject in ['Land_Map_unfolded_F','Land_Map_unfolded_Malden_F'] && player distance cursorObject < 5)",	// Condition for the action to be shown
	"player distance cursorObject < 10",						// Condition for the action to progress
	{},	// Code executed when action starts
	{},	// Code executed on every progress tick
	{
		private _intelType = typeOf cursorObject;

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

		deleteVehicle cursorObject;
	},// Code executed on completion
	{},	// Code executed on interrupted
	[],													// Arguments passed to the scripts as _this select 3
	5,													// Action duration [s]
	100,													// Priority
	false,											// Remove on completion
	false												// Show in unconscious state
] call BIS_fnc_holdActionAdd;
