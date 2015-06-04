/*
 * Reward the player and post message to feed.
 *
 * Params: [<type: String>, <money: Number>]
 */

_type = [_this, 0, "", [""]] call BIS_fnc_param;
_money = [_this, 1, 0, [0]] call BIS_fnc_param;

_localization = localize ("str_cmd_" + _type);
_money = format ["<t color='#ff0000'>%1</t>", [_money] call fnc_formatNumber];
_message = format ["<t align='right'>%1, %2.</t>", _localization, _money];

[_message] call updatePlayerFeed;
