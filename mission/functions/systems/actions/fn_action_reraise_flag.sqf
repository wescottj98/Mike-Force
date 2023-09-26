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

private _startingFlagHeight = flagAnimationPhase cursorObject;

private _actionText = format ["<t color='#0000FF'>%1</t>", "Re-Raise The Flag"];
private _actionIdleIcon = "custom\holdactions\holdAction_interact_ca.paa";
private _actionProgressIcon = "custom\holdactions\holdAction_interact_ca.paa";

private _isOpfor = "side player == west";
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

private _conditionToProgress = _conditionToShow;

private _codeOnStart = {
	// params ["_target", "_caller", "_actionId", "_arguments"];
	// allPlayers apply {["DacCongCapturingFlag", []] remoteExec ["para_c_fnc_show_notification", _x]};
};
7private _codeOnTick = {
	// params ["_target", "_caller", "_actionId", "_arguments", "_progress", "_maxProgress"];
	// max progress always 24
	// divide by 25 so we can remove the attached flag on completion rhater than at end of progress
	allPlayers apply {["BlueforRaisingFlag", []] remoteExec ["para_c_fnc_show_notification", _x]};

	// (progress * (1 - currHeight)) + currHeight
	private _newFlagPos = (1 - _startingFlagHeight) * (_progress / _maxProgress)) + _startingFlagHeight;
	[cursorObject, _newFlagPos, false] call BIS_fnc_animateFlag;
};
private _codeOnComplete = {
	// params ["_target", "_caller", "_actionId", "_arguments"];
	// will this work?
	allPlayers apply {["BlueforRaisedFlag", []] remoteExec ["para_c_fnc_show_notification", _x]};
};
private _codeOnInterrupted = {
	// params ["_target", "_caller", "_actionId", "_arguments"];

	/*
	do nothing -- bluefor have raised to a certain height
	so that's where the flag stays now.

	line below is only if we need to revert back to not doing this
	[cursorObject, _startingFlagHeight, true] call BIS_fnc_animateFlag;
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
