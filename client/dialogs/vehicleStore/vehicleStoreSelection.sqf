/*
 * Called when a vehicle is selected from the list.
 */

#include "vehicleStore_defines.hpp"
disableSerialization;

_display = uiNamespace getVariable "UK_VehicleStoreDialog";
_vehicleList = _display displayCtrl vehicle_list;
_buyButton = _display displayCtrl buy_vehicle_button;
_varSelection = _display displayCtrl var_selection;

_selectedVehicle = lnbCurSelRow _vehicleList;

_vehicleAdvanced = (uiNamespace getVariable "storeVehicles") select _selectedVehicle;

lbClear _varSelection;

_baseVehicleName = getText (configFile >> "cfgVehicles" >> (_vehicleAdvanced select 0) >> "displayName");
_baseRow = _varSelection lbAdd _baseVehicleName;
_varSelection lbSetData [_baseRow, "novar"];

if (count _vehicleAdvanced > 2) then
{
    _variations = _vehicleAdvanced select 2;
    {
        _name = getText (missionConfigFile >> "CfgVehicleTemplates" >> _x >> "displayName");
        _row = _varSelection lbAdd _name;
        _varSelection lbSetData [_row, _x];
    } forEach _variations;
};

_varSelection ctrlShow true;
_varSelection lbSetCurSel 0;
