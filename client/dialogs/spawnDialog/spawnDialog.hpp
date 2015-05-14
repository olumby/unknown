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

    #define screenW (1 * 3/4)
    #define screenH 0.5
    #define screenX CENTER(1, screenW)
    #define screenY CENTER(1, screenH)

    class controlsBackground
    {
        class mainBackground: RscText
        {
            idc = -1;
            colorBackground[] = {1,1,1,0.1};

            w = screenW;
            h = screenH;
            x = screenX;
            y = screenY;
        };
        class titleBackground : RscText
        {
            idc = -1;
            colorBackground[] = {1,1,1,0.1};

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
            text = "Spawn Selection";

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

        class spawnLocationsList: RscListBox
        {
            idc = spawn_locations_list;
            onLBSelChanged = "_this call spawnDialogSelection";

            #define locationslistW (screenW - (edgeOffsetX * 2))
            #define locationslistH (screenH - (edgeOffsetY * 2))
            #define locationslistY (screenY + edgeOffsetY)
            #define locationslistX (screenX + edgeOffsetX)

            x = locationslistX;
            y = locationslistY;
            w = locationslistW;
            h = locationslistH;
        };
        class spawnLocationsButton: RscButton
        {
            idc = spawn_locations_button;
            text = "SPAWN";

            #define spawnButtonW scaleFix(0.15)
            #define spawnButtonX screenX

            x = spawnButtonX;
            y = footerElementY;
            w = spawnButtonW;
            h = footerElementH;
        };
        class randomSpawnButton: RscButton
        {
            idc = random_spawn_button;
            text = "RANDOM";

            #define randomButtonW scaleFix(0.15)
            #define randomButtonX (spawnButtonX + spawnButtonW + edgeOffsetX)

            x = randomButtonX;
            y = footerElementY;
            w = randomButtonW;
            h = footerElementH;
        };
        class abortButton: RscButton
        {
            idc = -1;
            text = "ABORT";
            onButtonClick = "endMission 'LOSER'";

            #define abortButtonW scaleFix(0.15)
            #define abortButtonX ((screenX + screenW) - abortButtonW)

            x = abortButtonX;
            y = footerElementY;
            w = abortButtonW;
            h = footerElementH;
        };
    };
};
