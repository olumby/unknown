// Friendly

civilian setFriend [west, 0];
civilian setFriend [east, 0];
civilian setFriend [resistance, 0];
west setFriend [civilian, 0];
west setFriend [east, 0];
west setFriend [resistance, 0];
east setFriend [west, 0];
east setFriend [civilian, 0];
east setFriend [resistance, 0];
resistance setFriend [west, 0];
resistance setFriend [civilian, 0];
resistance setFriend [east, 0];

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
