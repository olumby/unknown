/*
 * Called when a vehicle variation is selected from the list.
 */

#include "vehicleStore_defines.hpp"
disableSerialization;

_display = uiNamespace getVariable "UK_VehicleStoreDialog";
_vehicleList = _display displayCtrl vehicle_list;
_buyButton = _display displayCtrl buy_vehicle_button;
_varSelection = _display displayCtrl var_selection;
_priceValue = _display displayCtrl price_value;
_totalPriceValue = _display displayCtrl total_price_value;
_discountValue = _display displayCtrl discount_value;

_selectedVehicle = lnbCurSelRow _vehicleList;
_vehicleAdvanced = (uiNamespace getVariable "storeVehicles") select _selectedVehicle;

_selectedVariation = lbCurSel _varSelection;
_selectedVariationClass = _varSelection lbData _selectedVariation;

_priceValue ctrlSetText str (_vehicleAdvanced select 1);
_discountValue ctrlSetText "0";
_totalPriceValue ctrlSetText str (_vehicleAdvanced select 1);

_buttonAction = "";

_storeName = uiNamespace getVariable "storeName";
_storeSpawn = getMarkerPos (format ["%1_spawn", _storeName]);

if (_selectedVariationClass == "novar") then
{
    // buy vehicle normal
    _buttonAction = format ["[""%1"",%2,[%3,%4,%5],false,""""] spawn buyVehicle;", _vehicleAdvanced select 0, _vehicleAdvanced select 1, _storeSpawn select 0, _storeSpawn select 1, _storeSpawn select 2];
} else
{
    // buy vehicle with variation
    _buttonAction = format ["[""%1"",%2,[%3,%4,%5],true,""%6""] spawn buyVehicle;", _vehicleAdvanced select 0, _vehicleAdvanced select 1, _storeSpawn select 0, _storeSpawn select 1, _storeSpawn select 2, _selectedVariationClass];
};

_buyButton buttonSetAction _buttonAction;
_buyButton ctrlEnable true;
