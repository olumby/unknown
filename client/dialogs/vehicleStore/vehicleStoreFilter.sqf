/*
 * Called when the vehicle type filter changes.
 */

#include "vehicleStore_defines.hpp"
disableSerialization;

_display = uiNamespace getVariable "UK_VehicleStoreDialog";
_vehicleList = _display displayCtrl vehicle_list;
_vehicleListFilter = _display displayCtrl vehicle_list_filter;

_filterIndex = lbCurSel _vehicleListFilter;
_filter = _vehicleListFilter lbData _filterIndex;

_vehicleArray = switch(_filter) do
{
    case "Car": { call vehicleStoreContentCar };
    case "Utility": { call vehicleStoreContentUtility };
    case "Armored": { call vehicleStoreContentArmored };
    case "Air": { call vehicleStoreContentAir };
    case "Autonomous": { call vehicleStoreContentAutonomous };
    default { call vehicleStoreContent };
};

uiNamespace setVariable ["storeVehicles", _vehicleArray];

lbClear _vehicleList;

{
    _class = _x select 0;
    _picture = getText (configFile >> "cfgVehicles" >> _class >> "picture");
    _name = getText (configFile >> "cfgVehicles" >> _class >> "displayName");
    _price = str (_x select 1);

    _row = _vehicleList lnbAddRow["", "", _name];
    _vehicleList lnbSetPicture[[_row,0], _picture];
    _vehicleList lnbSetData[[_row, 0], _class];
    _vehicleList lnbSetData[[_row, 1], _price];

} forEach (_vehicleArray);

_vehicleList lnbSetCurSelRow 0;
