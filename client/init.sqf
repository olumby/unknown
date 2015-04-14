titleText ["Client Loaded", "PLAIN DOWN"];

[] execVM "client\functions\setUpPlayer.sqf";

player addEventHandler ["Respawn", { [] execVM "client\functions\setUpPlayer.sqf" }];
