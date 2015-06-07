/*
 * Draw icons to players map.
 */

_map = _this select 0;

// Players
_uavUnits = allUnitsUAV;
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
            if (vehicle _x in _uavUnits) then { _text = ""; };
            // color for groups
            if (group _x == group player && _x != player) then { _color = call groupColor };

            _map drawIcon [_icon, _color, visiblePosition (vehicle _x), 24, 24, getDir (vehicle _x), _text, false, 0.03, "PuristaMedium", "right"];
        };
    };
} forEach allUnits;

// Directory path for custom icons
_missionStr = (str missionConfigFile);
_dirPath = _missionStr select [0, (count _missionStr) - 15];

// Stores
fnc_iconForStore =
{
    _array = _this select 0;
    _image = _this select 1;
    {
        _marker = format ["%1_label", _x];
        _pos = getMarkerPos _marker;

        _map drawIcon [(_dirPath + _image), [1,1,1,1], _pos, 30, 30, 0];
    } forEach _array;
};

_storeIcons = ([(call gunStores), "assets\image\gunStore.paa"] call fnc_iconForStore);
_storeIcons = _storeIcons + ([(call vehicleStores), "assets\image\vehicleStore.paa"] call fnc_iconForStore);
_storeIcons = _storeIcons + ([(call serviceVehicles), "assets\image\serviceVehicle.paa"] call fnc_iconForStore);

// Flags
if (!isNil "flagInformation" && !isNil "flagPossession" ) then
{
    {
        _possession = flagPossession select _forEachIndex;
        _color = [_possession select 3] call fnc_colorForSide;
        _flagPath = format ["assets\image\flag%1.paa", _forEachIndex];

        _map drawIcon [(_dirPath + _flagPath), _color, getMarkerPos (_x select 0), 30, 30, 0];
    } forEach flagInformation;
};

// Missions
if (!isNil "bc_activeMissions") then
{
    {
        _filePath = "assets\image\objective.paa";
        _text = if ((ctrlMapScale _map) < 0.08) then { localize (format ["str_mission_%1_title", (_x select 0)]) } else { "" };
        _map drawIcon [(_dirPath + _filePath), [1,1,1,1], (_x select 1), 24, 24, 0, _text, false, 0.035, "PuristaSemiBold", "right"];
    } forEach bc_activeMissions;
};
