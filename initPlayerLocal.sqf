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

// register event handlers
[] spawn registerEvents;

// Setup flags
[] execVM "client\flags\init.sqf";

// Setup HUD
[] spawn runPlayerHud;
