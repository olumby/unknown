/*
 * The vehicle store
 */

#include "gunStore_defines.hpp"

class GunStore
{
    idd = vehicle_store;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "uiNamespace setVariable [""UK_GunStoreDialog"", _this select 0]";

    #define screenW (1.3 * 3/4)
    #define screenH 0.5
    #define screenX CENTER(1, screenW)
    #define screenY CENTER(1, screenH)

    class controlsBackground
    {
        class mainBackground: RscText
        {
            idc = -1;
            colorBackground[] = {0,0,0,0.75};

            w = screenW;
            h = screenH;
            x = screenX;
            y = screenY;
        };
        class titleBackground : RscText
        {
            idc = -1;
            colorBackground[] = {0,0,0,0.75};

            #define titleBackgroundW screenW
            #define titleBackgroundH 0.04
            #define titleBackgroundY (screenY - (edgeOffsetY / 2) - titleBackgroundH)
            #define titleBackgroundX screenX

            x = titleBackgroundX;
            y = titleBackgroundY;
            w = titleBackgroundW;
            h = titleBackgroundH;

        };
        class titleBorder : RscText
        {
            idc = -1;
            colorBackground[] = {0.96,0.25,0.13,0.75};

            #define titleBorderW titleBackgroundW
            #define titleBorderH (edgeOffsetX / 4)
            #define titleBorderY (titleBackgroundY + titleBackgroundH)
            #define titleBorderX screenX

            x = titleBorderX;
            y = titleBorderY;
            w = titleBorderW;
            h = titleBorderH;

        };
        class Title : RscTitle
        {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Gun Store";

            #define titleW (titleBackgroundW - edgeOffsetX)
            #define titleH 0.04
            #define titleY titleBackgroundY
            #define titleX (titleBackgroundX + (edgeOffsetX / 2))

            x = titleX;
            y = titleY;
            w = titleW;
            h = titleH;
        };
    };

    class Controls
    {
        #define footerElementH 0.039
        #define footerElementY (screenY + screenH + (edgeOffsetY / 2))

        class leftButton: RscButtonDark
        {
            idc = 12345667;
            colorText[] = {0.96,0.25,0.13,0.75};
            text = "-";
        };
        class rightButton: RscButtonDark
        {
            idc = 123456678;
            colorText[] = {0.96,0.25,0.13,0.75};
            text = "+";
        };

        #define allListW (((screenW - edgeOffsetX) / 2) - edgeOffsetX)
        #define allListH ((screenH / 2) - (edgeOffsetY * 2))

        class mainList: RscListNBox
        {
            idc = main_list;
            columns[] = {0.05, 0.17};
            drawSideArrows = true;
            idcLeft = 12345667;
            idcRight = 123456678;
            rowHeight = 0.035;
            onLBSelChanged = "_this call gunStoreSelection";

            #define mainListW allListW
            #define mainListH allListH
            #define mainListY (screenY + edgeOffsetY)
            #define mainListX (screenX + edgeOffsetX)

            x = mainListX;
            y = mainListY;
            w = mainListW;
            h = mainListH;
        };
        class accList: RscListNBox
        {
            idc = acc_list;
            columns[] = {0.05, 0.11};
            drawSideArrows = true;
            idcLeft = 12345667;
            idcRight = 123456678;
            rowHeight = 0.035;

            #define accListW allListW
            #define accListH allListH
            #define accListY (screenY + (edgeOffsetY * 2) + mainListH)
            #define accListX (screenX + edgeOffsetX)

            x = accListX;
            y = accListY;
            w = accListW;
            h = accListH;
        };
        class magList: RscListNBox
        {
            idc = mag_list;
            columns[] = {0.05, 0.1};
            drawSideArrows = true;
            idcLeft = 12345667;
            idcRight = 123456678;
            rowHeight = 0.035;

            #define magListW allListW
            #define magListH allListH
            #define magListY (screenY + edgeOffsetY)
            #define magListX (screenX + (edgeOffsetX * 2) + mainListW)

            x = magListX;
            y = magListY;
            w = magListW;
            h = magListH;
        };
        class buyButton: RscButtonDark
        {
            idc = buy_button;
            text = "BUY GEAR";

            #define buyButtonW scaleFix(0.21)
            #define buyButtonX ((screenX + screenW) - buyButtonW)

            x = buyButtonX;
            y = footerElementY;
            w = buyButtonW;
            h = footerElementH;
        };
        class weaponFilter: RscCombo
        {
            idc = weapon_filter;
            colorBackground[] = {0,0,0,0.7};
            onLBSelChanged = "_this call gunStoreFilter";

            #define weaponFilterW 0.34
            #define weaponFilterH 0.035
            #define weaponFilterY footerElementY
            #define weaponFilterX screenX

            x = weaponFilterX;
            y = weaponFilterY;
            w = weaponFilterW;
            h = weaponFilterH;
        };
        class closeButton: RscButtonDark
        {
            idc = -1;
            text = "CLOSE";
            onButtonClick = "closeDialog 0;";

            #define closeButtonW scaleFix(0.20)
            #define closeButtonX ((screenX + screenW) - buyButtonW - edgeOffsetX - closeButtonW)


            x = closeButtonX;
            y = footerElementY;
            w = closeButtonW;
            h = footerElementH;
        };
    };
};
