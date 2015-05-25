/*
 * The admin menu
 */

#include "adminMenu_defines.hpp"

class AdminDialog
{
    idd = admin_menu;
    movingEnable = true;
    enableSimulation = true;
    onLoad = "uiNamespace setVariable [""UK_AdminDialog"", _this select 0]";

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
            text = "Admin Menu";

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

        class godButton: RscButtonDark
        {
            idc = god_button;
            text = "Enable Player God";
            style = ST_RIGHT;
            onButtonClick = "[] execVM 'client\admin\toggleGodMode.sqf'";

            #define godButtonW scaleFix(0.3)
            #define godButtonH footerElementH
            #define godButtonY (screenY + edgeOffsetY)
            #define godButtonX ((screenX + screenW) - (godButtonW + edgeOffsetX))

            x = godButtonX;
            y = godButtonY;
            w = godButtonW;
            h = godButtonH;
        };
        class vehGodButton: RscButtonDark
        {
            idc = veh_god_button;
            text = "Enable Vehicle God";
            style = ST_RIGHT;
            onButtonClick = "[] execVM 'client\admin\toggleVehGodMode.sqf'";

            #define vehGodButtonW scaleFix(0.3)
            #define vehGodButtonH footerElementH
            #define vehGodButtonY (godButtonY + godButtonH + (edgeOffsetY / 2))
            #define vehGodButtonX ((screenX + screenW) - (vehGodButtonW + edgeOffsetX))

            x = vehGodButtonX;
            y = vehGodButtonY;
            w = vehGodButtonW;
            h = vehGodButtonH;
        };
        class mapTeleportButton: RscButtonDark
        {
            idc = map_teleport;
            text = "Map Teleport";
            style = ST_RIGHT;
            onButtonClick = "[] execVM 'client\admin\performMapTeleport.sqf'";

            #define mapTeleportButtonW scaleFix(0.3)
            #define mapTeleportButtonH footerElementH
            #define mapTeleportButtonY (vehGodButtonY + vehGodButtonH + (edgeOffsetY / 2))
            #define mapTeleportButtonX ((screenX + screenW) - (mapTeleportButtonW + edgeOffsetX))

            x = mapTeleportButtonX;
            y = mapTeleportButtonY;
            w = mapTeleportButtonW;
            h = mapTeleportButtonH;
        };

    };

};
