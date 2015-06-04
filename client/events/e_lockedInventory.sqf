/*
 * Event handler for "InventoryOpened" and "Take".
 *
 * Params: [<unit: Object>, <object: Object>]
 */

_obj = _this select 1;

_locked = _obj getVariable ["cmd_inv_locked", [false, playerSide]];

if ( (_locked select 0) && playerSide != (_locked select 1) ) then
{
    titleText [localize "str_object_locked", "PLAIN DOWN", 0.3];
    true;
};
