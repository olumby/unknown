/*
 * The ATMs
 */

#include "respawnMenu_defines.hpp"

class CmdRespawnMenu
{
    idd = -1;
    movingEnable = false;
    enableSimulation = false;
    onLoad = "uiNamespace setVariable [""CmdRespawnMenu"", _this select 0]";

    #define screenW 1
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
            text = "Respawn";

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
        #define buttonH 0.04
        #define footerElementY (screenY + screenH + (edgeOffsetY / 2))

        class mapDisplay: RscMapControl
        {
            idc = -1;

            #define mapDisplayW (screenW * 0.6) - (edgeOffsetX * 0.75)
            #define mapDisplayH (screenH - edgeOffsetY)
            #define mapDisplayX (screenX + (screenW * 0.4) + (edgeOffsetX * 0.25))
            #define mapDisplayY (screenY + (edgeOffsetY * 0.5))

            x = mapDisplayX;
            y = mapDisplayY;
            w = mapDisplayW;
            h = mapDisplayH;
        };
        class closeButton: RscButton
        {
            idc = -1;
            text = "RESPAWN";
            onButtonClick = "closeDialog 0;";

            #define closeButtonW scaleFix(0.30)
            #define closeButtonH buttonH
            #define closeButtonX ((screenX + screenW) - closeButtonW)
            #define closeButtonY footerElementY

            x = closeButtonX;
            y = closeButtonY;
            w = closeButtonW;
            h = closeButtonH;
        };
        class suspendButton: RscButton
        {
            idc = -1;
            text = "SUSPEND";
            onButtonClick = "endMission 'LOSER'";

            #define suspendButtonW scaleFix(0.20)
            #define suspendButtonH buttonH
            #define suspendButtonX screenX
            #define suspendButtonY footerElementY

            x = suspendButtonX;
            y = suspendButtonY;
            w = suspendButtonW;
            h = suspendButtonH;
        };

    };

};
