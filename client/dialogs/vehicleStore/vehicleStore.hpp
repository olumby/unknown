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

            #define locationslistW ((screenW * 0.6) - (edgeOffsetX * 2))
            #define locationslistH (screenH - (edgeOffsetY * 2))
            #define locationslistY (screenY + edgeOffsetY)
            #define locationslistX (screenX + edgeOffsetX)

            x = locationslistX;
            y = locationslistY;
            w = locationslistW;
            h = locationslistH;
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
            #define vehicleVarX (screenX + locationslistW + (edgeOffsetX * 2))

            x = vehicleVarX;
            y = vehicleVarY;
            w = vehicleVarW;
            h = vehicleVarH;
        };
    };
};
