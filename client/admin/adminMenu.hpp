/*
 * The main spawn screen
 */

//#include "adminDialog_defines.hpp"

class AdminDialog
{
    idd = -1;
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
    };


};
