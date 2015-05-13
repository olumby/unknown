waitUntil {!isNull player};
waitUntil {time > 0.1};

9999 cutText ["Fixing Netcode, please wait.", "BLACK", 0.01];

call compile preprocessFileLineNumbers "client\compile.sqf";

player addEventHandler ["Respawn", { [] spawn setupPlayer }];
