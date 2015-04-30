/*
 * Open the vehicle store, should be called from addAction.
 * Args:
 *     string    store name
 */

_storeName = _this select 3 select 0;

#include "vehicleStore_defines.hpp"

createDialog "VehicleStore";
vehicleStoreDialogOpen = true;

//_veh = createVehicle ["I_MRAP_03_hmg_F", ((getPos player) findEmptyPosition [1, 150, "I_MRAP_03_hmg_F"]), [], 0, "CAN_COLLIDE"];
