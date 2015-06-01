/*
 * Event handler for "KeyDown".
 *
 * Params: [<display: Display/Dialog/Control>, <keyCode: Number>, <shiftState: Boolean>, <ctrlState: Boolean>, <altState: Boolean>]
 */

_display = _this select 0;
_keyCode = _this select 1;
_shiftState = _this select 2;
_ctrlState = _this select 3;
_altState = _this select 4;

switch (_keyCode) do
{
    case 41:
    {
        // player menu
    };
    case 199:
    {
        // Admin
        [player] call openAdminMenu;
        true;
    };
    case 207:
    {
        // Ear plugs
    };
};

false;
