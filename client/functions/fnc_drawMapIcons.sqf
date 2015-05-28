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

_storeIcons = [];

{
    _marker = format ["%1_label", _x];
    _pos = getMarkerPos _marker;
    _storeIcons pushBack ["assets\image\gunStore.paa", _pos];
} forEach (call gunStores);

{
    _missionStr = (str missionConfigFile);
    _dirPath = _missionStr select [0, (count _missionStr) - 15];
    _map drawIcon [(_dirPath + (_x select 0)), [1,1,1,1], (_x select 1), 30, 30, 0];
} forEach _storeIcons;
