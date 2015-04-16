class spawnDialogue
{
    idd = -1;
    movingenable = true;

    class Controls
    {
        class spawnScreen: RscFrame
        {
            idc = 1800;
            text = "Spawn"; //--- ToDo: Localize;
            x = 0.299479 * safezoneW + safezoneX;
            y = 0.313 * safezoneH + safezoneY;
            w = 0.4 * safezoneW;
            h = 0.2 * safezoneH;
        };
        class spawnButtonOne: RscButton
        {
            idc = 1600;
            text = "One"; //--- ToDo: Localize;
            x = 0.3625 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0458333 * safezoneW;
            h = 0.03 * safezoneH;
        };
        class spawnButtonTwo: RscButton
        {
            idc = 1601;
            text = "Two"; //--- ToDo: Localize;
            x = 0.477083 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0458333 * safezoneW;
            h = 0.03 * safezoneH;
        };
        class spawnButtonThree: RscButton
        {
            idc = 1602;
            text = "Three"; //--- ToDo: Localize;
            x = 0.591667 * safezoneW + safezoneX;
            y = 0.401 * safezoneH + safezoneY;
            w = 0.0458333 * safezoneW;
            h = 0.03 * safezoneH;
        };
    };
};
