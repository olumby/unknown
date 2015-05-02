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
    };

    class Controls
    {
        #define normalButtonH (0.050)
        #define normalButtonY (screenY + screenH + edgeOffsetY)

        class vehicleList: RscListNBox
        {
            idc = vehicle_list;
            columns[] = {0, 0.13, 0.29};
            drawSideArrows = false;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.035;

            #define locationslistW ((screenW * 0.65) - (edgeOffsetY * 2))
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
            text = "Buy Vehicle";

            #define buyButtonW scaleFix(0.21)
            #define buyButtonX ((screenX + screenW) - buyButtonW)


            x = buyButtonX;
            y = normalButtonY;
            w = buyButtonW;
            h = normalButtonH;
        };
        // class randomSpawnButton: RscButton
        // {
        //     idc = random_spawn_button;
        //     text = "Random";

        //     #define randomButtonW scaleFix(0.15)
        //     #define randomButtonX (screenX + (edgeOffsetX * 2) + spawnButtonW)

        //     x = randomButtonX;
        //     y = bottomButtonY;
        //     w = randomButtonW;
        //     h = bottomButtonH;
        // };
        // class abortButton: RscButton
        // {
        //     idc = -1;
        //     text = "Abort";
        //     onButtonClick = "endMission 'LOSER'";

        //     #define abortButtonW scaleFix(0.15)
        //     #define abortButtonX ((screenX + screenW) - abortButtonW - edgeOffsetX)

        //     x = abortButtonX;
        //     y = bottomButtonY;
        //     w = abortButtonW;
        //     h = bottomButtonH;
        // };
    };
};
