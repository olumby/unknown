/*
 * If the player is an admin, open and populate admin store.
 */

#include "adminMenu_defines.hpp"
disableSerialization;

if ([player] call fnc_isAdmin) then
{
    createDialog "AdminDialog";
    adminDialogOpen = true;

    _display = uiNamespace getVariable "UK_AdminDialog";
    _godButton = _display displayCtrl god_button;
    _vehGodButton = _display displayCtrl veh_god_button;

    if (player getVariable ["GodModeEnabled", false]) then
    {
        _godButton ctrlSetText "Disable Player God";
    };

    if (vehicle player != player) then
    {
        _vehGodButton ctrlEnable true;
        if (vehicle player getVariable ["VehGodModeEnabled", false]) then
        {
            _vehGodButton ctrlSetText "Disable Vehicle God";
        }
        else
        {
            _vehGodButton ctrlSetText "Enable Vehicle God";
        };
    }
    else
    {
        _vehGodButton ctrlEnable false;
    };

}
else
{
    hint "You are no admin.";
};
