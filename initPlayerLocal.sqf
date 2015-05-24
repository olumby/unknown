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

// Setup HUD
[] execVM "client\dialogs\hud\runHud.sqf";


player addAction ["Give me 100", "client\testMoney.sqf", 100];
player addAction ["Give me 1000", "client\testMoney.sqf", 1000];
player addAction ["Give me 12345", "client\testMoney.sqf", 12345];
