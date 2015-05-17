/*
 * Called when the a weapon is selected from the main list.
 */

#include "gunStore_defines.hpp"

_display = uiNamespace getVariable "UK_GunStoreDialog";
_weaponFilter = _display displayCtrl weapon_filter;
_mainList = _display displayCtrl main_list;
_accList = _display displayCtrl acc_list;
_magList = _display displayCtrl mag_list;

_selectedGun = lnbCurSelRow _mainList;
_weaponClass = _mainList lnbData [_selectedGun, 0];

lbClear _accList;
lbClear _magList;

// Mag List
_weaponMagazines = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "magazines");
_weaponMuzzles = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "muzzles") - ["this"];
{
    _mags = getArray (configfile >> "CfgWeapons" >> _weaponClass >> _x >> "magazines");
    _weaponMagazines = _weaponMagazines + _mags;
} forEach _weaponMuzzles;

{
    if (_x in (call gunStoreMagazineIndex)) then
    {
        _magClass = _x;
        _magPrice = 0;
        {
            if ((_x select 0) == _magClass) exitWith
            {
                _magPrice = _x select 1;
            };
        } forEach (call gunStoreMagazinePricing);

        _name = getText (configFile >> "CfgMagazines" >> _magClass >> "displayName");
        _picture = getText (configFile >> "CfgMagazines" >> _magClass >> "picture");

        _magCart = uiNamespace getVariable ["gunStoreCartMagazines", []];

        _magQty = 0;
        if ([_magClass, _magPrice] in _magCart) then
        {
            {
                if (_x select 0 == _magClass) then
                {
                    _magQty = _magQty + 1;
                };
            } forEach _magCart;
        };

        _row = _magList lnbAddRow["", _name, (str _magQty)];
        _magList lnbSetPicture[[_row,0], _picture];
        _magList lnbSetData [[_row, 0], _magClass];
        _magList lnbSetData [[_row, 1], (str _magPrice)];
        _magList lnbSetData [[_row, 2], _name];
    };
} forEach (_weaponMagazines);

// Acc List
_pointerArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
_muzzleArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
_barrelArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
_opticArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");

{
    if (_x in (call gunStoreAccessoryIndex)) then
    {
        _accClass = _x;
        _accPrice = 0;
        {
            if ((_x select 0) == _accClass) exitWith
            {
                _accPrice = _x select 1;
            };
        } forEach (call gunStoreAccessoryPricing);

        _name = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
        _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");

        _accCart = uiNamespace getVariable ["gunStoreCartAccessories", []];

        _accQty = 0;
        if ([_accClass, _accPrice] in _accCart) then
        {
            {
                if (_x select 0 == _accClass) then
                {
                    _accQty = _accQty + 1;
                };
            } forEach _accCart;
        };

        _row = _accList lnbAddRow["", _name, (str _accQty)];
        _accList lnbSetPicture[[_row,0], _picture];
        _accList lnbSetData [[_row, 0], _accClass];
        _accList lnbSetData [[_row, 1], (str _accPrice)];
        _accList lnbSetData [[_row, 2], _name];
    };
} forEach (_pointerArray + _muzzleArray + _barrelArray + _opticArray);
