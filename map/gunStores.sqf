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

gunStoreMagazinePricing = compileFinal str
[
    ["20Rnd_556x45_UW_mag", 100], // 5.56mm 20Rnd Dual Purpose Mag
    ["30Rnd_556x45_Stanag", 100], // 5.56mm 30rnd STANAG Mag
    ["30Rnd_556x45_Stanag_Tracer_Red", 100], // 5.56mm 30rnd Tracer (Red) Mag
    ["30Rnd_556x45_Stanag_Tracer_Green", 100], // 5.56mm 30rnd Tracer (Green) Mag
    ["30Rnd_556x45_Stanag_Tracer_Yellow", 100], // 5.56mm 30rnd Tracer (Yellow) Mag
    ["1Rnd_HE_Grenade_shell", 100], // 40mm HE Grenade Round
    ["UGL_FlareWhite_F", 100], // Flare Round (White)
    ["UGL_FlareGreen_F", 100], // Flare Round (Green)
    ["UGL_FlareRed_F", 100], // Flare Round (Red)
    ["UGL_FlareYellow_F", 100], // Flare Round (Yellow)
    ["UGL_FlareCIR_F", 100], // Flare Round (IR)
    ["1Rnd_Smoke_Grenade_shell", 100], // Smoke Round (White)
    ["1Rnd_SmokeRed_Grenade_shell", 100], // Smoke Round (Red)
    ["1Rnd_SmokeGreen_Grenade_shell", 100], // Smoke Round (Green)
    ["1Rnd_SmokeYellow_Grenade_shell", 100], // Smoke Round (Yellow)
    ["1Rnd_SmokePurple_Grenade_shell", 100], // Smoke Round (Purple)
    ["1Rnd_SmokeBlue_Grenade_shell", 100], // Smoke Round (Blue)
    ["1Rnd_SmokeOrange_Grenade_shell", 100], // Smoke Round (Orange)
    ["30Rnd_65x39_caseless_green", 100], // 6.5mm 30Rnd Caseless Mag
    ["30Rnd_65x39_caseless_green_mag_Tracer", 100], // 6.5mm 30Rnd Tracer (Green) Mag
    ["30Rnd_65x39_caseless_mag", 100], // 6.5mm 30Rnd STANAG Mag
    ["30Rnd_65x39_caseless_mag_Tracer", 100], // 6.5mm 30Rnd Tracer (Red) Mag
    ["3Rnd_HE_Grenade_shell", 100], // 40mm 3Rnd HE Grenade
    ["3Rnd_UGL_FlareWhite_F", 100], // 3Rnd 3GL Flares (White)
    ["3Rnd_UGL_FlareGreen_F", 100], // 3Rnd 3GL Flares (Green)
    ["3Rnd_UGL_FlareRed_F", 100], // 3Rnd 3GL Flares (Red)
    ["3Rnd_UGL_FlareYellow_F", 100], // 3Rnd 3GL Flares (Yellow)
    ["3Rnd_UGL_FlareCIR_F", 100], // 3Rnd 3GL Flares (IR)
    ["3Rnd_Smoke_Grenade_shell", 100], // 3Rnd 3GL Smoke Rounds (White)
    ["3Rnd_SmokeRed_Grenade_shell", 100], // 3Rnd 3GL Smoke Rounds (Red)
    ["3Rnd_SmokeGreen_Grenade_shell", 100], // 3Rnd 3GL Smoke Rounds (Green)
    ["3Rnd_SmokeYellow_Grenade_shell", 100], // 3Rnd 3GL Smoke Rounds (Yellow)
    ["3Rnd_SmokePurple_Grenade_shell", 100], // 3Rnd 3GL Smoke Rounds (Purple)
    ["3Rnd_SmokeBlue_Grenade_shell", 100], // 3Rnd 3GL Smoke Rounds (Blue)
    ["3Rnd_SmokeOrange_Grenade_shell", 100], // 3Rnd 3GL Smoke Rounds (Orange)
    ["150Rnd_93x64_Mag", 100], // 9.3mm 150Rnd Belt
    ["130Rnd_338_Mag", 100], // .338 NM 130Rnd Belt
    ["100Rnd_65x39_caseless_mag_Tracer", 100], // 6.5mm 100Rnd Tracer (Red) Belt Case
    ["100Rnd_65x39_caseless_mag", 100], // 6.5mm 100Rnd Belt Case
    ["200Rnd_65x39_cased_Box", 100], // 6.5mm 200Rnd Belt
    ["200Rnd_65x39_cased_Box_Tracer", 100], // 6.5mm 200Rnd Belt Tracer (Yellow)
    ["150Rnd_762x54_Box", 100], // 7.62mm 150Rnd Box
    ["150Rnd_762x54_Box_Tracer", 100], // 7.62mm 150Rnd Tracer (Green) Box
    ["10Rnd_127x54_Mag", 100], // 12.7mm 10Rnd Mag
    ["10Rnd_762x54_Mag", 100], // 7.62mm 10Rnd Mag
    ["20Rnd_762x51_Mag", 100], // 7.62mm 20Rnd Mag
    ["10Rnd_338_Mag", 100], // .338 LM 10Rnd Mag
    ["10Rnd_93x64_DMR_05_Mag", 100], // 9.3mm 10Rnd Mag
    ["7Rnd_408_Mag", 100], // .408 7Rnd LRR Mag
    ["5Rnd_127x108_Mag", 100], // 12.7mm 5Rnd Mag
    ["5Rnd_127x108_APDS_Mag", 100], // 12.7mm 5Rnd APDS Mag
    ["NLAW_F", 100], // PCML Missile
    ["RPG32_F", 100], // RPG-42 Rocket
    ["RPG32_HE_F", 100], // RPG-42 HE Rocket
    ["Titan_AT", 100], // Titan AT Missile
    ["Titan_AP", 100], // Titan AP Missile
    ["Titan_AA", 100], // Titan AA Missile
    ["16Rnd_9x21_Mag", 100], // 9mm 16Rnd Mag
    ["30Rnd_9x21_Mag", 100], // 9mm 30Rnd Mag
    ["9Rnd_45ACP_Mag", 100], // .45 ACP 9Rnd Mag
    ["11Rnd_45ACP_Mag", 100], // .45 ACP 11Rnd Mag
    ["6Rnd_45ACP_Cylinder", 100] // .45 ACP 6Rnd Cylinder
];

