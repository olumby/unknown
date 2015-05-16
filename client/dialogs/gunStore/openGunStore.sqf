/*
 * Open the gun store, should be called from addAction.
 * Args:
 *     string    store name
 */

uiNamespace setVariable ["storeName", _this select 3 select 0];
uiNamespace setVariable ["gunStoreCartItems", []];

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
