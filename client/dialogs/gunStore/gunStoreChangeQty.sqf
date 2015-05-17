/*
 * Change the qty for a gun store item.
 * Args:
 *     string     type of item
 *     int        qty change
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

if(_qtyChange > 0) then
{
    _qty = parseNumber (_list lnbText [_selectedItem, 2]);
    _newQty = (_qty + 1);

    _cartItems pushBack [_itemClass, _itemPrice];

    _list lnbSetText [[_selectedItem, 2], (str _newQty)];
    _list lnbSetColor [[_selectedItem ,2], [0.96,0.25,0.13,0.75] ];
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
        if (_newQty == 0) then
        {
            _list lnbSetColor [[_selectedItem ,2], [0.95,0.95,0.95,1] ];
        };
    };
};

systemChat (str _cartItems);

uiNamespace setVariable [_cartType, _cartItems];
