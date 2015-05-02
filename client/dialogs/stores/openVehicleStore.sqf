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

{
    _class = _x select 0;
    _picture = getText (configFile >> "cfgVehicles" >> _class >> "picture");
    _name = getText (configFile >> "cfgVehicles" >> _class >> "displayName");

    _row = _vehicleList lnbAddRow["", _name, _x select 1];
    _vehicleList lnbSetPicture[[_row,0], _picture];

} forEach (call vehicleStoreContent);

//_veh = createVehicle ["I_MRAP_03_hmg_F", ((getPos player) findEmptyPosition [1, 150, "I_MRAP_03_hmg_F"]), [], 0, "CAN_COLLIDE"];
