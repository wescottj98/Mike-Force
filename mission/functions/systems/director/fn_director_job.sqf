/*
    File: fn_director_job.sqf
    Author: Savage Game Design
    Public: No

    Description:
		Periodic job that runs the gameplay director.

    Parameter(s):
		None

    Returns:
		None

    Example(s):
		["gameplay_director", vn_mf_fnc_director_job, [], 30] call para_g_fnc_scheduler_add_job;
*/

////////////////////////////////////////
// New task handling - Main game flow //
////////////////////////////////////////

private _completedZones = mf_s_siegedZones select {[_x # 1] call vn_mf_fnc_task_is_completed};
mf_s_siegedZones = mf_s_siegedZones - _completedZones;

if (mf_s_activeZones isEqualTo []) then 
{
	call vn_mf_fnc_director_open_closest_zone;
};

///////////////////////
// Mission end state //
///////////////////////

[] call vn_mf_fnc_director_check_mission_end;