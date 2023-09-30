/*
	File: fn_action_reraise_flag.sqf
	Author: "DJ" dijksterhuis
	Public: No
	
	Description:
		Dac Cong have lowered a mission critical flag.
		Bluefor need to raise it to 100% again.

	Parameter(s): none
	
	Returns:
	
	Example(s):
		call vn_mf_fnc_action_capture_player;
*/

private _actionText = format ["<t color='#0000FF'>%1</t>", "Re-Raise The Flag"];
private _actionIdleIcon = "custom\holdactions\holdAction_interact_ca.paa";
private _actionProgressIcon = "custom\holdactions\holdAction_interact_ca.paa";

private _isNotOpfor = "side player == west";
private _isInRangeOf = "player distance cursorObject < 5";
private _isValidObjectType = "typeOf cursorObject in ['vn_flag_usa', 'vn_flag_aus', 'vn_flag_arvn', 'vn_flag_nz']";
private _isObjectiveFlag = "(flagAnimationPhase cursorObject) != 1";

private _conditionToShow = format [
        "(%1 && %2 && %3 && %4)",
        _isNotOpfor,
        _isInRangeOf,
        _isValidObjectType,
        _isObjectiveFlag
];

private _conditionToProgress = "true";

private _codeOnStart = {
	allPlayers apply {["BlueforRaisingFlag", []] remoteExec ["para_c_fnc_show_notification", _x]};
};
private _codeOnTick = {
	params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
	private _startingFlagHeight = cursorObject getVariable ["currentHeight", flagAnimationPhase cursorObject];
	private _newHeight = _startingFlagHeight + ((1 - _startingFlagHeight) * (_progress / _maxProgress));
	cursorObject setFlagAnimationPhase _newHeight;
};
private _codeOnComplete = {
	cursorObject setVariable ["currentHeight", flagAnimationPhase cursorObject];
	allPlayers apply {["BlueforRaisedFlag", []] remoteExec ["para_c_fnc_show_notification", _x]};
};
private _codeOnInterrupted = {
	cursorObject setVariable ["currentHeight", flagAnimationPhase cursorObject];
};
private _extraArgsArr = [flagAnimationPhase cursorObject];
private _actionDurationSeconds = 20;
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
