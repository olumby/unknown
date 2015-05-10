/*
 * Add admins to the game.
 */

serverAdmins = [];

if (loadFile ("\override\admins.sqf") != "") then
{
    call compile preprocessFileLineNumbers "\override\admins.sqf";
};

serverAdmins = compileFinal str serverAdmins;

publicVariable "serverAdmins";
