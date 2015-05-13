waitUntil {!isNull player};
waitUntil {time > 0.1};

9999 cutText ["", "BLACK", 0.01];

call compile preprocessFileLineNumbers "client\compile.sqf";

//[] spawn setupPlayer;
player addEventHandler ["Respawn", { [] spawn setupPlayer }];
