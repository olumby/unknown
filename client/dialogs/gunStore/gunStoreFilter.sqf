/*
 * Called when the weapon filter changes.
 */

#include "gunStore_defines.hpp"
disableSerialization;

_display = uiNamespace getVariable "UK_GunStoreDialog";
_weaponFilter = _display displayCtrl weapon_filter;
_mainList = _display displayCtrl main_list;

_filterIndex = lbCurSel _weaponFilter;
_filter = _weaponFilter lbData _filterIndex;

_weaponArray = switch(_filter) do
{
    case "Rifles": { call gunStoreContentRifles };
    case "Machine Guns": { call gunStoreContentMachine };
    case "Sniper Rifles": { call gunStoreContentSniperRifles };
    case "Launchers": { call gunStoreContentLaunchers };
    case "Handguns": { call gunStoreContentHandguns };
    case "Misc.": { call gunStoreContentMisc };
    default { call gunStoreContentRifles };
};

lbClear _mainList;

{
    _class = _x select 0;
    _price = _x select 1;
    _name = "";
    _picture = "";

    switch (true) do
    {
        case ( isClass (configFile >> "CfgWeapons" >> _class) ):
        {
            _name = getText(configFile >> "CfgWeapons" >> _class >> "displayName");
            _picture = getText(configFile >> "CfgWeapons" >> _class >> "picture");
        };
        case ( isClass (configFile >> "CfgMagazines" >> _class) ):
        {
            _name = getText(configFile >> "CfgMagazines" >> _class >> "displayName");
            _picture = getText(configFile >> "CfgMagazines" >> _class >> "picture");
        };
    };

    _weaponCart = uiNamespace getVariable ["gunStoreCartWeapons", []];

    _weaponQty = 0;
    if ([_class, _price] in _weaponCart) then
    {
        {
            if (_x select 0 == _class) then
            {
                _weaponQty = _weaponQty + 1;
            };
        } forEach _weaponCart;
    };

    _row = _mainList lnbAddRow ["", _name, (str _weaponQty)];
    _mainList lnbSetPicture [[_row,0], _picture];
    _mainList lnbSetData [[_row, 0], _class];
    _mainList lnbSetData [[_row, 1], (str _price)];
    _mainList lnbSetData [[_row, 2], _name];
} forEach _weaponArray;

_mainList lnbSetCurSelRow 0;
