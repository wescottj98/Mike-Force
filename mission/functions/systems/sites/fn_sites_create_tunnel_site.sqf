params ["_pos", "_zoneName"];

private _config = missionConfigFile >> "gamemode" >> "settings" >> "aimarkers";
private _tunnel = getNumber(_config >> "tunnels");
private _debug = getNumber(missionConfigFile >> "gamemode" >> "debug" >> "aimarkers");

private _tunnelAlpha = 0.5;
if(_tunnel isEqualTo 0)then {_tunnelAlpha=0};

[
	"tunnel",
	_pos,
	"hq",
	//Setup Code
	{
		params ["_siteStore"];
		private _siteId = _siteStore getVariable "site_id";
		private _sitePos = getPos _siteStore;
		private _spawnPos = _sitePos;

		private _result = [_spawnPos] call vn_mf_fnc_create_tunnel_buildings;
		private _createdThings = _result select 0;

		private _markerPos = _spawnPos getPos [10 + random 20, random 360];
		private _tunnelMarker = createMarker [format ["Tunnel_%1", _siteId], _markerPos];
		_tunnelMarker setMarkerType "o_installation";
		_tunnelMarker setMarkerText "Tunnel";
		_tunnelMarker setMarkerAlpha 0;
		
		private _vehicles = _createdThings select 0;
		{
			//Disable weapon dissassembly - statics don't get deleted properly when disassembled, so it breaks the site/mission.
			_x enableWeaponDisassembly false;
		} forEach _vehicles;
		private _groups = _createdThings select 1;
		{
			[_x, true] call para_s_fnc_enable_dynamic_sim;
		} forEach (_vehicles + _groups);

		private _tunnels = _result select 1;

		// 70% chance to spawn an ambush
		if (random 1 < 0.7) then {
			_siteStore setVariable ["aiObjectives", [[_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_ambush]];
		} else {
			_siteStore setVariable ["aiObjectives", [[_spawnPos, 1, 1] call para_s_fnc_ai_obj_request_defend]];
		};

		_siteStore setVariable ["markers", [_tunnelMarker]];
		_siteStore setVariable ["tunnels", _tunnels];
		_siteStore setVariable ["vehicles", _vehicles]; 
		_siteStore setVariable ["units", (_createdThings select 1)]; 
		_siteStore setVariable ["groups", _groups];
		_siteStore setVariable ["objectsToDestroy", _vehicles];
	},
	//Teardown condition check code
	{
		//Check if we need to teardown every 15 seconds.
		15 call _fnc_periodicallyAttemptTeardown;
	},
	//Teardown condition
	{
		params ["_siteStore"];
		//Teardown when all guns destroyed
		(_siteStore getVariable "tunnels" findIf {alive _x} == -1)
	},
	//Teardown code
	{
		params ["_siteStore"];

		{
			deleteMarker _x;
		} forEach (_siteStore getVariable "markers");

		{
			deleteVehicle _x;
		} forEach ((_siteStore getVariable "vehicles") + (_siteStore getVariable "units"));

		{
			[_x] call para_s_fnc_ai_obj_finish_objective;
		} forEach (_siteStore getVariable ["aiObjectives", []]);
	}
] call vn_mf_fnc_sites_create_site;