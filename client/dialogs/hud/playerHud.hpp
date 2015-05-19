/*
 * The players HUD. Flags, Health, etc..
 */

#include "playerHud_defines.hpp"

class PlayerHud
{
    idd = -1;
    fadein = 0;
    fadeout = 0;
    duration = 10;
    onLoad = "uiNamespace setVariable [""PlayerHud"", _this select 0]";

    class controls
    {
        class hudFlagCharlie: RscText
        {
            idc = flag_charlie;
            colorBackground[] = {1,1,1,0.5};

            #define hudFlagCharlieW 0.40
            #define hudFlagCharlieH 0.06
            #define hudFlagCharlieY ((safeZoneY + safeZoneH) - hudFlagCharlieH)
            #define hudFlagCharlieX ((safeZoneX + safeZoneW) - hudFlagCharlieW)

            x = hudFlagCharlieX;
            y = hudFlagCharlieY;
            w = hudFlagCharlieW;
            h = hudFlagCharlieH;
        };
    };
};
