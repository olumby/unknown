/*
 * Gear a player up with the default starting gear.
 */

_uniform = "";

switch (playerSide) do {
    case west: {
        _uniform = "U_B_CombatUniform_mcam";
    };
    case east: {
        _uniform = "U_O_CombatUniform_ocamo";
    };
    case independent: {
        _uniform = "U_I_CombatUniform";
    };
};

player addUniform _uniform;
player addVest "V_Rangemaster_Belt";

player addMagazine "9Rnd_45ACP_Mag";
player addWeapon "hgun_ACPC2_F";
player addMagazine "9Rnd_45ACP_Mag";
player addMagazine "9Rnd_45ACP_Mag";
player addMagazine "9Rnd_45ACP_Mag";
