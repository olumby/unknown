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
    _price = str (_x select 1);
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

    _row = _mainList lnbAddRow["", _name];
    _mainList lnbSetPicture[[_row,0], _picture];
} forEach (_weaponArray);

_mainList lnbSetCurSelRow 0;
