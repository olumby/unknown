/*
 * Change the qty for a gun store item.
 *
 * Params: [<itemType: String>, <qtyChange: Number>]
 */

#include "gunStore_defines.hpp"

_qtyChange = _this select 1;

_display = uiNamespace getVariable "UK_GunStoreDialog";

_list = _display displayCtrl main_list;
_cartType = "";

switch (_this select 0) do
{
    case "main":
    {
        _list = _display displayCtrl main_list;
        _cartType = "gunStoreCartWeapons";
    };
    case "acc":
    {
        _list = _display displayCtrl acc_list;
        _cartType = "gunStoreCartAccessories";
    };
    case "mag":
    {
        _list = _display displayCtrl mag_list;
        _cartType = "gunStoreCartMagazines";
    };
};

_cartItems = uiNamespace getVariable [_cartType, []];
_selectedItem = lnbCurSelRow _list;

_itemClass = _list lnbData [_selectedItem, 0];
_itemPrice = parseNumber (_list lnbData [_selectedItem, 1]);

// increase or decrease the item quantity
if(_qtyChange > 0) then
{
    _qty = parseNumber (_list lnbText [_selectedItem, 2]);
    _newQty = (_qty + 1);

    _cartItems pushBack [_itemClass, _itemPrice];

    _list lnbSetText [[_selectedItem, 2], (str _newQty)];
}
else
{
    _qty = parseNumber (_list lnbText [_selectedItem, 2]);
    _newQty = (_qty - 1);

    if (_newQty >= 0) then
    {
        {
            if (_x isEqualTo [_itemClass, _itemPrice]) exitWith
            {
                _cartItems deleteAt _forEachIndex;
            };
        } forEach _cartItems;

        _list lnbSetText [[_selectedItem, 2], (str _newQty)];
    };
};

uiNamespace setVariable [_cartType, _cartItems];

// update the display prices
_subTotal = 0;
{
    _subTotal = _subTotal + (_x select 1);
} forEach ((uiNamespace getVariable ["gunStoreCartWeapons", []]) + (uiNamespace getVariable ["gunStoreCartAccessories", []]) + (uiNamespace getVariable ["gunStoreCartMagazines", []]));

// calculate the discount here
_total = _subTotal;

// set price texts
_priceValue = _display displayCtrl price_value;
_totalPriceValue = _display displayCtrl total_price_value;
_discountValue = _display displayCtrl discount_value;

_priceValue ctrlSetText (str _subTotal);
_totalPriceValue ctrlSetText (str _total);
