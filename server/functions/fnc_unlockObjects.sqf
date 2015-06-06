/*
 * Unlocks objects passed in an array.
 *
 * Params: [<objects: Array>, <unlockInventory: Boolean>]
 */

_objects = [_this, 0, []] call BIS_fnc_param;
_unlockInventory = [_this, 1, false] call BIS_fnc_param;

{
    _x setVariable ["R3F_LOG_disabled", false, true];
    if (_unlockInventory) then { _x setVariable ["cmd_inv_locked", nil, true] };
} forEach _objects;
