spawnLocations = compile preprocessFileLineNumbers "map\spawns.sqf";
vehicleStores = compile preprocessFileLineNumbers "map\vehicleStores.sqf";

if (isServer) then {
    diag_log "Server Initializing";
    [] execVM "server\init.sqf";
};

if (!isDedicated) then {
    [] execVM "client\init.sqf";
};

// Third Party Stuff
execVM "external\R3F_LOG\init.sqf";
