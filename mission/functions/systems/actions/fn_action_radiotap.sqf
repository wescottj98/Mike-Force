/*
    File: fn_action_radiotap_reveal.sqf
    Author: DJ Dijksterhuis
    
    Description:
        Adds the "hold action" to objects for revealing next closest site(s) on map.
        
        Players must be:
        	- explosive specialist trained
        	- within 5 metres of the radio set
        	- have a wiretap kit in their inventory
        	- not opfor

		See here for more detail on the implementation:
		https://community.bistudio.com/wiki/BIS_fnc_holdActionAdd

    Parameter(s):
        objs - Array - the objects this hold action will be attached to (_this entries)
    
    Returns:
        None
    
    Example(s):
        [obj_1, obj2, obj_3] call vn_mf_fnc_action_radiotap_reveal;
*/

// if nothing got passed in the call don't bother trying to execute the script
if (count _this == 0) exitwith {
	diag_log format ["Radiotap Action: Empty array passed in call so not executing."];
};

////////////////////////////////////////////////////////////////////
// set up the variables for holdActionAdd

private _actionText = "Wiretap Radio Communications";
private _actionIdleIcon = "custom\holdactions\holdAction_listen_ca.paa";
private _actionProgressIcon = _actionIdleIcon;

/*
holdActionAdd CONDITIONS field variables
	_target ==> the current object / object action is attached to
	_this   ==> player executing the action (WARN: different to CODE!)
*/

private _isNotOpfor = "side _this != east";
private _isInRangeOfRadio = "_this distance _target < 5";
private _isValidObjectType = "typeOf _target in ['vn_o_prop_t102e_01', 'vn_o_prop_t884_01']";

private _conditionToShow = format [
	"(%1 && %2 && %3)",
	_isNotOpfor, 
	_isInRangeOfRadio, 
	_isValidObjectType
];

// WARN: if changing this make sure you change the logic in _codeOnStart too!!
private _isPlayerExplosiveSpecialist = "_this getUnitTrait 'explosiveSpecialist'";
private _isPlayerHasWiretapKit = "'vn_b_item_wiretap' in (backpackItems _this)";

private _conditionToProgress = format [
	"(%1 && %2 && %3)",
	_conditionToShow,
	_isPlayerExplosiveSpecialist,
	_isPlayerHasWiretapKit
];

/*
holdActionAdd CODE field variables
	_target ==> the current object / object action is attached to
	_caller ==> player executing the action (WARN: different to CONDITIONS!)
*/

// show some notifications
// WARN: if changing this make sure you change the logic for _conditionToProgress too!!
private _codeOnStart = {
	private _playerIsExplosiveSpecialist = _caller getUnitTrait 'explosiveSpecialist';
	private _playerHasWiretapKit = 'vn_b_item_wiretap' in (backpackItems _caller);
	if (not _playerHasWiretapKit || not _playerIsExplosiveSpecialist) exitWith {
	    ["RadioTapFailed", []] remoteExec ["para_c_fnc_show_notification", _caller];
	};
	if (true) exitWith {
	    ["RadioTapStart", []] remoteExec ["para_c_fnc_show_notification", _caller];
	};
};
private _codeOnTick = {};
private _codeOnComplete = {
	[_target] remoteExec ["vn_mf_fnc_reveal_radiotap_nearest_sites", 2];
	["RadioTapSuccess", []] remoteExec ["para_c_fnc_show_notification", _caller];
};
private _codeOnInterrupted = {};
private _extraArgsArr = [];
private _actionDurationSeconds = 10;
private _actionPriority = 100;
private _actionRemoveOnComplete = true;
private _showWhenUncon = false;

////////////////////////////////////////////////////////////////////
// apply holdActionAdd to all the objects passed in with call syntax

_this apply {
	[
		_x,
		_actionText,
		_actionIdleIcon,
		_actionProgressIcon,
		_conditionToShow,
		_conditionToProgress,
		_codeOnStart,
		_codeOnTick,
		_codeOnComplete,
		_codeOnInterrupted,
		_extraArgsArr,
		_actionDurationSeconds,
		_actionPriority,
		_actionRemoveOnComplete,
		_showWhenUncon
	] call BIS_fnc_holdActionAdd;	
};

