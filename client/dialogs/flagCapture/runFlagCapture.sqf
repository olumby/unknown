/*
 * Runs the flag capture interface.
 */

#include "flagCapture_defines.hpp"

waitUntil { !isNil "flagPossession" && !isNil "flagInformation" };

#define capture_time 30

sleep 1;
while {true} do
{
    if(player getVariable ["inFlagZone", false]) then
    {
        _flagIndex = player getVariable ["flagIndex", 0];

        _flag = flagInformation select _flagIndex;
        _flagPossession = flagPossession select _flagIndex;

        if ( (_flagPossession select 4) == (side player) ) then
        {
            1001 cutRsc ["FlagCapture", "PLAIN", 0, false];
            _display = uiNameSpace getVariable "FlagCapture";
            _flagProgress = _display displayCtrl flag_progress;
            _flagMessage = _display displayCtrl flag_message;

            _flagMessage ctrlSetText format ["Capturing %1", _flag select 4];
            _flagProgress progressSetPosition ((_flagPossession select 6) / capture_time);
            _progressColor = switch (side player) do
            {
                case west:
                {
                    [0,0.3,0.94,0.6]
                };
                case east:
                {
                    [0.5,0,0,0.6];
                };
                default
                {
                    [0,0.5,0,0.6];
                };
            };
            _flagProgress ctrlSetTextColor _progressColor;
        };
    };
    sleep 0.5;
};
