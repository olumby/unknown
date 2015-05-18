/*
 * A player should jump rather than vault.
 * Inspired by JumpMF by Das Attorney.
 */

if (hasInterface) then
{
    jumper = compile preprocessFileLineNumbers "external\Jump\jumper.sqf";

    waitUntil { !isNull findDisplay 46 };
    (findDisplay 46) displayAddEventHandler ["KeyDown", jumper];
};
