/*
 * Draw icons to players map.
 */

_map = _this select 0;

// Players
{
    if (side _x == playerSide) then
    {
        if ((crew (vehicle _x) select 0) == _x) then
        {
            _color = call playerColor;

            _icon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "icon");
            if (_icon == "") then { _icon == "iconMan" };

            _text = name (vehicle _x);
            if (_x == player) then
            {
                _text = "";
                if (vehicle _x == _x) then { _icon = "iconManVirtual" };
            };
            // color for groups
            if (group _x == group player && _x != player) then { _color = call groupColor };

            _map drawIcon [_icon, _color, visiblePosition (vehicle _x), 24, 24, getDir (vehicle _x), _text, false, 0.03, "PuristaMedium", "right"];
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
if(!isNil "flagInformation" && !isNil "flagPossession" ) then
{
    {
        _possession = flagPossession select _forEachIndex;
        _color = [_possession select 3] call fnc_colorForSide;
        _missionStr = (str missionConfigFile);
        _dirPath = _missionStr select [0, (count _missionStr) - 15];
        _flagPath = format ["assets\image\flag%1.paa", _forEachIndex];

        _map drawIcon [(_dirPath + _flagPath), _color, getMarkerPos (_x select 0), 30, 30, 0];
    } foreach flagInformation;
};
