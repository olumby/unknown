#include "vehicleStore_defines.hpp"

_display = uiNamespace getVariable "UK_VehicleStoreDialog";
_vehicleList = _display displayCtrl vehicle_list;
_buyButton = _display displayCtrl buy_vehicle_button;
_vehiclePicture = _display displayCtrl vehicle_picture;

_selectedVehicle = lnbCurSelRow _vehicleList;

_class = _vehicleList lnbData [_selectedVehicle, 0];
_price = _vehicleList lnbData [_selectedVehicle, 1];
_storeName = _vehicleList lnbData [_selectedVehicle, 2];

_picture = getText (configFile >> "cfgVehicles" >> _class >> "picture");

_vehiclePicture ctrlSetText _picture;

_marker = format ["%1_spawn", _storeName];

_buttonAction = format ["closeDialog 0; _veh = createVehicle [""%1"", (%2 findEmptyPosition [1, 150, ""%1""]), [], 0, ""CAN_COLLIDE""];", _class, (getMarkerPos _marker)];

_buyButton buttonSetAction _buttonAction;
_buyButton ctrlEnable true;
