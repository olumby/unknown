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
        class hudFlag3: RscFlagBox
        {
            idc = flag_3;
            colorBackground[] = {1,1,1,0.5};
            colorText[] = {0,0,0,1};
            style = ST_CENTER;
            shadow = 0;
            text = "Flag";

            #define hudFlag3W 0.10
            #define hudFlag3H 0.06
            #define hudFlag3Y ((safeZoneY + safeZoneH) - hudFlag3H - (edgeOffsetY * 0.5))
            #define hudFlag3X ((safeZoneX + safeZoneW) - hudFlag3W - (edgeOffsetX * 0.5))

            x = hudFlag3X;
            y = hudFlag3Y;
            w = hudFlag3W;
            h = hudFlag3H;
        };
        class hudFlag2: RscFlagBox
        {
            idc = flag_2;
            colorBackground[] = {1,1,1,0.5};
            colorText[] = {0,0,0,1};
            style = ST_CENTER;
            shadow = 0;
            text = "Flag";

            #define hudFlag2W 0.10
            #define hudFlag2H 0.06
            #define hudFlag2Y ((safeZoneY + safeZoneH) - hudFlag2H - (edgeOffsetY * 0.5))
            #define hudFlag2X ((safeZoneX + safeZoneW) - hudFlag2W - hudFlag3W - edgeOffsetX)

            x = hudFlag2X;
            y = hudFlag2Y;
            w = hudFlag2W;
            h = hudFlag2H;
        };
        class hudFlag1: RscFlagBox
        {
            idc = flag_1;
            colorBackground[] = {1,1,1,0.5};
            colorText[] = {0,0,0,1};
            style = ST_CENTER;
            shadow = 0;
            text = "Flag";

            #define hudFlag1W 0.10
            #define hudFlag1H 0.06
            #define hudFlag1Y ((safeZoneY + safeZoneH) - hudFlag1H - (edgeOffsetY * 0.5))
            #define hudFlag1X ((safeZoneX + safeZoneW) - hudFlag1W - hudFlag2W - hudFlag3W - (edgeOffsetX * 1.5))

            x = hudFlag1X;
            y = hudFlag1Y;
            w = hudFlag1W;
            h = hudFlag1H;
        };
        class hudFlag0: RscFlagBox
        {
            idc = flag_0;
            colorBackground[] = {1,1,1,0.5};
            colorText[] = {0,0,0,1};
            style = ST_CENTER;
            shadow = 0;
            text = "Flag";

            #define hudFlag0W 0.10
            #define hudFlag0H 0.06
            #define hudFlag0Y ((safeZoneY + safeZoneH) - hudFlag0H - (edgeOffsetY * 0.5))
            #define hudFlag0X ((safeZoneX + safeZoneW) - hudFlag0W - hudFlag1W - hudFlag2W - hudFlag3W - (edgeOffsetX * 2))

            x = hudFlag0X;
            y = hudFlag0Y;
            w = hudFlag0W;
            h = hudFlag0H;
        };
    };
};
