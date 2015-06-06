/*
 * Handle the "bc_missionNotifcation" pvar when broadcast over network.
 *
 * Params: [<variable: String>, <value: Anything>]
 */

_value = _this select 1;

_name = _value select 0;
_title = localize (format ["str_mission_%1_title", _name]);

{
    if ((_x select 0) == playerSide) then
    {
        _key = _x select 1;
        _message = localize (format ["str_mission_%1_%2", _name, _key]);

        ["missionNotification", [_title, _message]] call BIS_fnc_showNotification;
    };
} forEach (_value select 2);
