/*
	File: fn_is_current_mission_active.sqf
	Author: Savage Game Design
	
	Public: No
	
	Description:
	    		Checks if the mission is active.
	
	Parameter(s): 
		none
	
	Returns: 
		false - Mission is not active
		true - Mission is active
	
	Example(s):
	    call vn_mf_fnc_is_current_mission_active;
*/

private _result = isKeyActive missionName;

_result
