/*
 * Give the admins vehicle god mode.
 */

if ([player] call isAdmin) then
{
    if (vehicle player != player) then
    {
        if (vehicle player getVariable ["VehGodModeEnabled", false]) then
        {
            // disable god mode
            vehicle player allowDamage true;
            vehicle player setDamage 0;
            vehicle player setVariable ["VehGodModeEnabled", false];

            hint "Vehicle God Mod Disabled";
        }
        else
        {
            // enable god mode
            vehicle player allowDamage false;
            vehicle player setDamage 0;
            vehicle player setVariable ["VehGodModeEnabled", true];

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
