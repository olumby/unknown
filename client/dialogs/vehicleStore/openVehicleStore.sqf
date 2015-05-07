/*
 * Open the vehicle store, should be called from addAction.
 * Args:
 *     string    store name
 */

uiNamespace setVariable ["storeName", _this select 3 select 0];

#include "vehicleStore_defines.hpp"

createDialog "VehicleStore";
vehicleStoreDialogOpen = true;

_display = uiNamespace getVariable "UK_VehicleStoreDialog";

_vehicleList = _display displayCtrl vehicle_list;
_vehicleListFilter = _display displayCtrl vehicle_list_filter;
_buyButton = _display displayCtrl buy_vehicle_button;
_varSelection = _display displayCtrl var_selection;

_varSelection ctrlShow false;
_buyButton ctrlEnable false;

{
    _row = _vehicleListFilter lbAdd _x;
    _vehicleListFilter lbSetData [_row, _x];
} foreach ["All","Car","Utility","Armored","Air","Autonomous"];

_row = _vehicleList lnbAddRow["", "", ""];

_vehicleListFilter lbSetCurSel 0;
