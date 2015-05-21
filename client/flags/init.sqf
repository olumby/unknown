/*
 * Set up the game flags, client side.
 */

waitUntil { !isNil "flagInformation" };

if(!isNil "flagInformation" && hasInterface) then
{
    {
        _condition = "(vehicle player) in thisList";
        _activation = format ["player setVariable [""inFlagZone"", true]; player setVariable [""flagIndex"", %1]", _forEachIndex];
        _deactivation = "player setVariable [""inFlagZone"", false]";

        _flagTrigger = _x select 3;
        _flagTrigger setTriggerArea [(getMarkerSize (_x select 0)) select 0, (getMarkerSize (_x select 0)) select 1, 0, false];
        _flagTrigger setTriggerActivation ["ANY", "PRESENT", true];
        _flagTrigger setTriggerStatements [_condition, _activation, _deactivation];
    } foreach flagInformation;
};
