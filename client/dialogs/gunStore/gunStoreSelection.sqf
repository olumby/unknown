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
_weaponMagazines = getArray(configfile >> "cfgWeapons" >> _weaponClass >> "magazines");
_weaponMuzzles = getArray(configfile >> "cfgWeapons" >> _weaponClass >> "muzzles") - ["this"];
{
    _mags = getArray(configfile >> "cfgWeapons" >> _weaponClass >> _x >> "magazines");
    _weaponMagazines = _weaponMagazines + _mags;
} forEach _weaponMuzzles;

{
    _name = getText(configFile >> "CfgMagazines" >> _x >> "displayName");
    _picture = getText(configFile >> "CfgMagazines" >> _x >> "picture");

    _row = _magList lnbAddRow["", _name, "0"];
    _magList lnbSetPicture[[_row,0], _picture];
} forEach (_weaponMagazines);

// Acc List
_pointerArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
_muzzleArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
_barrelArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
_opticArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");

{
    _name = getText(configFile >> "CfgWeapons" >> _x >> "displayName");
    _picture = getText(configFile >> "CfgWeapons" >> _x >> "picture");

    _row = _accList lnbAddRow["", _name, "0"];
    _accList lnbSetPicture[[_row,0], _picture];
} forEach (_pointerArray + _muzzleArray + _barrelArray + _opticArray);
