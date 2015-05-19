/*
 * Set up the game flags, client side.
 */

waitUntil { !isNil "flagInformation" };

if(!isNil "flagInformation" && hasInterface) then
{
    _condition = "(vehicle player) in thisList && (getPos (vehicle player) select 2) <= 250";
    _activation = "hint 'Entered'";
    _deactivation = "hint 'Exited'";

    {
        _flagTrigger = _x select 3;
        _flagTrigger setTriggerArea [(getMarkerSize (_x select 0)) select 0, (getMarkerSize (_x select 0)) select 1, 0, false];
        _flagTrigger setTriggerActivation ["ANY", "PRESENT", true];
        _flagTrigger setTriggerStatements [_condition, _activation, _deactivation];
    } foreach flagInformation;
};