_gunStoreMagazineIndex = [];
{
    _class = _x select 0;
    _gunStoreMagazineIndex pushBack _class;
} foreach (call gunStoreMagazinePricing);
gunStoreMagazineIndex = compileFinal (str _gunStoreMagazineIndex);

gunStoreAccessoryPricing = compileFinal str
[
    ["acc_flashlight", 120], // Flashlight
    ["acc_pointer_IR", 120], // IR Laser Pointer
    ["muzzle_snds_M", 120], // Sound Suppressor (5.56 mm)
    ["muzzle_snds_H", 120], // Sound Suppressor (6.5 mm)
    ["muzzle_snds_93mmg", 120], // Sound Suppressor (9.3mm, Black)
    ["muzzle_snds_93mmg_tan", 120], // Sound Suppressor (9.3mm, Tan)
    ["muzzle_snds_338_black", 120], // Sound Suppressor (.338, Black)
    ["muzzle_snds_338_green", 120], // Sound Suppressor (.338, Green)
    ["muzzle_snds_338_sand", 120], // Sound Suppressor (.338, Sand)
    ["muzzle_snds_H_SW", 120], // Sound Suppressor LMG (6.5 mm)
    ["muzzle_snds_H_MG", 120], // Sound Suppressor LMG (6.5 mm)
    ["muzzle_snds_B", 120], // Sound Suppressor (7.62 mm)
    ["muzzle_snds_L", 120], // Sound Suppressor (9 mm)
    ["muzzle_snds_acp", 120], // Sound Suppressor (.45 ACP)
    ["bipod_01_F_snd", 120], // Bipod (Sand) [NATO]
    ["bipod_01_F_blk", 120], // Bipod (Black) [NATO]
    ["bipod_01_F_mtp", 120], // Bipod (MTP) [NATO]
    ["bipod_02_F_blk", 120], // Bipod (Black) [CSAT]
    ["bipod_02_F_tan", 120], // Bipod (Tan) [CSAT]
    ["bipod_02_F_hex", 120], // Bipod (Hex) [CSAT]
    ["bipod_03_F_blk", 120], // Bipod (Black) [AAF]
    ["bipod_03_F_oli", 120], // Bipod (Olive) [AAF]
    ["optic_Nightstalker", 120], // Nightstalker
    ["optic_tws", 120], // TWS
    ["optic_tws_mg", 120], // TWS MG
    ["optic_NVS", 120], // NVS
    ["optic_DMS", 120], // DMS
    ["optic_LRPS", 120], // LRPS
    ["optic_AMS", 120], // AMS (Black)
    ["optic_AMS_snd", 120], // AMS (Sand)
    ["optic_AMS_khk", 120], // AMS (Khaki)
    ["optic_KHS_blk", 120], // Kahlia (Black)
    ["optic_KHS_tan", 120], // Kahlia (Tan)
    ["optic_KHS_hex", 120], // Kahlia (Hex)
    ["optic_KHS_old", 120], // Kahlia (Old)
    ["optic_SOS", 120], // MOS
    ["optic_MRCO", 120], // MRCO
    ["optic_Arco", 120], // ARCO
    ["optic_Aco", 120], // ACO (Red)
    ["optic_ACO_grn", 120], // ACO (Green)
    ["optic_Aco_smg", 120], // ACO SMG (Red)
    ["optic_ACO_grn_smg", 120], // ACO SMG (Green)
    ["optic_Hamr", 120], // RCO
    ["optic_Holosight", 120], // MK17 Holosight
    ["optic_Holosight_smg", 120], // Mk17 Holosight SMG
    ["optic_MRD", 120], // MRD
    ["optic_Yorris", 120] // Yorris J2
];

_gunStoreAccessoryIndex = [];
{
    _class = _x select 0;
    _gunStoreAccessoryIndex pushBack _class;
} foreach (call gunStoreAccessoryPricing);
gunStoreAccessoryIndex = compileFinal (str _gunStoreAccessoryIndex);
