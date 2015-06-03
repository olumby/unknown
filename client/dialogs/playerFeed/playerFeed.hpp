/*
 * The player feed, shows financial transactions.
 */

#include "playerFeed_defines.hpp"

class PlayerFeed
{
    idd = -1;
    fadein = 0;
    fadeout = 2;
    duration = 10;
    onLoad = "uiNamespace setVariable [""PlayerFeed"", _this select 0]";

    class controls
    {
        class playerFeedBox: RscStructuredText
        {
            idc = player_feed;
            colorBackground[] = {0, 0, 0, 0};
            size = 0.03;
            font = "PuristaMedium";
            shadow = 1;
            text = "";

            #define playerFeedBoxW 0.3
            #define playerFeedBoxH 0.15
            #define playerFeedBoxY ((safeZoneY + safeZoneH) - playerFeedBoxH - (edgeOffsetY * 0.5))
            #define playerFeedBoxX ((safeZoneX + safeZoneW) - 0.2 - playerFeedBoxW - (edgeOffsetX * 1.5))

            x = playerFeedBoxX;
            y = playerFeedBoxY;
            w = playerFeedBoxW;
            h = playerFeedBoxH;
        };
    };
};
