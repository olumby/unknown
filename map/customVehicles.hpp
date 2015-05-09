/*
 * Custom vehicles used by missions and stores.
 */

class CfgVehicleTemplates
{

    class UK_Offroad_Police
    {
        displayName = "Offroad Police";
        author = "CmdSft";
        textures[] =
        {
            "a3\soft_f\offroad_01\data\offroad_01_ext_base02_co.paa"
        };
        animationList[] =
        {
            "HidePolice", 0,
            "BeaconStart", 1,
            "HideBumper2", 0,
            "HideConstruction", 0
        };
    };

    class UK_Offroad_Service
    {
        displayName = "Offroad Service";
        author = "CmdSft";
        textures[] =
        {
            "a3\soft_f_bootcamp\offroad_01\data\offroad_01_ext_repair_civ_co.paa"
        };
        animationList[] =
        {
            "HideServices", 0,
            "BeaconsServicesStart", 1,
            "HideBumper2", 0
        };
    };

};
