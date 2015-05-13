// Enable Groups
["Initialize"] call BIS_fnc_dynamicGroups;

// Set admins
[] execVM "server\functions\admins.sqf";

// Start up a mission
[] execVM "server\missions\init.sqf";
