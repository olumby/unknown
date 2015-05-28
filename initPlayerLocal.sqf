waitUntil { !isNull player; time > 0.1 };

enableRadio false;
enableSentences false;

// Enable Groups
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

// Compile Scripts
call compile preprocessFileLineNumbers "client\compile.sqf";

// Draw Map Icons
_mainEh = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["draw", { [_this select 0] call fnc_drawMapIcons; }];

// Setup flags
[] execVM "client\flags\init.sqf";

// Setup HUD
[] spawn runPlayerHud;
