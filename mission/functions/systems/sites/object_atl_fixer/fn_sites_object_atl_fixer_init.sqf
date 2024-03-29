/*
	File: fn_sites_object_atl_fixer_init.sqf
	Author: 'DJ' Dijksterhuis
	Public: Yes

	Description:
		Init the site object ATL Z-position fixer job.
		This is basically a rework of the fallthrough_checker system in paradigm global.

	Parameter(s): none

	Returns: nothing

	Example(s):
		call vn_mf_fnc_sites_object_atl_fixer_init
*/

/*
this is deliberately VERY low frequency.

while it is super annoying that objects get borked under the terrain, 
players can go and deal with other sites and come back to the borked one.
*/

["sites_object_atl_fixer", vn_mf_fnc_sites_object_atl_fixer_job, [], 189] call para_g_fnc_scheduler_add_job;

/*
localNamespace --> no network broadcasts allowed -- everything occurs in server locality.

this means we can't add objects from player locality, e.g. from event handlers!
be aware of this if you're attempting to repurpose this in future
*/
localNamespace setVariable ["sites_object_atl_fixer_objects", []];
