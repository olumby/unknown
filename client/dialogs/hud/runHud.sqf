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

    _charlieFlag ctrlSetText (str flagPossession);
};
