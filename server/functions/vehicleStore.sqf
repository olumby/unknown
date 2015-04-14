// this needs to be made dynamic

vehicleStore_001 attachTo [vehicleTable_001, [0,0,0.58]];
vehicleStore_001 setDir 90;
vehicleStore_001 addAction ["Spawn Hunter HMG", "client\functions\vehicleSpawn.sqf", [getMarkerPos "vehicle_001", "B_MRAP_01_hmg_F"]];
vehicleStore_001 addAction ["Spawn Pawnee", "client\functions\vehicleSpawn.sqf", [getMarkerPos "vehicle_001", "B_Heli_Light_01_armed_F"]];
vehicleStore_001 addAction ["Spawn Quad", "client\functions\vehicleSpawn.sqf", [getMarkerPos "vehicle_001", "B_Quadbike_01_F"]];
