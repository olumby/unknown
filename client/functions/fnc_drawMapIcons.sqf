/*
 * Draw icons to players map.
 */

_map = _this select 0;

{
    _iconPlayer = "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa";
    _iconGroup = "\A3\ui_f\data\igui\cfg\islandmap\iconselect_ca.paa";
    _color = call playerColor;

    if (side _x == playerSide) then
    {
        if ((crew (vehicle _x) select 0) == _x) then
        {
            // if ((configFile >> "CfgVehicles" >> typeOf(vehicle _x) >> "icon") != "") then
            // {
            //     _icon = getText (configFile >> "CfgVehicles" >> (vehicle _x) >> "icon");
            // };
            if (group _x == group player && _x != player) then
            {
                _color = call groupColor;
                _map drawIcon [_iconGroup, _color, getPos (vehicle _x), 24, 24, getDir (vehicle _x)];
            };
            if (_x == player) then
            {
                _color = call playerColor;
                _map drawIcon [_iconPlayer, _color, getPos (vehicle _x), 24, 24, getDir (vehicle _x)];
            };

            _map drawIcon ["iconMan", _color, getPos (vehicle _x), 14, 14, getDir (vehicle _x)];
        };
    };
} forEach allUnits;

if (vehicle player != player) then
{
    _icon = getText (configFile >> "cfgVehicles" >> (vehicle player) >> "icon");
};
