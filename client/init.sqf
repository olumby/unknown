waitUntil {!isNull player};
waitUntil {time > 0.1};

titleText ["Client Loaded", "PLAIN DOWN"];

call compile preprocessFileLineNumbers "client\functions\compile.sqf";

[] spawn setupPlayer;
player addEventHandler ["Respawn", { [] spawn setupPlayer }];
