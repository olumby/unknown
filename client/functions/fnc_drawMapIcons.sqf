/*
 * Draw icons to players map.
 */

_map = _this select 0;

// Players
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

// Stores
fnc_iconForStore =
{
    _array = _this select 0;
    _image = _this select 1;

    _return = [];
    {
        _marker = format ["%1_label", _x];
        _pos = getMarkerPos _marker;
        _return pushBack [_image, _pos];
    } forEach _array;

    _return;
};

_storeIcons = ([(call gunStores), "assets\image\gunStore.paa"] call fnc_iconForStore);
_storeIcons = _storeIcons + ([(call vehicleStores), "assets\image\vehicleStore.paa"] call fnc_iconForStore);
_storeIcons = _storeIcons + ([(call serviceVehicles), "assets\image\serviceVehicle.paa"] call fnc_iconForStore);

{
    _missionStr = (str missionConfigFile);
    _dirPath = _missionStr select [0, (count _missionStr) - 15];
    _map drawIcon [(_dirPath + (_x select 0)), [1,1,1,1], (_x select 1), 30, 30, 0];
} forEach _storeIcons;

// Flags
if(!isNil "flagInformation" && hasInterface) then
{
    {
        _missionStr = (str missionConfigFile);
        _dirPath = _missionStr select [0, (count _missionStr) - 15];

        _map drawIcon [(_dirPath + "assets\image\alphaFlag.paa"), (call westColor), getMarkerPos (_x select 0), 30, 30, 0];
    } foreach flagInformation;
};
