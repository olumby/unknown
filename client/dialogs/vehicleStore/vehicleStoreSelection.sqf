/*
 * Called when a vehicle is selected from the list.
 */

#include "vehicleStore_defines.hpp"

_display = uiNamespace getVariable "UK_VehicleStoreDialog";
_vehicleList = _display displayCtrl vehicle_list;
_buyButton = _display displayCtrl buy_vehicle_button;
_varSelection = _display displayCtrl var_selection;

_selectedVehicle = lnbCurSelRow _vehicleList;

_class = _vehicleList lnbData [_selectedVehicle, 0];
_price = _vehicleList lnbData [_selectedVehicle, 1];
_storeName = uiNamespace getVariable "storeName";

_varSelection ctrlShow true;

_marker = format ["%1_spawn", _storeName];

_buttonAction = format ["closeDialog 0; _veh = createVehicle [""%1"", (%2 findEmptyPosition [1, 150, ""%1""]), [], 0, ""CAN_COLLIDE""];", _class, (getMarkerPos _marker)];

_buyButton buttonSetAction _buttonAction;
_buyButton ctrlEnable true;
