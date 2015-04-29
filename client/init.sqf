waitUntil {!isNull player};
waitUntil {time > 0.1};

call compile preprocessFileLineNumbers "client\functions\compile.sqf";

[] spawn setupPlayer;
player addEventHandler ["Respawn", { [] spawn setupPlayer }];
