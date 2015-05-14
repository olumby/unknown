/*
 * The vehicle store
 */

#include "vehicleStore_defines.hpp"

class VehicleStore
{
    idd = vehicle_store;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "uiNamespace setVariable [""UK_VehicleStoreDialog"", _this select 0]";

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
            text = "Vehicle Store";

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

        class vehicleList: RscListNBox
        {
            idc = vehicle_list;
            columns[] = {0, 0, 0.12};
            drawSideArrows = false;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.035;
            onLBSelChanged = "_this call vehicleStoreSelection";

            #define vehicleListW ((screenW * 0.6) - (edgeOffsetX * 2))
            #define vehicleListH (screenH - (edgeOffsetY * 2))
            #define vehicleListY (screenY + edgeOffsetY)
            #define vehicleListX (screenX + edgeOffsetX)

            x = vehicleListX;
            y = vehicleListY;
            w = vehicleListW;
            h = vehicleListH;
        };
        class buyVehicleButton: RscButtonDark
        {
            idc = buy_vehicle_button;
            text = "BUY VEHICLE";

            #define buyButtonW scaleFix(0.21)
            #define buyButtonX ((screenX + screenW) - buyButtonW)


            x = buyButtonX;
            y = footerElementY;
            w = buyButtonW;
            h = footerElementH;
        };
        class closeButton: RscButtonDark
        {
            idc = close_button;
            text = "CLOSE";
            onButtonClick = "closeDialog 0;";

            #define closeButtonW scaleFix(0.20)
            #define closeButtonX ((screenX + screenW) - buyButtonW - edgeOffsetX - closeButtonW)


            x = closeButtonX;
            y = footerElementY;
            w = closeButtonW;
            h = footerElementH;
        };
        class vehicleFilter: RscCombo
        {
            idc = vehicle_list_filter;
            colorBackground[] = {0,0,0,0.7};
            onLBSelChanged = "_this call vehicleStoreFilter";

            #define vehicleFilterW 0.34
            #define vehicleFilterH 0.035
            #define vehicleFilterY footerElementY
            #define vehicleFilterX screenX

            x = vehicleFilterX;
            y = vehicleFilterY;
            w = vehicleFilterW;
            h = vehicleFilterH;
        };
        class vehicleVar: RscCombo
        {
            idc = var_selection;
            colorBackground[] = {0,0,0,0.7};
            onLBSelChanged = "_this call vehicleStoreVariation";

            #define vehicleVarW ((screenW * 0.4) - edgeOffsetX)
            #define vehicleVarH 0.035
            #define vehicleVarY (screenY + edgeOffsetY) 
            #define vehicleVarX (screenX + vehicleListW + (edgeOffsetX * 2))

            x = vehicleVarX;
            y = vehicleVarY;
            w = vehicleVarW;
            h = vehicleVarH;
        };
        class totalPriceTitle : RscTitle
        {
            colorBackground[] = {0, 0, 0, 0};
            idc = -1;
            text = "Total Price:";

            #define totalPriceTitleW (((screenW * 0.4) - edgeOffsetX) * 0.45)
            #define totalPriceTitleH 0.04
            #define totalPriceTitleY (screenY + screenH - edgeOffsetY - totalPriceTitleH)
            #define totalPriceTitleX (screenX + vehicleListW + (edgeOffsetX * 2))

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

            #define discountTitleW (((screenW * 0.4) - edgeOffsetX) * 0.45)
            #define discountTitleH 0.04
            #define discountTitleY (screenY + screenH - (edgeOffsetY * 1.5) - totalPriceTitleH - discountTitleH)
            #define discountTitleX (screenX + vehicleListW + (edgeOffsetX * 2))

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

            #define priceTitleW (((screenW * 0.4) - edgeOffsetX) * 0.45)
            #define priceTitleH 0.04
            #define priceTitleY (screenY + screenH - (edgeOffsetY * 2) - totalPriceTitleH - discountTitleH - priceTitleH)
            #define priceTitleX (screenX + vehicleListW + (edgeOffsetX * 2))

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
            text = "";

            #define totalPriceValueW (((screenW * 0.4) - (edgeOffsetX *2)) * 0.55)
            #define totalPriceValueH 0.04
            #define totalPriceValueY (screenY + screenH - edgeOffsetY - totalPriceValueH)
            #define totalPriceValueX (screenX + vehicleListW + (edgeOffsetX * 3) + totalPriceTitleW)

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
            text = "";

            #define discountValueW (((screenW * 0.4) - (edgeOffsetX *2)) * 0.55)
            #define discountValueH 0.04
            #define discountValueY (screenY + screenH - (edgeOffsetY * 1.5) - totalPriceValueH - discountValueH)
            #define discountValueX (screenX + vehicleListW + (edgeOffsetX * 3) + discountTitleW)

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
            text = "";

            #define priceValueW (((screenW * 0.4) - (edgeOffsetX *2)) * 0.55)
            #define priceValueH 0.04
            #define priceValueY (screenY + screenH - (edgeOffsetY * 2) - totalPriceValueH - discountValueH - priceValueH)
            #define priceValueX (screenX + vehicleListW + (edgeOffsetX * 3) + priceTitleW)

            x = priceValueX;
            y = priceValueY;
            w = priceValueW;
            h = priceValueH;
        };
    };
};
