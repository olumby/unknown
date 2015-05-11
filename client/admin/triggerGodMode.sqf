/*
 * Give the admin god mode.
 */

if ([player] call isAdmin) then
{
    if (player getVariable ["GodModeEnabled", false]) then
    {
        // disable god mode
        player allowDamage true;
        player setDamage 0;
        player setVariable ["GodModeEnabled", false];

        hint "God Mod Disabled";
    }
    else
    {
        // enable god mode
        player allowDamage false;
        player setDamage 0;
        player setVariable ["GodModeEnabled", true];

        hint "God Mod Enabled";
    };
}
else
{
    hint "You are no admin.";
};
