/*
 * Charge and deliver gun store purchases.
 */

#include "gunStore_defines.hpp"

_display = uiNamespace getVariable "UK_GunStoreDialog";

_closeButton = _display displayCtrl close_button;
_buyButton = _display displayCtrl buy_button;

_closeButton ctrlEnable false;
_buyButton ctrlEnable false;

_allCartItems = ((uiNamespace getVariable ["gunStoreCartWeapons", []]) + (uiNamespace getVariable ["gunStoreCartAccessories", []]) + (uiNamespace getVariable ["gunStoreCartMagazines", []]));

if (count _allCartItems == 0) then
{
    ["You need to select some items to buy", "No Items Selected", false, "CLOSE"] spawn BIS_fnc_guiMessage;

    _closeButton ctrlEnable true;
    _buyButton ctrlEnable true;
}
else
{
    _totalPrice = 0;
    {
        _totalPrice = (_totalPrice + (_x select 1));
    } forEach _allCartItems;

    // check and charge the user


    gunStoreDialogOpen = false;
    closeDialog 0;
};
