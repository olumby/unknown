/*
 * Gear a player up with the default starting gear.
 */

_uniforms = [];
_hats = [];

switch (playerSide) do {
    case west: {
        _uniforms = ["U_B_CombatUniform_mcam", "U_B_CombatUniform_mcam_vest", "U_B_CombatUniform_mcam"];
        _hats = ["H_Booniehat_tan", "H_MilCap_gry", "H_Shemag_tan"];
    };
    case east: {
        _uniforms = ["U_O_CombatUniform_ocamo", "U_O_SpecopsUniform_ocamo"];
        _hats = ["H_Booniehat_tan", "H_MilCap_ocamo", "H_Shemag_tan"];
    };
    case independent: {
        _uniforms = ["U_I_CombatUniform", "U_I_CombatUniform_tshirt", "U_I_CombatUniform_shortsleeve"];
        _hats = ["H_Booniehat_tan", "H_MilCap_dgtl", "H_Shemag_tan"];
    };
};

player addUniform (_uniforms select (floor (random (count _uniforms))));
player addHeadgear (_hats select (floor (random (count _hats))));
player addVest "V_Rangemaster_Belt";

player addMagazine "9Rnd_45ACP_Mag";
player addWeapon "hgun_ACPC2_F";
player addMagazine "9Rnd_45ACP_Mag";
player addMagazine "9Rnd_45ACP_Mag";
player addMagazine "9Rnd_45ACP_Mag";
