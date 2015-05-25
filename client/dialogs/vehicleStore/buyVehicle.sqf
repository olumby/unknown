/*
 * Purchase, spawn and charge a vehicle.
 *
 * Params: [<vehicleClass: String>, <price: Number>, <spawnLocation: Array - Position>, <hasVariation: Boolean>, <variationClass: String>]
 */

_class = _this select 0;
_price = _this select 1;
_pos = _this select 2;
_hasVar = _this select 3;

// we need to charge customers up here.

closeDialog 0;
vehicleStoreDialogOpen = false;

if (_hasVar) then
{
    _var = _this select 4;

    _veh = createVehicle [_class, (_pos findEmptyPosition [1, 150, _class]), [], 0, "NONE"];

    waitUntil { !isNil "_veh"; !isNull _veh; };
    _veh setVariable ["BIS_enableRandomization", false, true];
    [_veh, _var, _var] call BIS_fnc_initVehicle;
} else
{
    _veh = createVehicle [_class, (_pos findEmptyPosition [1, 150, _class]), [], 0, "NONE"];
};

clearBackpackCargoGlobal _veh;
clearMagazineCargoGlobal _veh;
clearWeaponCargoGlobal _veh;
clearItemCargoGlobal _veh;
