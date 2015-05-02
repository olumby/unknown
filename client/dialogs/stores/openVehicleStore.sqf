/*
 * Open the vehicle store, should be called from addAction.
 * Args:
 *     string    store name
 */

_storeName = _this select 3 select 0;

#include "vehicleStore_defines.hpp"

createDialog "VehicleStore";
vehicleStoreDialogOpen = true;

_display = uiNamespace getVariable "UK_VehicleStoreDialog";

_vehicleList = _display displayCtrl vehicle_list;
_buyButton = _display displayCtrl buy_vehicle_button;

_buyButton ctrlEnable false;

{
    _class = _x select 0;
    _picture = getText (configFile >> "cfgVehicles" >> _class >> "picture");
    _name = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
    _price = str (_x select 1);

    _row = _vehicleList lnbAddRow["", _price, _name];
    _vehicleList lnbSetPicture[[_row,0], _picture];
    _vehicleList lnbSetData[[_row, 0], _class];
    _vehicleList lnbSetData[[_row, 1], _price];
    _vehicleList lnbSetData[[_row, 2], _storeName];

} forEach (call vehicleStoreContent);

_vehListSelectionChanged =
{
    _display = uiNamespace getVariable "UK_VehicleStoreDialog";
    _vehicleList = _display displayCtrl vehicle_list;
    _buyButton = _display displayCtrl buy_vehicle_button;

    _selectedVehicle = lnbCurSelRow _vehicleList;

    _class = _vehicleList lnbData [_selectedVehicle, 0];
    _price = _vehicleList lnbData [_selectedVehicle, 1];
    _storeName = _vehicleList lnbData [_selectedVehicle, 2];

    _marker = format ["%1_spawn", _storeName];

    _buttonAction = format ["closeDialog 0; _veh = createVehicle [""%1"", (%2 findEmptyPosition [1, 150, ""%1""]), [], 0, ""CAN_COLLIDE""];", _class, (getMarkerPos _marker)];

    _buyButton buttonSetAction _buttonAction;
    _buyButton ctrlEnable true;
};

_vehicleList ctrlAddEventHandler ["LBSelChanged", _vehListSelectionChanged];
