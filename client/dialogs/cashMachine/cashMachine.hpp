/*
 * The ATMs
 */

#include "cashMachine_defines.hpp"

class CashMachine
{
    idd = -1;
    movingEnable = true;
    enableSimulation = true;
    onLoad = "uiNamespace setVariable [""CashMachine"", _this select 0]";

    #define screenW (0.5 * 3/4)
    #define screenH 0.3
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
            text = "Welcome to SUATMM!";

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

        class inputBox: RscEdit
        {
            idc = input_box;
            style = ST_CENTER;
            sizeEx = 0.05;
            text = "0";

            #define inputBoxW (screenW - (edgeOffsetX * 2))
            #define inputBoxH 0.06
            #define inputBoxY (screenY + edgeOffsetY)
            #define inputBoxX (screenX + edgeOffsetX)

            x = inputBoxX;
            y = inputBoxY;
            w = inputBoxW;
            h = inputBoxH;
        };
        class messageArea: RscStructuredText
        {
            idc = message_area;
            style = ST_CENTER;
            colorBackground[] = {0, 0, 0, 0};
            size = 0.03;
            font = "PuristaSemibold";

            #define messageAreaW (screenW - (edgeOffsetX * 2))
            #define messageAreaH 0.06
            #define messageAreaY (screenY + inputBoxH + (edgeOffsetY * 3))
            #define messageAreaX (screenX + edgeOffsetX)

            x = messageAreaX;
            y = messageAreaY;
            w = messageAreaW;
            h = messageAreaH;
        };
        class withdrawButton: RscButton
        {
            idc = withdraw_button;
            text = "Widthdraw";
            style = ST_CENTER;
            onButtonClick = "['withdraw'] call performTransaction";

            #define withdrawButtonW (screenW - (edgeOffsetX * 2))
            #define withdrawButtonH buttonH
            #define withdrawButtonY (screenY + screenH) - withdrawButtonH - edgeOffsetY)
            #define withdrawButtonX (screenX + edgeOffsetX)

            x = withdrawButtonX;
            y = withdrawButtonY;
            w = withdrawButtonW;
            h = withdrawButtonH;
        };
        class depositButton: RscButton
        {
            idc = deposit_button;
            text = "Deposit";
            style = ST_CENTER;
            onButtonClick = "['deposit'] call performTransaction";

            #define depositButtonW (screenW - (edgeOffsetX * 2))
            #define depositButtonH buttonH
            #define depositButtonY (screenY + screenH) - withdrawButtonH - depositButtonH - (edgeOffsetY * 1.5))
            #define depositButtonX (screenX + edgeOffsetX)

            x = depositButtonX;
            y = depositButtonY;
            w = depositButtonW;
            h = depositButtonH;
        };
        class closeButton: RscButtonDark
        {
            idc = -1;
            text = "CLOSE";
            onButtonClick = "closeDialog 0;";

            #define closeButtonW scaleFix(0.20)
            #define closeButtonX ((screenX + screenW) - closeButtonW)

            x = closeButtonX;
            y = footerElementY;
            w = closeButtonW;
            h = buttonH;
        };

    };

};
