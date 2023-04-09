/*
    File: fn_action_radiotap_reveal.sqf
    Author: DJ Dijksterhuis
    
    Description:
        Adds the "add action" option to reveal the next closest site on map via radio.
        Players must be:
        	- explosive specialist trained
        	- within 5 metres of the radio set
        	- have a wwiretap kit in their inventory
    
    Parameter(s):
        none
    
    Returns:
        None
    
    Example(s):
        [obj] call vn_mf_fnc_action_radiotap_reveal
*/

private _attachedObj = player;
private _isNotOpfor = "side player != east";
private _isInRangeOfRadio = "player distance cursorObject < 5";
private _isRightObject = "typeOf cursorObject in ['vn_o_prop_t102e_01', 'vn_o_prop_t884_01']";
private _actionText = "Wiretap Radio Communications";
private _actionIdleIcon = "custom\holdactions\holdAction_listen_ca.paa";
private _actionProgressIcon = _actionIdleIcon;
private _conditionToShow = format [
	"(%1 && %2 && %3)",
	_isNotOpfor, 
	_isInRangeOfRadio, 
	_isRightObject
];
private _conditionToProgress = _conditionToShow;
private _codeOnStart = {};
private _codeOnTick = {};
private _codeOnComplete = {
	[cursorObject, player] remoteExec ["vn_mf_fnc_reveal_radiotap_nearest_sites", 2];
};
private _codeOnInterrupted = {};
private _extraArgsArr = [];
private _actionDurationSeconds = 5;
private _actionPriority = 100;
private _actionRemoveOnComplete = true;
private _showWhenUncon = false;

diag_log format ["Condition to show=%1 progress=%2", _conditionToShow, _conditionToProgress];

[
	_attachedObj,
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

