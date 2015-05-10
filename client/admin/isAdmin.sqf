/*
 * Check if the current player is an admin, if so give admin menu.
 */

_player = _this select 0;

if (getPlayerUID _player in call serverAdmins) then
{
    [] execVM "client\admin\openAdminMenu.sqf";
    hint "Hi Admin";
}
else
{
    hint "You are no admin.";
};
