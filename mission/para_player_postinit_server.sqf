/*
	File: para_player_postinit_server.sqf
	Author: Savage Game Design
	Public: No
	
	Description:
		Called on the server after init_client has run on the client.
		It is safe to access the player object in this function.
		Used to finalise the player after initialisation.

		Load order:
			- para_player_preload_client.sqf - Called as soon as possible on the client.
			- para_player_loaded_client.sqf - Called on client as soon as the player is ready
			- para_player_init_server.sqf - Serverside player initialisation.
			- para_player_init_client.sqf - Clientside player initialisation.
			- para_player_postinit_server.sqf - Called on server once all player initialisation is done.
	
	Parameter(s):
		_player - Player being initialised [OBJECT]
		_didJIP - Whether the player JIP'd
	
	Returns:
		None
	
	Example(s):
		None
*/

params ["_player", "_didJIP"];

private _curators = missionNamespace getVariable ["curatorUIDs", []];

private _playerIsCurator = _curators findIf { _x == getPlayerUID _player} > -1;
if(_playerIsCurator == true) then
{	
	[_player] call {
		[0, {
			params ["_thePlayer"];
			private _playerUID = getPlayerUID _thePlayer;
			private _curVarName = _playerUID+"_Cur";
			private _myCurObject = missionNamespace getVariable [_curVarName, objNull];
			
			if (isNull _myCurObject) then {
				if (isNil "MikeFrcCur_group") then {MikeFrcCur_group = creategroup sideLogic;};
				_myCurObject = MikeFrcCur_group createunit["ModuleCurator_F", [0, 90, 90], [], 0.5, "NONE"];	//Logic Server
				_myCurObject setVariable ["showNotification",false];
				
				missionNamespace setVariable [_curVarName, _myCurObject, true];
				publicVariable "MikeFrcCur_group";
				unassignCurator _myCurObject;
				_cfg = (configFile >> "CfgPatches");
				_newAddons = [];
				for "_i" from 0 to((count _cfg) - 1) do {
					_name = configName(_cfg select _i);
					_newAddons pushBack _name;
				};

				if (count _newAddons > 0) then {_myCurObject addCuratorAddons _newAddons};

				diag_log format ["[+] Curator object created %1.", _myCurObject];
			};

			unassignCurator _myCurObject;
			sleep 0.4;
			_thePlayer assignCurator _myCurObject;

			diag_log format ["[+] Player %1 added to %2.", _thePlayer, _myCurObject];
		}, _this] call CBA_fnc_globalExecute;
	};
};

diag_log format ["Mike Force: Player postinit server - %1", _player];
