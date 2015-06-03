/*
 * Runs the flag capture interface.
 */

#include "flagCapture_defines.hpp"
disableSerialization;

waitUntil { !isNil "flagPossession" && !isNil "flagInformation" };

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

            _flagMessage ctrlSetText format ["Capturing %1", _flag select 5];
            _flagProgress progressSetPosition ((_flagPossession select 6) / (call flagCaptureTime));

            _progressColor = [playerSide, 0.6] call fnc_colorForSide;
            _flagProgress ctrlSetTextColor _progressColor;
        };
    };
    sleep 0.5;
};
