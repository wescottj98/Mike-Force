/*
    File: fn_release_cargo.sqf
    Author: Cerebral
    Public: No

    Description:
    	Release advance sling's cargo.

    Parameter(s):
		None

    Returns: nothing

    Example(s): none
*/

params ["_vehicle"];

private _vehicle = vehicle player;
private _cargo = call ASL_Release_Cargo_Action_Check;
if((driver _vehicle == player) && (_cargo))then {
	
	if([_vehicle] call ASL_Can_Release_Cargo) then {
		private _activeRopes = [_vehicle] call ASL_Get_Active_Ropes_With_Cargo;
		private _ropeNumber = count _activeRopes;

		for "_i" from 1 to _ropeNumber do {
			private _selector = _i - 1;
			[_vehicle,player,(_activeRopes select _selector) select _selector] call ASL_Release_Cargo;
		};
	};
};