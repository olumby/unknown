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
    };

    class Controls
    {
        #define normalButtonH 0.039216
        #define normalButtonY (screenY + screenH + edgeOffsetY)

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
            y = normalButtonY;
            w = buyButtonW;
            h = normalButtonH;
        };
        class vehicleFilter: RscCombo
        {
            idc = vehicle_list_filter;
            colorBackground[] = {0,0,0,0.7};
            onLBSelChanged = "_this call vehicleStoreFilter";

            #define vehicleFilterW 0.34
            #define vehicleFilterH 0.035
            #define vehicleFilterY (screenY + screenH + edgeOffsetY) 
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
