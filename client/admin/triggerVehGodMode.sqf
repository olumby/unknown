/*
 * Give the admins vehicle god mode.
 */

if ([player] call isAdmin) then
{
    if (vehicle player != player) then
    {

        _display = uiNamespace getVariable "UK_AdminDialog";

        _button = _display displayCtrl 29234;

        if (vehicle player getVariable ["VehGodModeEnabled", false]) then
        {
            // disable god mode
            vehicle player allowDamage true;
            vehicle player setDamage 0;
            vehicle player setVariable ["VehGodModeEnabled", false];

            _button ctrlSetText "Enable Vehicle God";
            hint "Vehicle God Mod Disabled";
        }
        else
        {
            // enable god mode
            vehicle player allowDamage false;
            vehicle player setDamage 0;
            vehicle player setVariable ["VehGodModeEnabled", true];

            _button ctrlSetText "Disable Vehicle God";
            hint "Vehicle God Mod Enabled";
        };
    }
    else
    {
        hint "You are not in a vehicle.";
    };
}
else
{
    hint "You are no admin.";
};
