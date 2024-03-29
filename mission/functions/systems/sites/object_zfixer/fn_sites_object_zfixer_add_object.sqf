/*
	File: fn_sites_object_atl_zadd_object.sqf
	Author: 'Dj' Dijksterhuis
	Public: Yes

	Description:
		Adds an object to the sites atl z-position fixer job.
		Basically a 1-element append to a localNamespace variable.

	Parameter(s):
		- _obj: the object to add

	Returns: nothing

	Example(s):
		[_my_obj] call vn_mf_fnc_sites_object_zfixer_add_object;
		_my_objs apply {[_x] call vn_mf_fnc_sites_object_zfixer_add_object};
*/

params ["_obj"];

private _existing_objs = localNamespace getVariable ["sites_object_zfixer_objects", []];
_existing_objs pushBack _obj;
localNamespace setVariable ["sites_object_zfixer_objects", _existing_objs];
