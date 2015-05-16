/*
 * Contains the information about gun stores.
 */

gunStores = compileFinal str
[
    "gunStore_001",
    "gunStore_002",
    "gunStore_003"
];

gunStoreFilters = compileFinal str ["Rifles","Machine Guns","Sniper Rifles","Launchers","Handguns","Misc."];

// Move to Overrides
gunStoreBannedAccessories = compileFinal str [
    // muzzle

    // optics

    // pointer

    // under barrel
];

gunStoreContentRifles = compileFinal str
[
    ["arifle_SDAR_F", 250], // SDAR 5.56 mm
    ["arifle_Mk20C_plain_F", 250], // Mk20C 5.56 mm
    ["arifle_Mk20C_F", 250], // Mk20C 5.56 mm (Camo)
    ["arifle_Mk20_plain_F", 250], // Mk20 5.56 mm
    ["arifle_Mk20_F", 250], // Mk20 5.56 mm (Camo)
    ["arifle_Mk20_GL_plain_F", 250], // Mk20 EGLM 5.56 mm
    ["arifle_Mk20_GL_F", 250], // Mk20 EGLM 5.56 mm (Camo)
    ["arifle_TRG20_F", 250], // TRG-20 5.56 mm
    ["arifle_TRG21_F", 250], // TRG-21 5.56 mm
    ["arifle_TRG21_GL_F", 250], // TRG-21 EGLM 5.56 mm
    ["arifle_Katiba_C_F", 250], // Katiba Carbine 6.5 mm
    ["arifle_Katiba_F", 250], // Katiba 6.5 mm
    ["arifle_Katiba_GL_F", 250], // Katiba GL 6.5 mm
    ["arifle_MXC_F", 250], // MXC 6.5 mm
    ["arifle_MXC_Black_F", 250], // MXC 6.5 mm (Black)
    ["arifle_MX_F", 250], // MX 6.5 mm
    ["arifle_MX_Black_F", 250], // MX 6.5 mm (Black)
    ["arifle_MX_GL_F", 250], // MX 3GL 6.5 mm
    ["arifle_MX_GL_Black_F", 250], // MX 3GL 6.5 mm (Black)
    ["arifle_MXM_F", 250], // MXM 6.5 mm
    ["arifle_MXM_Black_F", 250], // MXM 6.5 mm (Black)
    ["MMG_01_tan_F", 250], // Navid 9.3mm (Tan)
    ["MMG_01_hex_F", 250], // Navid 9.3mm (Hex)
    ["MMG_02_camo_F", 250], // SPMG .338 (MTP)
    ["MMG_02_sand_F", 250], // SPMG .338 (Sand)
    ["MMG_02_black_F", 250] // SPMG .338 (Black)
];

gunStoreContentMachine = compileFinal str
[
    ["arifle_MX_SW_F", 250], // MX SW 6.5 mm
    ["arifle_MX_SW_Black_F", 250], // MX SW 6.5 mm (Black)
    ["LMG_Mk200_F", 250], // Mk200 6.5 mm
    ["LMG_Zafir_F", 250] // Zafir 7.62 mm
];

