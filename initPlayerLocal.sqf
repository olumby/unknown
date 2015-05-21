waitUntil { !isNull player; time > 0.1 };

enableRadio false;
enableSentences false;

// Enable Groups
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

9999 cutText ["Fixing Netcode, please wait.", "BLACK", 0.01];

// Compile Scripts
call compile preprocessFileLineNumbers "client\compile.sqf";

// Setup flags
[] execVM "client\flags\init.sqf";
[] execVM "client\dialogs\flagCapture\runFlagCapture.sqf";

// Setup HUD
[] execVM "client\dialogs\hud\runHud.sqf";
