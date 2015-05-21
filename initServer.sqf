// Enable Groups
["Initialize"] call BIS_fnc_dynamicGroups;

// Compile Scripts
call compile preprocessFileLineNumbers "server\compile.sqf";

// Set admins
[] execVM "server\functions\admins.sqf";

// Setup flags
[] execVM "server\flags\init.sqf";

// Start up a mission
[] execVM "server\missions\init.sqf";
