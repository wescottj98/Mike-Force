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

/*
Constants
*/
_taskDataStore setVariable ["holdDuration", 60 * 30];
_taskDataStore setVariable ["failureTime", 5 * 60];


/*
Initialise the task

Parameter: _taskDataStore (_tds), with prep_time set as a Variable.
*/
_taskDataStore setVariable ["INIT", {
	params ["_tds"];

	//Required parameters
	private _marker = _tds getVariable "taskMarker";
	private _markerPos = getMarkerPos _marker;

	/*
	// present in SGD Mike Force, but not used anywhere.
	private _hqs = (localNamespace getVariable ["sites_hq", []]) inAreaArray _marker;
	*/

	private _prepTime = _tds getVariable ["prepTime", 0];

	_marker setMarkerColor "ColorYellow";
	_marker setMarkerBrush "DiagGrid";


	/*
	if no candidate FOBs, send AI towards the centre of the zone
	hoping they run into players.

	if there are bases within an AO's hexagon radius,
	get nearby FOBs sorted in descending order of the current supplies,
	use the first array item as the target for counter attack.
	*/

	// default attack position is centre of the zone
	private _attackPos = _markerPos;
	private _areaSize = markerSize _marker;

	// search for candidate FOBs within the zone's area.
	private _base_search_area = [_markerPos, _areaSize select 0, _areaSize select 1, 0, false];
	private _candidate_bases_to_attack = para_g_bases inAreaArray _base_search_area apply {
		[_x getVariable "para_g_current_supplies", _x]
	};
	_candidate_bases_to_attack sort false;

	// candidate FOBs exist
	if ((count _candidate_bases_to_attack) > 0) then {

		diag_log format [
			"Counterattack: Co-Ordinates of FOBs within range of counter attack: %1", 
			_candidate_bases_to_attack apply {getPos (_x # 1)}
		];

		// get the first FOB from the sorted array
		private _base_to_attack = (_candidate_bases_to_attack # 0 ) # 1;
		// overwrite the default attack position
		_attackPos = getPos _base_to_attack;
		_areaSize = [para_g_max_base_radius, para_g_max_base_radius];

		diag_log format [
			"Counterattack: Suitable FOB for attacking discovered: %1",
			_attackPos
		];

		_tds setVariable ["fob_exists", true];

		// nearest objects might be buggy

		private _possibleFlags = nearestObjects [
			[_attackPos select 0, _attackPos select 1],
			["vn_flag_usa", "vn_flag_aus", "vn_flag_arvn", "vn_flag_nz"],
			para_g_max_base_radius
		];

		if (count _possibleFlags > 0) then {
			private _flag = _possibleFlags select 0;
			_tds setVariable ["flag", _flag];
			_tds setVariable ["flag_exists", true];
			diag_log format [
				"Counterattack: Suitable flag discovered: %1",
				getPos _flag
			];
		};

	};

	diag_log format [
		"Counterattack: Co-ordinates for counter attack target: %1",
		_attackPos
	];

	private _attackTime = serverTime + (_tds getVariable ["prepTime", 0]);
	_tds setVariable ["attackTime", _attackTime];
	_tds setVariable ["attackPos", _attackPos];
	_tds setVariable ["attackAreaSize", _areaSize];

	if (_prepTime > 0) then 
	{
		["CounterAttackPreparing", ["", (_prepTime / 60) toFixed 0]] remoteExec ["para_c_fnc_show_notification", 0];
		[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
		["Counterattack In", _attackTime, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;
	};

	[[["prepare_zone", _markerPos]]] call _fnc_initialSubtasks;
}];


_taskDataStore setVariable ["_fnc_create_circle_area", {
	params ["_tds"];

	private _pos = _tds getVariable "attackPos";
	private _radius = (_tds getVariable ["attackAreaSize", [100, 100]]) select 0;

	// custom BN: yellow circle around the AO
	private _areaMarker = createMarker ["activeDefendCircle", _pos];
	_areaMarker setMarkerShape "ELLIPSE";
	_areaMarker setMarkerSize [_radius, _radius];
	_areaMarker setMarkerAlpha 1;
	_areaMarker setMarkerBrush "Border";
	_areaMarker setMarkerColor "ColorRed";

	_tds setVariable ["CircleAreaMarkerName", "activeDefendCircle"];

}];

/*
Prepare the zone -- get everything ready for the counter-attack phase

Parameter: _taskDataStore (_tds)
*/
_taskDataStore setVariable ["prepare_zone", {
	params ["_tds"];

	// set up the attack objective on the first tick so the AI have 
	// time to make it to the FOB

	// this means they can arrive to the FOB early.
	// but that's fine, it will keep people on their toes.
	if (isNull (_tds getVariable ["attackObjective", objNull])) exitWith {

		private _scalingFactor = _tds getVariable ["attackDifficulty", 5];
		private _reinforcementsFactor = 5;

		private _attackObjective = [
			_tds getVariable "attackPos",
			_scalingFactor,
			_reinforcementsFactor
		] call para_s_fnc_ai_obj_request_attack;

		_tds setVariable ["attackObjective", _attackObjective];

	};

	if (_tds getVariable "attackTime" > serverTime) exitWith {};

	["CounterAttackImminent"] remoteExec ["para_c_fnc_show_notification", 0];
	[] call vn_mf_fnc_timerOverlay_removeGlobalTimer;
	["Counter Attack Imminent", serverTime + 180, true] call vn_mf_fnc_timerOverlay_setGlobalTimer;

	_tds setVariable ["startTime", serverTime];

	// set up the next task(s)
	// one of "defend_flag + defend_fob" or "defend_fob" or "defend_zone".

	if (
		(_tds getVariable ["flag_exists", false]) 
		&& (_tds getVariable ["fob_exists", false])
	) exitWith {

		// used in the players action to check if players are looking at the right flag.
		// we set it now so the flag cannot be lowered during the prepare counterattack phase
		// but can be lowered during the upcoming defned thr flag phase
		(_tds getVariable "flag") setVariable ["canLower", true];

		[_tds] call (_tds getVariable "_fnc_create_circle_area");

		[
			"SUCCEEDED", 
			[
				["defend_fob", _tds getVariable "attackPos"],
				["defend_flag", getPos (_tds getVariable "flag")]
			]
		] call _fnc_finishSubtask;
	};

	if (_tds getVariable ["fob_exists", false]) exitWith {

		[_tds] call (_tds getVariable "_fnc_create_circle_area");

		[
			"SUCCEEDED", 
			[["defend_fob", _tds getVariable "attackPos"]]
		] call _fnc_finishSubtask;
	};

	[_tds] call (_tds getVariable "_fnc_create_circle_area");


	// no other options left
	// chuck some AI in the zone and hope they bump into players
	[
		"SUCCEEDED", 
		[["defend_zone", _tds getVariable "attackPos"]]
	] call _fnc_finishSubtask;
}];

/*
Method to Check if the AI are overruning the area etc.

Parameters: _tasDataStore (_tds)
*/
_taskDataStore setVariable ["_fnc_check_ai_failure_condition", {
	params ["_tds"];

	private _attackPos = _tds getVariable "attackPos";
	private _areaSize = _tds getVariable "attackAreaSize";
	private _areaDescriptor = [_attackPos, _areaSize select 0, _areaSize select 1, 0, false];

	//Side check - downed players don't count. Nor do players in aircraft. Ground vehicles are fair game.
	private _alivePlayersInZone = allPlayers inAreaArray _areaDescriptor 
		select {
			alive _x 
			&& (side _x == west || side _x == independent) 
			&& !(vehicle _x isKindOf "Air") 
			&& !(_x getVariable ["vn_revive_incapacitated", false])
		};

	private _enemyZoneHeldTime = _tds getVariable "enemyZoneHeldTime";
	private _lastCheck = _tds getVariable "lastCheck";
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
		_tds setVariable ["enemyZoneHeldTime", _enemyZoneHeldTime];
		_tds setVariable ["lastCheck", _lastCheck];
	} else {
		_tds setVariable ["enemyZoneHeldTime", 0];
		_lastCheck = serverTime;
		_tds setVariable ["lastCheck", _lastCheck];
	};

	private _startTime = _tds getVariable "startTime";

	//Zone has been held long enough, or they've killed enough attackers for the
	// AI objective to complete.
	if (
		serverTime - _startTime > (_tds getVariable ["holdDuration", 60 * 30]) 
		|| isNull (_tds getVariable "attackObjective")
	) exitWith {
		"SUCCESS"
	};

	//Enemy hold the zone for X seconds, we've failed
	if (
		_enemyHoldZone
		&& {_enemyZoneHeldTime > (_tds getVariable ["failureTime", 5 * 60])}
	) exitWith {
		"FAILED"
	};

	// still going
	"ACTIVE"
}];


/* 
no one built a FOB, so AI are just going to move to the centre of the zone

parameters: _taskDataStore (_tds)
*/
_taskDataStore setVariable ["defend_zone", {
	params ["_tds"];

	private _status = [_tds] call (_tds getVariable "_fnc_check_ai_failure_condition");

	if (_status == "FAILED") exitWith {
		["CounterAttackExtended"] remoteExec ["para_c_fnc_show_notification", 0];
		["FAILED"] call _fnc_finishSubtask;
		["FAILED"] call _fnc_finishTask;
	};

	if (_status == "SUCCESS") exitWith {
		_tds setVariable ["zoneDefended", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

/* 
just a duplicate of defend base, but using different config title

parameters: _taskDataStore (_tds)
*/
_taskDataStore setVariable ["defend_fob", {
	params ["_tds"];

	private _status = [_tds] call (_tds getVariable "_fnc_check_ai_failure_condition");

	if (_status == "FAILED") exitWith {
		["CounterAttackExtended"] remoteExec ["para_c_fnc_show_notification", 0];
		["FAILED"] call _fnc_finishSubtask;
		["FAILED"] call _fnc_finishTask;
	};

	if (_status == "SUCCESS") exitWith {
		_tds setVariable ["zoneDefended", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

/*
Add the flag objective as a possible failure condition
while also tracking the same AI objective chance as before

parameters: _taskDataStore (_tds)
*/
_taskDataStore setVariable ["defend_flag", {
	params ["_tds"];
	private _flag = _tds getVariable "flag";
	private _status = [_tds] call (_tds getVariable "_fnc_check_ai_failure_condition");

	/*
	failure -- flag object has been deleteVehicle'd

	occurs when either 
	- Dac Cong full lowered the flag through the action
	- the flag has been hammered out of existence (Bluefor tried to be clever)
	*/

	if (isNull _flag) exitWith {
		["CounterAttackExtended"] remoteExec ["para_c_fnc_show_notification", 0];
		["FAILED"] call _fnc_finishSubtask;
		["FAILED"] call _fnc_finishTask;
	};

	// finished -- successful defence
	// (30 minutes passed or AI objective has been wiped out)

	if (_status == "SUCCESS") exitWith {
		_tds setVariable ["flagDefended", true];
		["SUCCEEDED"] call _fnc_finishSubtask;
	};
}];

_taskDataStore setVariable ["AFTER_STATES_RUN", {
	params ["_tds"];
	if (
		_tds getVariable ["zoneDefended", false]
		|| _tds getVariable ["flagDefended", false]
	) then {
		["SUCCEEDED"] call _fnc_finishTask;
	};
}];

_taskDataStore setVariable ["FINISH", {
	params ["_tds"];
	[_tds getVariable "attackObjective"] call para_s_fnc_ai_obj_finish_objective;
	deleteMarker (_tds getVariable ["CircleAreaMarkerName", "activeDefendCircle"]);

	if !(isNull (_tds getVariable ["flag", objNull])) then {
		(_tds getVariable "flag") setVariable ["canLower", false];
	};
}];
