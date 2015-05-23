/*
 * Set up the game flags, client side.
 */

waitUntil { !isNil "flagInformation" };

if(!isNil "flagInformation" && hasInterface) then
{
    {
        _innerCondition = "(vehicle player) in thisList";
        _innerActivation = format ["player setVariable [""inFlagZone"", true]; player setVariable [""flagIndex"", %1]", _forEachIndex];
        _innerDeactivation = "player setVariable [""inFlagZone"", false]";

        _flagInnerTrigger = _x select 3;
        _flagInnerTrigger setTriggerArea [(getMarkerSize (_x select 0)) select 0, (getMarkerSize (_x select 0)) select 1, 0, false];
        _flagInnerTrigger setTriggerActivation ["ANY", "PRESENT", true];
        _flagInnerTrigger setTriggerStatements [_innerCondition, _innerActivation, _innerDeactivation];

        _outerCondition = "(vehicle player) in thisList";
        _outerActivation = format ["player setVariable [""inOuterFlagZone"", true]; player setVariable [""flagIndex"", %1]", _forEachIndex];
        _outerDeactivation = "player setVariable [""inFlagZone"", false]";

        _outerFlagTrigger = _x select 4;
        _outerFlagTrigger setTriggerArea [(getMarkerSize (_x select 1)) select 0, (getMarkerSize (_x select 1)) select 1, 0, false];
        _outerFlagTrigger setTriggerActivation ["ANY", "PRESENT", true];
        _outerFlagTrigger setTriggerStatements [_outerCondition, _outerActivation, _outerDeactivation];
    } foreach flagInformation;
};
