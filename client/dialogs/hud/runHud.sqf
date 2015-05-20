/*
 * Start up and loop the player HUD.
 */

#include "playerHud_defines.hpp"

waitUntil { !isNil "flagPossession" };

while {true} do
{
    sleep 1;

    1000 cutRsc ["PlayerHud", "PLAIN", 0, false];
    _display = uiNameSpace getVariable "PlayerHud";

    _charlieFlag = _display displayCtrl flag_charlie;
    _bravoFlag = _display displayCtrl flag_bravo;
    _alphaFlag = _display displayCtrl flag_alpha;

    // Charlie
    _charlieArr = (flagPossession select 2);
    _charlieBlue = (_charlieArr select 0);
    _charlieRed = (_charlieArr select 1);
    _charlieGreen = (_charlieArr select 2);

    if ( _charlieBlue > _charlieGreen && _charlieBlue > _charlieRed ) then
    {
        _charlieFlag ctrlSetBackgroundColor [0.24,0.27,0.94,0.5];
    };
    if ( _charlieRed > _charlieGreen && _charlieRed > _charlieBlue ) then
    {
        _charlieFlag ctrlSetBackgroundColor [0.94,0.24,0.24,0.5];
    };
    if ( _charlieGreen > _charlieRed && _charlieGreen > _charlieBlue ) then
    {
        _charlieFlag ctrlSetBackgroundColor [0,0.47,0.08,0.5];
    };
    if ( _charlieBlue == 0 && _charlieRed == 0 && _charlieGreen == 0 ) then
    {
        _charlieFlag ctrlSetBackgroundColor [1,1,1,0.5];
    };

    // Bravo
    _bravoArr = (flagPossession select 1);
    _bravoBlue = (_bravoArr select 0);
    _bravoRed = (_bravoArr select 1);
    _bravoGreen = (_bravoArr select 2);

    if ( _bravoBlue > _bravoGreen && _bravoBlue > _bravoRed ) then
    {
        _bravoFlag ctrlSetBackgroundColor [0.24,0.27,0.94,0.5];
    };
    if ( _bravoRed > _bravoGreen && _bravoRed > _bravoBlue ) then
    {
        _bravoFlag ctrlSetBackgroundColor [0.94,0.24,0.24,0.5];
    };
    if ( _bravoGreen > _bravoRed && _bravoGreen > _bravoBlue ) then
    {
        _bravoFlag ctrlSetBackgroundColor [0,0.47,0.08,0.5];
    };
    if ( _bravoBlue == 0 && _bravoRed == 0 && _bravoGreen == 0 ) then
    {
        _bravoFlag ctrlSetBackgroundColor [1,1,1,0.5];
    };

    // Alpha
    _alphaArr = (flagPossession select 0);
    _alphaBlue = (_alphaArr select 0);
    _alphaRed = (_alphaArr select 1);
    _alphaGreen = (_alphaArr select 2);

    if ( _alphaBlue > _alphaGreen && _alphaBlue > _alphaRed ) then
    {
        _alphaFlag ctrlSetBackgroundColor [0.24,0.27,0.94,0.5];
    };
    if ( _alphaRed > _alphaGreen && _alphaRed > _alphaBlue ) then
    {
        _alphaFlag ctrlSetBackgroundColor [0.94,0.24,0.24,0.5];
    };
    if ( _alphaGreen > _alphaRed && _alphaGreen > _alphaBlue ) then
    {
        _alphaFlag ctrlSetBackgroundColor [0,0.47,0.08,0.5];
    };
    if ( _alphaBlue == 0 && _alphaRed == 0 && _alphaGreen == 0 ) then
    {
        _alphaFlag ctrlSetBackgroundColor [1,1,1,0.5];
    };
};
