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
    ["B_MRAP_01_hmg_F", 5000],
    ["O_MRAP_02_F", 2000],
    ["O_MRAP_02_hmg_F", 5000],
    ["I_MRAP_03_F", 3000],
    ["I_MRAP_03_hmg_F", 6000]
];

vehicleStoreContentArmored = compileFinal str
[
    ["O_APC_Wheeled_02_rcws_F", 75000],
    ["B_APC_Wheeled_01_cannon_F", 75000],
    ["I_APC_Wheeled_03_cannon_F", 75000],
    ["B_APC_Tracked_01_CRV_F", 75000],
    ["B_APC_Tracked_01_rcws_F", 75000],
    ["I_APC_tracked_03_cannon_F", 75000],
    ["O_APC_Tracked_02_cannon_F", 75000],
    ["B_APC_Tracked_01_AA_F", 75000],
    ["O_APC_Tracked_02_AA_F", 75000],
    ["B_MBT_01_cannon_F", 95000],
    ["B_MBT_01_TUSK_F", 100000],
    ["O_MBT_02_cannon_F", 100000],
    ["I_MBT_03_cannon_F", 100000]
];

vehicleStoreContent = compileFinal str (call vehicleStoreContentCar + call vehicleStoreContentArmored);
