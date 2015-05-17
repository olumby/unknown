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

    #define screenW (1.4 * 3/4)
    #define screenH 0.6
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

        class mainUpButton: RscButtonDark
        {
            idc = main_up;
            text = "+";
            onButtonClick = "[""main"", 1] call gunStoreChangeQty";
        };
        class mainDownButton: RscButtonDark
        {
            idc = main_down;
            text = "-";
            onButtonClick = "[""main"", -1] call gunStoreChangeQty";
        };
        class accUpButton: RscButtonDark
        {
            idc = acc_up;
            text = "+";
            onButtonClick = "[""acc"", 1] call gunStoreChangeQty";
        };
        class accDownButton: RscButtonDark
        {
            idc = acc_down;
            text = "-";
            onButtonClick = "[""acc"", -1] call gunStoreChangeQty";
        };
        class magUpButton: RscButtonDark
        {
            idc = mag_up;
            text = "+";
            onButtonClick = "[""mag"", 1] call gunStoreChangeQty";
        };
        class magDownButton: RscButtonDark
        {
            idc = mag_down;
            text = "-";
            onButtonClick = "[""mag"", -1] call gunStoreChangeQty";
        };

        #define allListW (((screenW - edgeOffsetX) / 2) - edgeOffsetX)
        #define allListH ((screenH / 2) - (edgeOffsetY * 2))

        class mainList: RscListNBox
        {
            idc = main_list;
            columns[] = {0.05, 0.16, 0.80};
            drawSideArrows = true;
            idcLeft = main_down;
            idcRight = main_up;
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
            columns[] = {0.05, 0.11, 0.80};
            drawSideArrows = true;
            idcLeft = acc_down;
            idcRight = acc_up;
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
            columns[] = {0.05, 0.1, 0.80};
            drawSideArrows = true;
            idcLeft = mag_down;
            idcRight = mag_up;
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
        class totalPriceTitle : RscTitle
        {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Total Price:";

            #define totalPriceTitleW (allListW * 0.40)
            #define totalPriceTitleH 0.04
            #define totalPriceTitleY (screenY + screenH - edgeOffsetY - totalPriceTitleH)
            #define totalPriceTitleX (screenX + (allListW * 1.3) + (edgeOffsetX * 2))

            x = totalPriceTitleX;
            y = totalPriceTitleY;
            w = totalPriceTitleW;
            h = totalPriceTitleH;
        };
        class discountTitle : RscTitle
        {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Discount:";

            #define discountTitleW (allListW * 0.40)
            #define discountTitleH 0.04
            #define discountTitleY (screenY + screenH - (edgeOffsetY * 1.5) - totalPriceTitleH - discountTitleH)
            #define discountTitleX (screenX + (allListW * 1.3) + (edgeOffsetX * 2))

            x = discountTitleX;
            y = discountTitleY;
            w = discountTitleW;
            h = discountTitleH;
        };
        class priceTitle : RscTitle
        {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Price:";

            #define priceTitleW (allListW * 0.40)
            #define priceTitleH 0.04
            #define priceTitleY (screenY + screenH - (edgeOffsetY * 2) - totalPriceTitleH - discountTitleH - priceTitleH)
            #define priceTitleX (screenX + (allListW * 1.3) + (edgeOffsetX * 2))

            x = priceTitleX;
            y = priceTitleY;
            w = priceTitleW;
            h = priceTitleH;
        };

        // Actual Prices
        class totalPriceValue : RscTitle
        {
            colorBackground[] = {0, 0, 0, 0};
            idc = total_price_value;
            style = ST_RIGHT;
            text = "0";

            #define totalPriceValueW (allListW * 0.30)
            #define totalPriceValueH 0.04
            #define totalPriceValueY (screenY + screenH - edgeOffsetY - totalPriceValueH)
            #define totalPriceValueX ((screenX + screenW) - (totalPriceValueW + edgeOffsetX))

            x = totalPriceValueX;
            y = totalPriceValueY;
            w = totalPriceValueW;
            h = totalPriceValueH;
        };
        class discountValue : RscTitle
        {
            colorBackground[] = {0, 0, 0, 0};
            colorText[] = {0.96,0.25,0.13,0.75};
            style = ST_RIGHT;
            idc = discount_value;
            text = "0";

            #define discountValueW (allListW * 0.30)
            #define discountValueH 0.04
            #define discountValueY (screenY + screenH - (edgeOffsetY * 1.5) - totalPriceValueH - discountValueH)
            #define discountValueX ((screenX + screenW) - (discountValueW + edgeOffsetX))

            x = discountValueX;
            y = discountValueY;
            w = discountValueW;
            h = discountValueH;
        };
        class priceValue : RscTitle
        {
            colorBackground[] = {0, 0, 0, 0};
            style = ST_RIGHT;
            idc = price_value;
            text = "0";

            #define priceValueW (allListW * 0.30)
            #define priceValueH 0.04
            #define priceValueY (screenY + screenH - (edgeOffsetY * 2) - totalPriceValueH - discountValueH - priceValueH)
            #define priceValueX ((screenX + screenW) - (priceValueW + edgeOffsetX))

            x = priceValueX;
            y = priceValueY;
            w = priceValueW;
            h = priceValueH;
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
