// Set friend status
west setFriend [west, 1];
west setFriend [east, 0];
west setFriend [resistance, 0];
west setFriend [civilian, 0];
east setFriend [west, 0];
east setFriend [east, 1];
east setFriend [resistance, 0];
east setFriend [civilian, 0];
resistance setFriend [west, 0];
resistance setFriend [east, 0];
resistance setFriend [resistance, 1];
resistance setFriend [civilian, 0];
civilian setFriend [west, 0];
civilian setFriend [east, 0];
civilian setFriend [resistance, 0];
civilian setFriend [civilian, 1];

// Enable Groups
["Initialize"] call BIS_fnc_dynamicGroups;

// Compile Scripts
call compile preprocessFileLineNumbers "server\compile.sqf";

// Setup admins
[] execVM "server\functions\admins.sqf";

// Setup Flags
[] execVM "server\flags\init.sqf";

// Start Missions
[] execVM "server\missions\init.sqf";

// Setup Spawns
[] execVM "server\spawns\init.sqf";
