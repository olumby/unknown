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

    #define screenW (0.9 * 3/4)
    #define screenH 0.7
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
        #define bottomButtonH (0.055)
        #define bottomButtonY ((screenY + screenH) - (bottomButtonH + edgeOffsetY))

        class vehicleList: RscListNBox
        {
            idc = vehicle_list;
            columns[] = {0,0.105,0.5,0.8};
            drawSideArrows = false;
            idcLeft = -1;
            idcRight = -1;
            rowHeight = 0.050;

            #define locationslistW (screenW - (edgeOffsetX * 2))
            #define locationslistH ((screenH - bottomButtonH) - (edgeOffsetY * 4))
            #define locationslistY (screenY + (edgeOffsetY * 2))
            #define locationslistX (screenX + edgeOffsetX)

            x = locationslistX;
            y = locationslistY;
            w = locationslistW;
            h = locationslistH;
        };
        // class spawnLocationsButton: RscButton
        // {
        //     idc = spawn_locations_button;
        //     text = "Spawn";

        //     #define spawnButtonW scaleFix(0.15)
        //     #define spawnButtonX (screenX + edgeOffsetX)

        //     x = spawnButtonX;
        //     y = bottomButtonY;
        //     w = spawnButtonW;
        //     h = bottomButtonH;
        // };
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
