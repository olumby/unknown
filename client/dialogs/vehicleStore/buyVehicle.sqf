/*
 * Purchase, spawn and charge a vehicle.
 *
 * Params: [<vehicleClass: String>, <price: Number>, <spawnLocation: Array - Position>, <hasVariation: Boolean>, <variationClass: String>]
 */

_vehicleClass = [_this, 0, ""] call BIS_fnc_param;
_price = [_this, 1, 0] call BIS_fnc_param;
_spawnLocation = [_this, 2, [0,0,0]] call BIS_fnc_param;
_hasVariation = [_this, 3, false] call BIS_fnc_param;

// we need to charge customers up here.

closeDialog 0;
vehicleStoreDialogOpen = false;

if (_hasVariation) then
{
    _variationClass = [_this, 4, ""] call BIS_fnc_param;

    _veh = createVehicle [_vehicleClass, (_spawnLocation findEmptyPosition [1, 150, _vehicleClass]), [], 0, "NONE"];

    waitUntil { !isNil "_veh"; !isNull _veh; };
    _veh setVariable ["BIS_enableRandomization", false, true];
    [_veh, _variationClass, _variationClass] call BIS_fnc_initVehicle;
} else
{
    _veh = createVehicle [_vehicleClass, (_spawnLocation findEmptyPosition [1, 150, _vehicleClass]), [], 0, "NONE"];
};

clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearItemCargoGlobal _veh;
