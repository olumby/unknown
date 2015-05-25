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
        // Flags
        #define hudFlagH 0.06
        #define hudFlagY ((safeZoneY + safeZoneH) - hudFlagH - (edgeOffsetY * 0.5))

        class hudFlag3: RscFlagBox
        {
            idc = flag_3;
            colorBackground[] = {1,1,1,0.5};
            colorText[] = {0,0,0,1};
            style = ST_CENTER;
            shadow = 0;
            text = "Flag";

            #define hudFlag3W 0.10
            #define hudFlag3H hudFlagH
            #define hudFlag3Y hudFlagY
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
            #define hudFlag2H hudFlagH
            #define hudFlag2Y hudFlagY
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
            #define hudFlag1H hudFlagH
            #define hudFlag1Y hudFlagY
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
            #define hudFlag0H hudFlagH
            #define hudFlag0Y hudFlagY
            #define hudFlag0X ((safeZoneX + safeZoneW) - hudFlag0W - hudFlag1W - hudFlag2W - hudFlag3W - (edgeOffsetX * 2))

            x = hudFlag0X;
            y = hudFlag0Y;
            w = hudFlag0W;
            h = hudFlag0H;
        };

        // Player info
        class healthBar: RscProgress
        {
            idc = health_bar;
            colorFrame[] = {0,0,0,0.3};
            colorBar[] = {0.73,0.12,0.02,0.8};

            #define healthBarW 0.2
            #define healthBarH 0.02
            #define healthBarX ((safeZoneX + safeZoneW) - healthBarW - (edgeOffsetX * 0.5))
            #define healthBarY (hudFlagY - healthBarH - edgeOffsetY)

            x = healthBarX;
            y = healthBarY;
            w = healthBarW;
            h = healthBarH;
        };
        class moneyDisplayBank: RscStructuredText
        {
            idc = money_display_bank;
            colorBackground[] = {0, 0, 0, 0};
            size = 0.03;
            font = "PuristaSemibold";

            #define moneyDisplayBankW 1
            #define moneyDisplayBankH 0.04
            #define moneyDisplayBankX ((safeZoneX + safeZoneW) - moneyDisplayBankW - (edgeOffsetX * 0.5))
            #define moneyDisplayBankY (hudFlagY - moneyDisplayBankH - healthBarH - (edgeOffsetY * 1.5))

            x = moneyDisplayBankX;
            y = moneyDisplayBankY;
            w = moneyDisplayBankW;
            h = moneyDisplayBankH;
        };
        class moneyDisplayHand: RscStructuredText
        {
            idc = money_display_hand;
            colorBackground[] = {0, 0, 0, 0};
            size = 0.03;
            font = "PuristaSemibold";

            #define moneyDisplayHandW 1
            #define moneyDisplayHandH 0.04
            #define moneyDisplayHandX ((safeZoneX + safeZoneW) - moneyDisplayHandW - (edgeOffsetX * 0.5))
            #define moneyDisplayHandY (hudFlagY - moneyDisplayHandH - moneyDisplayBankH - healthBarH - (edgeOffsetY * 1.5))

            x = moneyDisplayHandX;
            y = moneyDisplayHandY;
            w = moneyDisplayHandW;
            h = moneyDisplayHandH;
        };
    };
};
