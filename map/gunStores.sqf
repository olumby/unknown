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

gunStoreBannedAccessories = compileFinal str [
    // muzzle

    // optics
    
    // pointer
    
    // under barrel
];

gunStoreContentRifles = compileFinal str 
[
    ["arifle_SDAR_F", 250], // SDAR
    ["arifle_Mk20C_plain_F", 250], // Mk20C
    ["arifle_Mk20C_F", 250], // Mk20C (Camo)
    ["arifle_Mk20_plain_F", 250], // Mk20
    ["arifle_Mk20_F", 250], // Mk20 (Camo)
    ["arifle_Mk20_GL_plain_F", 250], // Mk20 EGLM
    ["arifle_Mk20_GL_F", 250], // Mk20 EGLM (Camo)
    ["arifle_TRG20_F", 250], // TRG-20
    ["arifle_TRG21_F", 250], // TRG-21 
    ["arifle_TRG21_GL_F", 250], // TRG-21 EGLM
    ["arifle_Katiba_C_F", 250], // Katiba Carbine
    ["arifle_Katiba_F", 250], // Katiba
    ["arifle_Katiba_GL_F", 250], // Katiba GL
    ["arifle_MXC_F", 250], // MXC
    ["arifle_MXC_Black_F", 250], // MXC (Black)
    ["arifle_MX_F", 250], // MX
    ["arifle_MX_Black_F", 250], // MX (Black)
    ["arifle_MX_GL_F", 250], // MX 3GL
    ["arifle_MX_GL_Black_F", 250], // MX 3GL (Black)
    ["arifle_MXM_F", 250], // MXM
    ["arifle_MXM_Black_F", 250], // MXM (Black)
    ["MMG_01_tan_F", 250], // Navid (Tan)
    ["MMG_01_hex_F", 250], // Navid (Hex)
    ["MMG_02_camo_F", 250], // SPMG (MTP)
    ["MMG_02_sand_F", 250], // SPMG (Sand)
    ["MMG_02_black_F", 250] // SPMG (Black)
];

gunStoreContentMachine = compileFinal str 
[
    ["arifle_MX_SW_F", 250], // MX SW
    ["arifle_MX_SW_Black_F", 250], // MX SW (Black)
    ["LMG_Mk200_F", 250], // Mk200
    ["LMG_Zafir_F", 250] // Zafir
];

gunStoreContentSniperRifles = compileFinal str 
[
    ["srifle_DMR_04_F", 500], // ASP-1 Kir
    ["srifle_DMR_04_tan_F", 500], // ASP-1 Kir (Tan)
    ["srifle_DMR_01_F", 500], // DMR
    ["srifle_EBR_F", 500], // Mk18 ABR
    ["srifle_DMR_06_camo_F", 500], // Mk14 (Camo)
    ["srifle_DMR_06_olive_F", 500], // Mk14 (Olive)
    ["srifle_DMR_03_F", 500], // Mk-I EMR
    ["srifle_DMR_03_multicam_F", 500], // Mk-I EMR (Camo)
    ["srifle_DMR_03_khaki_F", 500], // Mk-I EMR (Khaki)
    ["srifle_DMR_03_tan_F", 500], // Mk-I EMR (Sand)
    ["srifle_DMR_03_woodland_F", 500], // Mk-I EMR (Woodland)
    ["srifle_DMR_02_F", 500], // MAR-10 (Black)
    ["srifle_DMR_02_camo_F", 500], // MAR-10 (Camo)
    ["srifle_DMR_02_sniper_F", 500], // MAR-10 (Sand)
    ["srifle_DMR_05_blk_F", 500], // Cyrus
    ["srifle_DMR_05_hex_F", 500], // Cyrus (Hex)
    ["srifle_DMR_05_tan_f", 500], // Cyrus (Tan)
    ["srifle_LRR_LRPS_F", 500], // M320 LRR
    ["srifle_LRR_camo_LRPS_F", 500], // M320 LRR (Camo)
    ["srifle_GM6_LRPS_F", 500], // GM6 Lynx
    ["srifle_GM6_camo_LRPS_F", 500] // GM6 Lynx (Camo)
];

gunStoreContentLaunchers = compileFinal str 
[
    ["launch_NLAW_F", 250], // PCML
    ["launch_RPG32_F", 250], // RPG-42
    ["launch_Titan_short_F", 250], // Titan Compact (Tan)
    ["launch_O_Titan_short_F", 250], // Titan Compact (Brown)
    ["launch_I_Titan_short_F", 250], // Titan Compact (Olive)
    ["launch_Titan_F", 250], // Titan AA (Desert)
    ["launch_O_Titan_F", 250], // Titan AA (Hex)
    ["launch_I_Titan_F", 250] // Titan AA (Digi)
];

gunStoreContentHandguns = compileFinal str 
[
    ["hgun_P07_F", 100], // P07
    ["hgun_Rook40_F", 100], // Rook-40
    ["hgun_ACPC2_F", 100], // ACP-C2
    ["hgun_Pistol_heavy_01_F", 100], // 4-Five
    ["hgun_Pistol_heavy_02_F", 100] // Zubr
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
