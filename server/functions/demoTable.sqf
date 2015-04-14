titleText ["executed", "PLAIN DOWN"];

demoTableLaptop attachTo [demoTable, [0,0,0.58]];
demoTableLaptop addAction ["Spawn Town One", "client\functions\demoTableSpawn.sqf", getMarkerPos "spawn_001"];
demoTableLaptop addAction ["Spawn Town Two", "client\functions\demoTableSpawn.sqf", getMarkerPos "spawn_002"];
demoTableLaptop addAction ["Spawn Town Three", "client\functions\demoTableSpawn.sqf", getMarkerPos "spawn_003"];