gunStoreContentSniperRifles = compileFinal str
[
    ["srifle_DMR_04_F", 500], // ASP-1 Kir 12.7mm (Black)
    ["srifle_DMR_04_tan_F", 500], // ASP-1 Kir 12.7mm (Tan)
    ["srifle_DMR_01_F", 500], // Rahim 7.62 mm
    ["srifle_EBR_F", 500], // Mk18 ABR 7.62 mm
    ["srifle_DMR_06_camo_F", 500], // Mk14 7.62mm (Camo)
    ["srifle_DMR_06_olive_F", 500], // Mk14 7.62mm (Olive)
    ["srifle_DMR_03_F", 500], // Mk-I EMR 7.62mm (Black)
    ["srifle_DMR_03_multicam_F", 500], // Mk-I EMR 7.62mm (Camo)
    ["srifle_DMR_03_khaki_F", 500], // Mk-I EMR 7.62mm (Khaki)
    ["srifle_DMR_03_tan_F", 500], // Mk-I EMR 7.62mm (Sand)
    ["srifle_DMR_03_woodland_F", 500], // Mk-I EMR 7.62mm (Woodland)
    ["srifle_DMR_02_F", 500], // MAR-10 .338 (Black)
    ["srifle_DMR_02_camo_F", 500], // MAR-10 .338 (Camo)
    ["srifle_DMR_02_sniper_F", 500], // MAR-10 .338 (Sand)
    ["srifle_DMR_05_blk_F", 500], // Cyrus 9.3mm (Black)
    ["srifle_DMR_05_hex_F", 500], // Cyrus 9.3mm (Hex)
    ["srifle_DMR_05_tan_f", 500], // Cyrus 9.3mm (Tan)
    ["srifle_LRR_LRPS_F", 500], // M320 LRR .408
    ["srifle_LRR_camo_LRPS_F", 500], // M320 LRR .408 (Camo)
    ["srifle_GM6_LRPS_F", 500], // GM6 Lynx 12.7 mm
    ["srifle_GM6_camo_LRPS_F", 500] // GM6 Lynx 12.7 mm (Camo)
];

gunStoreContentLaunchers = compileFinal str
[
    ["launch_NLAW_F", 250], // PCML
    ["launch_RPG32_F", 250], // RPG-42 Alamut
    ["launch_Titan_short_F", 250], // Titan MPRL Compact
    ["launch_O_Titan_short_F", 250], // Titan MPRL Compact
    ["launch_I_Titan_short_F", 250], // Titan MPRL Compact
    ["launch_Titan_F", 250], // Titan MPRL Launcher
    ["launch_O_Titan_F", 250], // Titan MPRL Launcher
    ["launch_I_Titan_F", 250] // Titan MPRL Launcher
];

gunStoreContentHandguns = compileFinal str
[
    ["hgun_P07_F", 100], // P07 9 mm
    ["hgun_Rook40_F", 100], // Rook-40 9 mm
    ["hgun_ACPC2_F", 100], // ACP-C2 .45
    ["hgun_Pistol_heavy_01_F", 100], // 4-five .45
    ["hgun_Pistol_heavy_02_F", 100] // Zubr .45
];

gunStoreContentMisc = compileFinal str
[
    ["MiniGrenade", 100], // RGN Grenade
    ["HandGrenade", 100], // RGO Grenade
    ["B_IR_Grenade", 100], // IR Grenade (NATO)
    ["O_IR_Grenade", 100], // IR Grenade (CSAT)
    ["I_IR_Grenade", 100], // IR Grenade (AAF)
    ["SmokeShell", 100], // Smoke (White)
    ["SmokeShellYellow", 100], // Smoke (Yellow)
    ["SmokeShellGreen", 100], // Smoke (Green)
    ["SmokeShellRed", 100], // Smoke (Red)
    ["SmokeShellPurple", 100], // Smoke (Purple)
    ["SmokeShellOrange", 100], // Smoke (Orange)
    ["SmokeShellBlue", 100], // Smoke (Blue)
    ["DemoCharge_Remote_Mag", 100], // Explosive Charge
    ["IEDUrbanSmall_Remote_Mag", 100], // IED Small (Urban)
    ["IEDLandSmall_Remote_Mag", 100], // IED Small (Dug-in)
    ["SatchelCharge_Remote_Mag", 100], // Explosive Satchel
    ["IEDUrbanBig_Remote_Mag", 100], // IED Large (Urban)
    ["IEDLandBig_Remote_Mag", 100], // IED Large (Dug-in)
    ["ATMine_Range_Mag", 100], // AT Mine
    ["ClaymoreDirectionalMine_Remote_Mag", 100], // Claymore Charge
    ["APERSMine_Range_Mag", 100], // APERS Mine
    ["APERSTripMine_Wire_Mag", 100], // APERS Tripwire Mine
    ["SLAMDirectionalMine_Wire_Mag", 100], // M6 SLAM Mine
    ["APERSBoundingMine_Range_Mag", 100] // APERS Bounding Mine
];
