vehicleStores = compileFinal str
[
    ["vehicleStore_debug", "vehicle_debug"],
    ["vehicleStore_001", "vehicle_001"],
    ["vehicleStore_002", "vehicle_002"],
    ["vehicleStore_003", "vehicle_003"]
];

vehicleStoreContentCar = compileFinal str
[
    ["Hunter", "B_MRAP_01_F"],
    ["Hunter HMG", "B_MRAP_01_hmg_F"],
    ["Ifrit", "O_MRAP_02_F"],
    ["Ifrit HMG", "O_MRAP_02_hmg_F"],
    ["Strider", "I_MRAP_03_F"],
    ["Strider HMG", "I_MRAP_03_hmg_F"]
];

vehicleStoreContentArmored = compileFinal str
[
    ["MSE-3 Marid", "O_APC_Wheeled_02_rcws_F"],
    ["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F"],
    ["AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F"],
    ["CRV-6e Bobcat", "B_APC_Tracked_01_CRV_F"],
    ["IFV-6c Panther", "B_APC_Tracked_01_rcws_F"],
    ["FV-720 Mora", "I_APC_tracked_03_cannon_F"],
    ["BTR-K Kamysh", "O_APC_Tracked_02_cannon_F"],
    ["IFV-6a Cheetah AA", "B_APC_Tracked_01_AA_F"],
    ["ZSU-39 Tigris AA", "O_APC_Tracked_02_AA_F"],
    ["M2A1 Slammer", "B_MBT_01_cannon_F"],
    ["M2A4 Slammer UP", "B_MBT_01_TUSK_F"],
    ["T-100 Varsuk", "O_MBT_02_cannon_F"],
    ["MBT-52 Kuma", "I_MBT_03_cannon_F"]
];

vehicleStoreContent = compileFinal str (call vehicleStoreContentCar + call vehicleStoreContentArmored);
