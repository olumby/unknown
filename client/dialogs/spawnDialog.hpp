/*
 * The main spawn screen
 */

#include "spawnDialog_defines.hpp"

class SpawnDialog
{
    idd = spawn_dialog;
    movingEnable = false;
    enableSimulation = true;
    onLoad = "uiNamespace setVariable [""UK_SpawnDialog"", _this select 0]";

    class Controls
    {
        class spawnScreen: RscFrame
        {
            idc = spawn_screen;
            text = "Spawn Selection";

            #define screenW (0.7 * 3/4)
            #define screenH 0.5
            #define screenX CENTER(1, screenW)
            #define screenY CENTER(1, screenH)

            w = screenW;
            h = screenH;
            x = screenX;
            y = screenY;
        };

        #define bottomButtonH (0.055)
        #define bottomButtonY ((screenY + screenH) - (bottomButtonH + edgeOffsetY))

        class spawnLocationsList: RscListBox
        {
            idc = spawn_locations_list;

            #define locationslistW (screenW - (edgeOffsetX * 2))
            #define locationslistH ((screenH - bottomButtonH) - (edgeOffsetY * 4))
            #define locationslistY (screenY + (edgeOffsetY * 2))
            #define locationslistX (screenX + edgeOffsetX)

            x = locationslistX;
            y = locationslistY;
            w = locationslistW;
            h = locationslistH;
        };
        class spawnLocationsButton: RscButton
        {
            idc = spawn_locations_button;
            text = "Spawn";

            #define spawnButtonW scaleFix(0.15)
            #define spawnButtonX (screenX + edgeOffsetX)

            x = spawnButtonX;
            y = bottomButtonY;
            w = spawnButtonW;
            h = bottomButtonH;
        };
        class randomSpawnButton: RscButton
        {
            idc = random_spawn_button;
            text = "Random";

            #define randomButtonW scaleFix(0.15)
            #define randomButtonX (screenX + (edgeOffsetX * 2) + spawnButtonW)

            x = randomButtonX;
            y = bottomButtonY;
            w = randomButtonW;
            h = bottomButtonH;
        };
        class abortButton: RscButton
        {
            idc = -1;
            text = "Abort";
            onButtonClick = "endMission 'LOSER'";

            #define abortButtonW scaleFix(0.15)
            #define abortButtonX ((screenX + screenW) - abortButtonW - edgeOffsetX)

            x = abortButtonX;
            y = bottomButtonY;
            w = abortButtonW;
            h = bottomButtonH;
        };
    };
};
