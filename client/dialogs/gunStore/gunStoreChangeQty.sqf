/*
 * Change the qty for a gun store item.
 * Args:
 *     string     type of item
 *     int        qty change
 */

#include "gunStore_defines.hpp"

_qtyChange = _this select 1;

_display = uiNamespace getVariable "UK_GunStoreDialog";
_cartItems = uiNamespace getVariable ["gunStoreCartItems", []];

switch (_this select 0) do
{
    case "main":
    {
        _list = _display displayCtrl main_list;
        _selectedGun = lnbCurSelRow _list;
        _gunAdvanced = (uiNamespace getVariable "storeWeapons") select _selectedGun;

        _weaponClass = _gunAdvanced select 0;
        _weaponPrice = _gunAdvanced select 1;

        if(_qtyChange > 0) then
        {
            _qty = parseNumber (_list lnbText [_selectedGun, 2]);
            _newQty = (_qty + 1);

            _cartItems pushBack [_weaponClass, _weaponPrice];

            _list lnbSetText [[_selectedGun, 2], (str _newQty)];
            _list lnbSetColor [[_selectedGun ,2], [0.96,0.25,0.13,0.75] ];
        }
        else
        {
            _qty = parseNumber (_list lnbText [_selectedGun, 2]);
            _newQty = (_qty - 1);

            if (_newQty >= 0) then
            {
                {
                    if (_x isEqualTo [_weaponClass, _weaponPrice]) exitWith
                    {
                        _cartItems deleteAt _forEachIndex;
                    };
                } forEach _cartItems;

                _list lnbSetText [[_selectedGun, 2], (str _newQty)];
                if (_newQty == 0) then
                {
                    _list lnbSetColor [[_selectedGun ,2], [0.95,0.95,0.95,1] ];
                };
            };
        };
    };
    case "acc":
    {
        _list = _display displayCtrl acc_list;

    };
    case "mag":
    {
        _list = _display displayCtrl mag_list;

    };
};

systemChat (str _cartItems);

uiNamespace setVariable ["gunStoreCartItems", _cartItems];
