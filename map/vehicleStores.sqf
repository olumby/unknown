vehicleStores = compileFinal str
[
    ["vehicleStore_debug", "vehicle_debug"],
    ["vehicleStore_001", "vehicle_001"],
    ["vehicleStore_002", "vehicle_002"],
    ["vehicleStore_003", "vehicle_003"]
];

vehicleStoreContentCar = compileFinal str
[
    ["B_MRAP_01_F", 2000],
    //["B_MRAP_01_gmg_F", 5000], // Hunter GMG
    ["B_MRAP_01_hmg_F", 5000],
    ["O_MRAP_02_F", 2000],
    //["O_MRAP_02_gmg_F", 5000], // Ifrit GMG
    ["O_MRAP_02_hmg_F", 5000],
    ["I_MRAP_03_F", 3000],
    //["I_MRAP_03_gmg_F", 6000], // Strider GMG
    ["I_MRAP_03_hmg_F", 6000]
];

vehicleStoreContentUtility = compileFinal str
[
    ["B_Truck_01_mover_F", 4000], // HEMTT Tractor
    ["B_Truck_01_box_F", 5000], // HEMTT Box
    ["B_Truck_01_transport_F", 6000], // HEMTT Transport
    ["B_Truck_01_covered_F", 7500], // HEMTT Covered
    ["B_Truck_01_fuel_F", 9000], // HEMTT Fuel
    ["B_Truck_01_medical_F", 10000], // HEMTT Medical
    ["B_Truck_01_Repair_F", 12000], // HEMTT Repair
    ["B_Truck_01_ammo_F", 27000] // HEMTT Ammo
];

vehicleStoreContentArmored = compileFinal str
[
    ["O_APC_Wheeled_02_rcws_F", 75000], // Marid
    ["B_APC_Wheeled_01_cannon_F", 75000], // Marshall
    ["I_APC_Wheeled_03_cannon_F", 75000], // Gorgon
    ["B_APC_Tracked_01_CRV_F", 75000], // Bobcat
    ["B_APC_Tracked_01_rcws_F", 75000], // Panther
    ["I_APC_tracked_03_cannon_F", 75000], // Mora
    ["O_APC_Tracked_02_cannon_F", 75000], // Kamysh
    ["B_APC_Tracked_01_AA_F", 75000], // Cheetah
    ["O_APC_Tracked_02_AA_F", 75000], // Tigris
    ["B_MBT_01_cannon_F", 95000], // M2A1 Slammer
    ["B_MBT_01_TUSK_F", 100000], // M2A4 Slammer UP
    ["O_MBT_02_cannon_F", 100000], // Varsuk
    ["I_MBT_03_cannon_F", 100000] // Kuma
];

vehicleStoreContent = compileFinal str (call vehicleStoreContentCar + call vehicleStoreContentUtility + call vehicleStoreContentArmored);
