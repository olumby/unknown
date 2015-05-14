/*
 * Called when the weapon filter changes.
 */

#include "gunStore_defines.hpp"

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

uiNamespace setVariable ["storeWeapons", _weaponArray];

lbClear _mainList;

{
    _class = _x select 0;
    _picture = getText (configFile >> "cfgWeapons" >> _class >> "picture");
    _name = getText (configFile >> "cfgWeapons" >> _class >> "displayName");
    _price = str (_x select 1);

    _row = _mainList lnbAddRow["", "", _name];
    _mainList lnbSetPicture[[_row,0], _picture];
    _mainList lnbSetData[[_row, 0], _class];
    _mainList lnbSetData[[_row, 1], _price];
} forEach (_weaponArray);

_mainList lnbSetCurSelRow 0;
