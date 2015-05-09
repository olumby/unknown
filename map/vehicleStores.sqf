/*
 * Contains the information about vehicle stores.
 */

vehicleStores = compileFinal str
[
    ["vehicleStore_debug", "vehicle_debug"],
    ["vehicleStore_001", "vehicle_001"],
    ["vehicleStore_002", "vehicle_002"],
    ["vehicleStore_003", "vehicle_003"]
];

vehicleStoreFilters = compileFinal str ["All","Car","Utility","Armored","Air","Autonomous"];

// Class, Price, Variations (optional) (see map/customVehicles.hpp)
vehicleStoreContentCar = compileFinal str
[
    ["B_Quadbike_01_F", 500], // Quadbike

    ["C_Hatchback_01_F", 600], // Hatchback
    ["C_Hatchback_01_sport_F", 1000], // Hatchback Sport

    ["C_SUV_01_F", 1500], // SUV

    ["C_Offroad_01_F", 2000, ["UK_Offroad_Police", "UK_Offroad_Service", "UK_Offroad_Guer_01", "UK_Offroad_Guer_02", "UK_Offroad_Guer_03", "UK_Offroad_Guer_04", "UK_Offroad_Guer_05", "UK_Offroad_Guer_05", "UK_Offroad_Guer_07", "UK_Offroad_Guer_08", "UK_Offroad_Guer_09", "UK_Offroad_Guer_10", "UK_Offroad_Guer_11", "UK_Offroad_Guer_12"]], // Offroad
    ["C_Offroad_01_repair_F", 6000], // Offroad Repair
    ["B_G_Offroad_01_armed_F", 10000], // Offroad HMG

    ["C_Van_01_transport_F", 600], // Truck
    ["B_G_Van_01_transport_F", 800], // Truck (Camo)
    ["C_Van_01_box_F", 800], // Truck Box
    
    ["C_Van_01_fuel_F", 6000], // Fuel Truck
    ["B_G_Van_01_fuel_F", 7000], // Fuel Truck (Camo)

    ["B_MRAP_01_F", 2000], // Hunter
    //["B_MRAP_01_gmg_F", 5000], // Hunter GMG
    ["B_MRAP_01_hmg_F", 5000], // Hunter HMG
    ["O_MRAP_02_F", 2000], //  Ifrit
    //["O_MRAP_02_gmg_F", 5000], // Ifrit GMG
    ["O_MRAP_02_hmg_F", 5000], // Ifrit HMG
    ["I_MRAP_03_F", 3000, ["UK_Strider_Nato"]], // Strider
    //["I_MRAP_03_gmg_F", 6000, ["UK_Strider_Nato"]], // Strider GMG
    ["I_MRAP_03_hmg_F", 6000, ["UK_Strider_Nato"]] // Strider HMG
];

vehicleStoreContentUtility = compileFinal str
[
    ["B_Truck_01_mover_F", 4000], // HEMTT
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

vehicleStoreContentAir = compileFinal str
[
    ["C_Heli_Light_01_civil_F", 6000], // M-900 (Civilians)
    ["B_Heli_Light_01_F", 7000], // MH-9 Hummingbird
    ["B_Heli_Light_01_armed_F", 40000], // AH-9 Pawnee

    ["O_Heli_Light_02_unarmed_F", 7000], // PO-30 Orca (Black)
    ["O_Heli_Light_02_v2_F", 80000], // PO-30 Orca (Armed, Black & White)
    ["O_Heli_Light_02_F", 90000], // PO-30 Orca (Armed)
    
    ["I_Heli_light_03_unarmed_F", 7000], // WY-55 Hellcat
    ["I_Heli_light_03_F", 80000], // WY-55 Hellcat (Armed)

    ["O_Heli_Transport_04_F", 9000], // Mi-290 Taru
    ["O_Heli_Transport_04_box_F", 10000], // Mi-290 Taru (Cargo)
    ["O_Heli_Transport_04_fuel_F", 15000], // Mi-290 Taru (Fuel)
    ["O_Heli_Transport_04_bench_F", 10000], // Mi-290 Taru (Bench)
    ["O_Heli_Transport_04_covered_F", 10000], // Mi-290 Taru (Transport)
    ["O_Heli_Transport_04_medevac_F",12000], // Mi-290 Taru (Medical)
    ["O_Heli_Transport_04_repair_F", 15000], // Mi-290 Taru (Repair)
    ["O_Heli_Transport_04_ammo_F", 35000], // Mi-290 Taru (Ammo)

    ["B_Heli_Transport_03_unarmed_F", 15000], // CH-67 Huron
    ["B_Heli_Transport_03_F", 80000], // CH-67 Huron (Armed)

    ["I_Heli_Transport_02_F", 10000], // CH-49 Mohawk

    ["B_Heli_Transport_01_F", 80000], // UH-80 Ghost Hawk
    ["B_Heli_Transport_01_camo_F", 80000] // UH-80 Ghost Hawk (Camo)
];

vehicleStoreContentAutonomous = compileFinal str 
[
    ["B_UGV_01_F", 2500], // UGV Stomper (NATO)
    ["B_UGV_01_rcws_F", 15000], // UGV Stomper RCWS (NATO)
    ["I_UGV_01_F", 2500], // UGV Stomper (AAF)
    ["I_UGV_01_rcws_F", 15000], // UGV Stomper RCWS (AAF)
    ["O_UGV_01_F", 2500], // UGV Saif (CSAT)
    ["O_UGV_01_rcws_F", 15000] // UGV Saif RCWS (CSAT)
];

vehicleStoreContent = compileFinal str (call vehicleStoreContentCar + call vehicleStoreContentUtility + call vehicleStoreContentArmored + call vehicleStoreContentAir + call vehicleStoreContentAutonomous);
