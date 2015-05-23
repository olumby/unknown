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

    {
        _currentInterface = _flagInterface select _forEachIndex;
        _interface = _display displayCtrl _currentInterface;
        _interface ctrlSetText ((flagInformation select _forEachIndex) select 5);

        _holders = _x select 3;
        _contestors = _x select 4;

        if ( _contestors != _holders && _holders != civilian) then
        {
            // show some sort of contestor notification..
        };

        switch (_holders) do
        {
            case west:
            {
                _interface ctrlSetBackgroundColor [0,0.3,0.94,0.5];
                _interface ctrlSetTextColor [1,1,1,1];
            };
            case east:
            {
                _interface ctrlSetBackgroundColor [0.5,0,0,0.5];
                _interface ctrlSetTextColor [1,1,1,1];
            };
            case resistance:
            {
                _interface ctrlSetBackgroundColor [0,0.5,0,0.5];
                _interface ctrlSetTextColor [1,1,1,1];
            };
            default
            {
                _interface ctrlSetBackgroundColor [1,1,1,0.5];
                _interface ctrlSetTextColor [0,0,0,0.7];
            };
        };
    } forEach flagPossession;
};
