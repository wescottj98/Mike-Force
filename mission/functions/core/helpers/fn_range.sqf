/*
	File: fn_generate_range_arr.sqf
	Author: "DJ" Dijksterhuis
	Public: No
	
	Description:
		Generate simple array similar to python syntax: list(range(_start, _stop, _step))
	
	Parameter(s):
		_start - start value
		_stop - end value
		_step - step value
	
	Returns:
		Array of integers
	
	Example(s):
		[1, 10, 2] call vn_mf_fnc_generate_range_arr;
		[7, 1, -2] call vn_mf_fnc_generate_range_arr;
*/


params ["_start", "_stop", ["_step", 1]];
private _ret = [];
for "_i" from _start to _stop step _step do { _ret pushBack _i};
_ret
