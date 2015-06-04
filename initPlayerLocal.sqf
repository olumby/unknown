/*
 * Executed locally when player joins mission (includes both mission start and JIP).
 */

disableSerialization;

waitUntil { !isNull player; time > 0.1 };

enableRadio false;
enableSentences false;

// Enable Groups
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// Compile Scripts
call compile preprocessFileLineNumbers "client\compile.sqf";

// Set up key bindings
[] spawn
{
    waitUntil { !isNull (findDisplay 46); };
    (findDisplay 46) displayAddEventHandler ["KeyDown", e_keyDown];
};

// Draw Map Icons
[] spawn
{
    waitUntil { !isNull (findDisplay 12); };
    _mainEh = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["draw", { [_this select 0] call e_drawMapIcons; }];
    waitUntil { !isNull (uiNamespace getVariable ["RscMiniMap", displayNull]); };
    _gpsEh = ((uiNamespace getVariable ["RscMiniMap", displayNull]) displayCtrl 101) ctrlAddEventHandler ["draw", { [_this select 0] call e_drawMapIcons; }];
};

// Draw 3d Icons
[] spawn
{
    _playerIconsEh = addMissionEventHandler ["Draw3D", { call e_drawPlayerIcons } ];
};

// Add kill event handler
player addMPEventHandler ["MPKilled", { call e_playerKilled } ];

// Setup flags
[] execVM "client\flags\init.sqf";

// Setup HUD
[] spawn runPlayerHud;
