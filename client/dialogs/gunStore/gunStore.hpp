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

    #define screenW (1.1 * 3/4)
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

        class gunList: RscListNBox
        {
            idc = gun_list;
            columns[] = {0, 0, 0.12};
            drawSideArrows = false;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.035;

            #define gunListW ((screenW * 0.6) - (edgeOffsetX * 2))
            #define gunListH (screenH - (edgeOffsetY * 2))
            #define gunListY (screenY + edgeOffsetY)
            #define gunListX (screenX + edgeOffsetX)

            x = gunListX;
            y = gunListY;
            w = gunListW;
            h = gunListH;
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
            onLBSelChanged = "_this call vehicleStoreFilter";

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
