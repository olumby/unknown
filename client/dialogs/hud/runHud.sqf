/*
 * Start up and loop the player HUD.
 */

#include "playerHud_defines.hpp"

waitUntil { !isNil "flagPossession" && !isNil "flagInformation" };

while {true} do
{
    sleep 1;

    1000 cutRsc ["PlayerHud", "PLAIN", 0, false];
    _display = uiNameSpace getVariable "PlayerHud";

    _flagInterface = [flag_0, flag_1, flag_2, flag_3];

    // hide unused flag boxes
    if( (count _flagInterface) > (count flagPossession) ) then
    {
        _diff = (count _flagInterface) - (count flagPossession);
        for [{_i = 0}, {_i < _diff}, {_i=_i+1}] do
        {
            (_display displayCtrl (_flagInterface select _i)) ctrlShow false;
            _flagInterface = _flagInterface - [(_flagInterface select _i)];
        };
    };

    reverse flagPossession;
    {
        _currentInterface = _flagInterface select _forEachIndex;
        _interface = _display displayCtrl _currentInterface;

        _blue = _x select 0;
        _red = _x select 1;
        _green = _x select 2;

        if ( _blue > _green && _blue > _red ) then
        {
            _interface ctrlSetBackgroundColor [0.24,0.27,0.94,0.5];
            _interface ctrlSetTextColor [1,1,1,1];
        };
        if ( _red > _green && _red > _blue ) then
        {
            _interface ctrlSetBackgroundColor [0.94,0.24,0.24,0.5];
            _interface ctrlSetTextColor [1,1,1,1];
        };
        if ( _green > _red && _green > _blue ) then
        {
            _interface ctrlSetBackgroundColor [0,0.47,0.08,0.5];
            _interface ctrlSetTextColor [1,1,1,1];
        };
        if ( _blue == 0 && _red == 0 && _green == 0 ) then
        {
            _interface ctrlSetBackgroundColor [1,1,1,0.5];
            _interface ctrlSetTextColor [0,0,0,0.7];
        };
        _interface ctrlSetText ((flagInformation select _forEachIndex) select 4);
    } forEach flagPossession;
};
