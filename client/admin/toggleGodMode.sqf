/*
 * Give the admin god mode.
 */

disableSerialization;

if ([player] call fnc_isAdmin) then
{
    _display = uiNamespace getVariable "UK_AdminDialog";

    _button = _display displayCtrl 29235;

    if (player getVariable ["GodModeEnabled", false]) then
    {
        // disable god mode
        player allowDamage true;
        player setDamage 0;
        player setVariable ["GodModeEnabled", false];

        _button ctrlSetText "Enable Player God";
        hint "God Mod Disabled";
    }
    else
    {
        // enable god mode
        player allowDamage false;
        player setDamage 0;
        player setVariable ["GodModeEnabled", true];

        _button ctrlSetText "Disable Player God";
        hint "God Mod Enabled";
    };
}
else
{
    hint "You are no admin.";
};
