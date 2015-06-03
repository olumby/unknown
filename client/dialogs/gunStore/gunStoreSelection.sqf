/*
 * Called when any gun store item is selected.
 *
 * Params: [<itemType: String>]
 */

#include "gunStore_defines.hpp"
disableSerialization;

_display = uiNamespace getVariable "UK_GunStoreDialog";
_selectedItemValue = _display displayCtrl selected_value;
_list = _display displayCtrl main_list;

_itemType = [_this, 0, "main"] call BIS_fnc_param;
switch (_itemType) do
{
    case "main":
    {
        _list = _display displayCtrl main_list;
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

_currentItem = lnbCurSelRow _list;

_price = _list lnbData [_currentItem, 1];

_selectedItemValue ctrlSetText _price;
