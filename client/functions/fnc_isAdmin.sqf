/*
 * Check if the provided player is an admin.
 * Args:
 *     object     the player to check.
 */

_player = _this select 0;

_return = false;

if (getPlayerUID _player in call serverAdmins) then
{
    _return = true;
};

_return;
