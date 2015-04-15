demoTableLaptop setVariable ["R3F_LOG_disabled", true];
demoTableLaptop attachTo [demoTable, [0,0,0.58]];
demoTableLaptop setDir 90;
demoTableLaptop addAction ["Spawn Town One", "client\functions\demoTableSpawn.sqf", getMarkerPos "spawn_001"];
demoTableLaptop addAction ["Spawn Town Two", "client\functions\demoTableSpawn.sqf", getMarkerPos "spawn_002"];
demoTableLaptop addAction ["Spawn Town Three", "client\functions\demoTableSpawn.sqf", getMarkerPos "spawn_003"];
