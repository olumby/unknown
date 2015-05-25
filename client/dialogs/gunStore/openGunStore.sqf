/*
 * Open the gun store, should be called from addAction.
 *
 * Params: [<storeName: String>, <storeSpawnBox: Object>]
 */

_storeName = [(_this select 3), 0, ""] call BIS_fnc_param;
uiNamespace setVariable ["storeName", _storeName];

_storeSpawn = [(_this select 3), 1, ""] call BIS_fnc_param;
uiNamespace setVariable ["storeSpawn", _storeSpawn];

uiNamespace setVariable ["gunStoreCartWeapons", []];
uiNamespace setVariable ["gunStoreCartMagazines", []];
uiNamespace setVariable ["gunStoreCartAccessories", []];

#include "gunStore_defines.hpp"

createDialog "GunStore";
gunStoreDialogOpen = true;

_display = uiNamespace getVariable "UK_GunStoreDialog";
_weaponFilter = _display displayCtrl weapon_filter;
_buyButton = _display displayCtrl buy_button;
_mainList = _display displayCtrl main_list;

{
    _row = _weaponFilter lbAdd _x;
    _weaponFilter lbSetData [_row, _x];
} forEach (call gunStoreFilters);

_weaponFilter lbSetCurSel 0;
