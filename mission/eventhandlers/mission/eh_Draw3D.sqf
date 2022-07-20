/*
    File: eh_Draw3D.sqf
    Author: Savage Game Design
    Public: No

    Description:
	    Draw 3d Event Handler.

    Parameter(s): none

    Returns: nothing

    Example(s):
	    Not called directly.
*/

// do cool stuff here with drawIcon3D or drawLine3D
private _inMACV = [player, "MACV"] call para_g_fnc_db_check_whitelist;
private _inMP = [player, "MilitaryPolice"] call para_g_fnc_db_check_whitelist;
if (_inMACV || _inMP) then 
{
    private _offset = [0, 0, 0];
    {
        if (_x == player) then { continue };
        //if !(isPlayer _x) exitWith {};
        if !(side _x == side player) then { continue };
        
        private _screenPosition = worldToScreen (_x modelToWorldVisual _offset);
        if (_screenPosition isEqualTo []) then { continue };

        private _playerDistance = player distance _x;
        if (_playerDistance > 100) then { continue };

        private _targetName = name _x;
        private _pos = ASLToAGL getPosASLVisual _x;
        drawIcon3D
        [
            "",
            [1,1,0,1],
            _pos,
            1,
            1,
            0,
            name _x,
            0,
            0.04,
            "RobotoCondensed",
            "center",
            true
        ];

    } forEach playableUnits;
};

