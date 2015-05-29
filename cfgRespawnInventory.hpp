// Heli Spawns
class westHeli1
{
    weapons[] = {
        "hgun_P07_F"
    };
    magazines[] = {
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag"
    };
    items[] = {
        "FirstAidKit"
    };
    linkedItems[] = {
        "V_BandollierB_rgr",
        "H_Watchcap_blk",
        "optic_Aco",
        "ItemMap",
        "ItemCompass",
        "ItemWatch",
        "ItemRadio"
    };
    uniformClass = "U_B_HeliPilotCoveralls";
    backpack = "B_AssaultPack_sgg";
};
class eastHeli1
{
    weapons[] = {
        "hgun_Rook40_F"
    };
    magazines[] = {
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag"
    };
    items[] = {
        "FirstAidKit"
    };
    linkedItems[] = {
        "V_BandollierB_rgr",
        "H_Shemag_tan",
        "optic_Aco",
        "ItemMap",
        "ItemCompass",
        "ItemWatch",
        "ItemRadio"
    };
    uniformClass = "U_O_PilotCoveralls";
    backpack = "B_AssaultPack_ocamo";
};
class resistanceHeli1
{
    weapons[] = {
        "hgun_ACPC2_F"
    };
    magazines[] = {
        "9Rnd_45ACP_Mag",
        "9Rnd_45ACP_Mag",
        "9Rnd_45ACP_Mag"
    };
    items[] = {
        "FirstAidKit"
    };
    linkedItems[] = {
        "V_BandollierB_cbr",
        "H_ShemagOpen_khk",
        "optic_Aco",
        "ItemMap",
        "ItemCompass",
        "ItemWatch",
        "ItemRadio"
    };
    uniformClass = "U_I_HeliPilotCoveralls";
    backpack = "B_AssaultPack_cbr";
};
// HALO Jumpers
class westHalo1
{
    weapons[] = {
        "SMG_01_F",
        "hgun_P07_F"
    };
    magazines[] = {
        "30Rnd_45ACP_Mag_SMG_01_tracer_green",
        "30Rnd_45ACP_Mag_SMG_01_tracer_green",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag"
    };
    items[] = {
        "FirstAidKit"
    };
    linkedItems[] = {
        "V_BandollierB_rgr",
        "H_Watchcap_blk",
        "optic_Aco",
        "ItemMap",
        "ItemCompass",
        "ItemWatch",
        "ItemRadio",
        "ItemGps"
    };
    uniformClass = "U_B_SpecopsUniform_sgg";
    backpack = "B_AssaultPack_mcamo";
};
class westHalo2: westHalo1
{
    weapons[] = {
        "SMG_02_F",
        "hgun_P07_F"
    };
    magazines[] = {
        "30Rnd_9x21_Mag",
        "30Rnd_9x21_Mag",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag"
    };
};
class eastHalo1
{
    weapons[] = {
        "SMG_01_F",
        "hgun_Rook40_F"
    };
    magazines[] = {
        "30Rnd_45ACP_Mag_SMG_01_tracer_green",
        "30Rnd_45ACP_Mag_SMG_01_tracer_green",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag"
    };
    items[] = {
        "FirstAidKit"
    };
    linkedItems[] = {
        "V_BandollierB_cbr",
        "H_Shemag_tan",
        "optic_Aco",
        "ItemMap",
        "ItemCompass",
        "ItemWatch",
        "ItemRadio",
        "ItemGps"
    };
    uniformClass = "U_O_SpecopsUniform_blk";
    backpack = "B_AssaultPack_cbr";
};
class eastHalo2: eastHalo1
{
    weapons[] = {
        "SMG_02_F",
        "hgun_Rook40_F"
    };
    magazines[] = {
        "30Rnd_9x21_Mag",
        "30Rnd_9x21_Mag",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag"
    };
};
class resistanceHalo1
{
    weapons[] = {
        "SMG_01_F",
        "hgun_ACPC2_F"
    };
    magazines[] = {
        "30Rnd_45ACP_Mag_SMG_01_tracer_green",
        "30Rnd_45ACP_Mag_SMG_01_tracer_green",
        "9Rnd_45ACP_Mag",
        "9Rnd_45ACP_Mag",
        "9Rnd_45ACP_Mag"
    };
    items[] = {
        "FirstAidKit"
    };
    linkedItems[] = {
        "V_BandollierB_oli",
        "H_Shemag_olive_hs",
        "optic_Aco",
        "ItemMap",
        "ItemCompass",
        "ItemWatch",
        "ItemRadio",
        "ItemGps"
    };
    uniformClass = "U_I_CombatUniform";
    backpack = "B_AssaultPack_dgtl";
};
class resistanceHalo2: resistanceHalo1
{
    weapons[] = {
        "SMG_02_F",
        "hgun_ACPC2_F"
    };
    magazines[] = {
        "30Rnd_9x21_Mag",
        "30Rnd_9x21_Mag",
        "9Rnd_45ACP_Mag",
        "9Rnd_45ACP_Mag",
        "9Rnd_45ACP_Mag"
    };
};
// Town Spawns
class westTown1
{
    weapons[] = {
        "hgun_P07_F"
    };
    magazines[] = {
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag"
    };
    items[] = {
        "FirstAidKit"
    };
    linkedItems[] = {
        "V_BandollierB_blk",
        "H_Watchcap_blk",
        "optic_Aco",
        "ItemMap",
        "ItemCompass",
        "ItemWatch",
        "ItemRadio"
    };
    uniformClass = "U_BG_Guerilla2_3";
    backpack = "B_AssaultPack_blk";
};
class eastTown1
{
    weapons[] = {
        "hgun_Rook40_F"
    };
    magazines[] = {
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag",
        "16Rnd_9x21_Mag"
    };
    items[] = {
        "FirstAidKit"
    };
    linkedItems[] = {
        "V_BandollierB_blk",
        "H_Bandanna_khk",
        "optic_Aco",
        "ItemMap",
        "ItemCompass",
        "ItemWatch",
        "ItemRadio"
    };
    uniformClass = "U_IG_Guerilla2_1";
    backpack = "B_AssaultPack_blk";
};
class resistanceTown1
{
    weapons[] = {
        "hgun_ACPC2_F"
    };
    magazines[] = {
        "9Rnd_45ACP_Mag",
        "9Rnd_45ACP_Mag",
        "9Rnd_45ACP_Mag"
    };
    items[] = {
        "FirstAidKit"
    };
    linkedItems[] = {
        "V_BandollierB_oli",
        "H_Shemag_olive",
        "optic_Aco",
        "ItemMap",
        "ItemCompass",
        "ItemWatch",
        "ItemRadio"
    };
    uniformClass = "U_OG_Guerilla1_1";
    backpack = "B_AssaultPack_rgr";
};
