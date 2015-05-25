/*
 * Let admin teleport to map location.
 */

if ([player] call fnc_isAdmin) then
{
    closeDialog 0;
    hint "Open the map and click where you want to teleport to.";
    ["adminTeleport", "onMapSingleClick", {
        vehicle player setPos [_pos select 0, _pos select 1, 0];
        hint "";

        ["adminTeleport","onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;
    }] call BIS_fnc_addStackedEventHandler;
}
else
{
    hint "You are no admin.";
};
