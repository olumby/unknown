/*
 * The flag capture interface.
 */

#include "flagCapture_defines.hpp"

class FlagCapture
{
    idd = -1;
    fadein = 0;
    fadeout = 0;
    duration = 1;
    onLoad = "uiNamespace setVariable [""FlagCapture"", _this select 0]";

    class controls
    {
        class captureProgress: RscProgress
        {
            idc = flag_progress;

            #define captureProgressW 0.25
            #define captureProgressH 0.02
            #define captureProgressX (CENTER(1, captureProgressW))
            #define captureProgressY (safeZoneY + safeZoneH) - ((safeZoneY + 1) / 2)

            x = captureProgressX;
            y = captureProgressY;
            w = captureProgressW;
            h = captureProgressH;
        };
        class captureMessage: RscTitle
        {
            idc = flag_message;
            colorBackground[] = {0, 0, 0, 0};
            style = ST_CENTER;
            text = "";

            #define captureMessageW 1
            #define captureMessageH 0.04
            #define captureMessageX (CENTER(1, captureMessageW))
            #define captureMessageY (captureProgressY + (edgeOffsetY * 1.5))

            x = captureMessageX;
            y = captureMessageY;
            w = captureMessageW;
            h = captureMessageH;
        };
    };
};
