/*
	File: fn_task_counterattack.sqf
	Author: Savage Game Design
	Public: No

	Description:
		Primary task to defend a zone against an enemy attack, and clear out nearby entrenchments.
		Uses the state machine task system.

	Parameter(s):
		_taskDataStore - Namespace for storing task info [Object]

	Returns: nothing

	Example(s):
		Not directly called.
*/

/*
	Requires Task Variables:
*/

params ["_taskDataStore"];

_taskDataStore setVariable ["INIT", {
	params ["_taskDataStore"];

	//Required parameters
	private _marker = _taskDataStore getVariable "taskMarker";
	private _zonePosition = getMarkerPos _marker;
	private _prepTime = _taskDataStore getVariable ["prepTime", 0];

	private _hq = (missionNamespace getVariable ["current_hq", objNull]);
	private _attackPos = if !(_hq isEqualTo objNull) then {getPos (_hq)} else {_zonePosition};

	private _attackTime = serverTime + (_taskDataStore getVariable ["prepTime", 0]);
	_taskDataStore setVariable ["attackTime", _attackTime];
	_taskDataStore setVariable ["attackPos", _attackPos];
	_taskDataStore setVariable ["attackAreaSize", markerSize _marker];

	if (_prepTime > 0) then 
	{
		["CounterAttackPreparing", ["", (_prepTime / 60) toFixed 0]] remoteExec ["para_c_fnc_show_notification", 0];
		[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
		["Counterattack In", _attackTime, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;
	};

	[[
		["prepare_zone", _zonePosition]
	]] call _fnc_initialSubtasks;
}];

_taskDataStore setVariable ["prepare_zone", {
	params ["_taskDataStore"];

	if (_taskDataStore getVariable "attackTime" > serverTime) exitWith {};

	["CounterAttackImminent", []] remoteExec ["para_c_fnc_show_notification", 0];
	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
	["Counter Attack Imminent", serverTime + 180, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;

	//Default to X waves.
	private _baseMultiplier = 5;//PLACEHOLDER VALUE
	//Add a wave for each camp in our origin zone.
	private _infantryMultiplier = _baseMultiplier;

	private _attackObjective = [
		_taskDataStore getVariable "attackPos",
		//Difficulty 2, unless specified otherwise.
		_taskDataStore getVariable ["attackDifficulty", 3],
		_infantryMultiplier
	] call para_s_fnc_ai_obj_request_attack;

	_taskDataStore setVariable ["attackObjective", _attackObjective];
	_taskDataStore setVariable ["startTime", serverTime];

	["SUCCEEDED", [["defend_zone", _taskDataStore getVariable "attackPos"]]] call _fnc_finishSubtask;
}];

_taskDataStore setVariable ["defend_zone", {
	params ["_taskDataStore"];

	private _attackPos = _taskDataStore getVariable "attackPos";
	private _areaSize = _taskDataStore getVariable "attackAreaSize";
	private _areaDescriptor = [_attackPos, _areaSize select 0, _areaSize select 1, 0, false];

	//Side check - downed players don't count. Nor do players in aircraft. Ground vehicles are fair game.
	private _alivePlayersInZone = 
		allPlayers inAreaArray _areaDescriptor
		select {alive _x && (side _x == west || side _x == independent) && !(vehicle _x isKindOf "Air") && !(_x getVariable ["vn_revive_incapacitated", false])};

	private _aliveEnemyInZone = 
		allUnits inAreaArray _areaDescriptor 
		select {alive _x && side _x == east};

	private _enemyZoneHeldTime = _taskDataStore getVariable "enemyZoneHeldTime";
	private _lastCheck = _taskDataStore getVariable "lastCheck";
	//Enemy hold the zone if no living players.
	private _enemyHoldZone = count _alivePlayersInZone == 0;

	if (_enemyHoldZone) then {
		if (isNil "_enemyZoneHeldTime") then {
			_enemyZoneHeldTime = 0;
			_lastCheck = serverTime;
		} else {
			//Adding the interval between checks will be close enough to work.
			//We will lose or gain a few seconds but will even out in the long run.
			//Interval is approx 5 +/- 2 seconds from my testing.
			_enemyZoneHeldTime = _enemyZoneHeldTime + (serverTime - _lastCheck);
			_lastCheck = serverTime;
		};
		_taskDataStore setVariable ["enemyZoneHeldTime", _enemyZoneHeldTime];
		_taskDataStore setVariable ["lastCheck", _lastCheck];
	} else {
		_lastCheck = serverTime;
		_taskDataStore setVariable ["lastCheck", _lastCheck];
	};

	private _startTime = _taskDataStore getVariable "startTime";

	private _zone = _taskDataStore getVariable "taskMarker";
	private _garrisonStrength = _taskDataStore getVariable ["attackObjective", objNull] getVariable ["reinforcements_remaining", 0];

	//Zone has been held long enough, or they've killed enough attackers for the AI objective to complete.
	if (serverTime - _startTime > (_taskDataStore getVariable ["holdDuration", 20 * 60]) ||
		isNull (_taskDataStore getVariable "attackObjective") ) exitWith 
	{ //exitWith here to prevent a tie causing the zone to turn green but have new tasks for its capture spawn
		_taskDataStore setVariable ["zoneDefended", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};

	//Enemy hold the zone for X seconds, we've failed
	if (
		_enemyHoldZone &&
		{_enemyZoneHeldTime > (_taskDataStore getVariable ["failureTime", 5 * 60])}
	) then {
		private _zone = _taskDataStore getVariable "taskMarker";
		private _selectZone = mf_s_siegedZones findIf {_zone in _x};
		mf_s_siegedZones deleteAt _selectZone;
		mf_s_activeZones deleteAt _selectZone;

		_zone setMarkerColor "ColorRed";
		_zone setMarkerBrush "DiagGrid";

		["FAILED"] call _fnc_finishSubtask;
		["FAILED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_taskDataStore"];

	if (_taskDataStore getVariable ["zoneDefended", false]
	) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	params ["_taskDataStore"];

	private _zone = _taskDataStore getVariable "taskMarker";
	[_zone] call vn_mf_fnc_zones_capture_zone;

	{
		private _marker = _x # 0;
		private _respawnID = _x # 1;

		_respawnID call BIS_fnc_removeRespawnPosition;
		deleteMarker _marker;
	} forEach vn_dc_adhoc_respawns;

	{
		deleteVehicle _x;
	} forEach vn_site_objects;

	[_taskDataStore getVariable "attackObjective"] call para_s_fnc_ai_obj_finish_objective;
}];
