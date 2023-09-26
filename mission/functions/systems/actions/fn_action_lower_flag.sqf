/*
	File: fn_action_lower_flag.sqf
	Author: "DJ" dijksterhuis
	Public: No
	
	Description:
                Dac Cong players can approach a mission critical (player built) flag in a base
                and then lower it, causing a mission objective to fail.
	
	Parameter(s): none
	
	Returns:
	
	Example(s):
*/

private _actionText = format ["<t color='#0000FF'>%1</t>", "Lower Enemy Flag"];
private _actionIdleIcon = "custom\holdactions\holdAction_interact_ca.paa";
private _actionProgressIcon = "custom\holdactions\holdAction_danger_ca.paa";

private _isOpfor = "side player == east";
private _isInRangeOf = "player distance cursorObject < 5";
private _isValidObjectType = "typeOf cursorObject in ['vn_flag_usa', 'vn_flag_aus', 'vn_flag_arvn', 'vn_flag_nz']";
private _isObjectiveFlag = "(cursorObject getVariable ['canLower', false]) == true";

private _conditionToShow = format [
        "(%1 && %2 && %3 && %4)",
        _isNotOpfor,
        _isInRangeOf,
        _isValidObjectType,
        _isObjectiveFlag
];

private _conditionToProgress = _conditionToShow;

private _codeOnStart = {
	// params ["_target", "_caller", "_actionId", "_arguments"];
	allPlayers apply {["DacCongCapturingFlag", []] remoteExec ["para_c_fnc_show_notification", _x]};
};
private _codeOnTick = {
	// params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
	[cursorObject, (_maxProgress - _progress) / _maxProgress, false] call BIS_fnc_animateFlag;
};
private _codeOnComplete = {
	// params ["_target", "_caller", "_actionId", "_arguments"];
	[cursorObject] remoteExec ["deleteVehicle", 2];
	allPlayers apply {["DacCongCapturedFlag", []] remoteExec ["para_c_fnc_show_notification", _x]};
};
private _codeOnInterrupted = {
	// params ["_target", "_caller", "_actionId", "_arguments"];

	/*
	do not reset the flag -- make bluefor reraise it

	if bluefor do not reraise the flag then Dac Cong
	have a better chance of stealing it (flag is sat
	at 50% because bluefor never re-raised it!)

	this line below is here in case the above idea
	doesn't work and I need to revert it back quickly.

	[cursorObject, 1, true] call BIS_fnc_animateFlag;
	*/
};
private _extraArgsArr = [];
private _actionDurationSeconds = 5;
private _actionPriority = 100;
private _actionRemoveOnComplete = false;
private _showWhenUncon = false;

[
        player,
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
