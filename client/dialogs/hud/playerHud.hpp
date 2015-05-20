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
            style = ST_CENTER;
            shadow = 0;
            text = "C";

            #define hudFlagCharlieW 0.10
            #define hudFlagCharlieH 0.06
            #define hudFlagCharlieY ((safeZoneY + safeZoneH) - hudFlagCharlieH - (edgeOffsetY * 0.5))
            #define hudFlagCharlieX ((safeZoneX + safeZoneW) - hudFlagCharlieW - (edgeOffsetX * 0.5))

            x = hudFlagCharlieX;
            y = hudFlagCharlieY;
            w = hudFlagCharlieW;
            h = hudFlagCharlieH;
        };
        class hudFlagBravo: RscText
        {
            idc = flag_bravo;
            colorBackground[] = {1,1,1,0.5};
            style = ST_CENTER;
            shadow = 0;
            text = "B";

            #define hudFlagBravoW 0.10
            #define hudFlagBravoH 0.06
            #define hudFlagBravoY ((safeZoneY + safeZoneH) - hudFlagBravoH - (edgeOffsetY * 0.5))
            #define hudFlagBravoX ((safeZoneX + safeZoneW) - hudFlagBravoW - hudFlagCharlieW - edgeOffsetX)

            x = hudFlagBravoX;
            y = hudFlagBravoY;
            w = hudFlagBravoW;
            h = hudFlagBravoH;
        };
        class hudFlagAlpha: RscText
        {
            idc = flag_alpha;
            colorBackground[] = {1,1,1,0.5};
            style = ST_CENTER;
            shadow = 0;
            text = "A";

            #define hudFlagAlphaW 0.10
            #define hudFlagAlphaH 0.06
            #define hudFlagAlphaY ((safeZoneY + safeZoneH) - hudFlagAlphaH - (edgeOffsetY * 0.5))
            #define hudFlagAlphaX ((safeZoneX + safeZoneW) - hudFlagAlphaW - hudFlagCharlieW - hudFlagBravoW - (edgeOffsetX * 1.5))

            x = hudFlagAlphaX;
            y = hudFlagAlphaY;
            w = hudFlagAlphaW;
            h = hudFlagAlphaH;
        };
    };
};
