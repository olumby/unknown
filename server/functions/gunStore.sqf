/*
 * Set up the gun stores.
 */

_store = _this select 0;

if(isServer) then
{
    _storeDirection = getDir _store;
    _storeTable = createVehicle ["Land_Pallets_stack_F", (getPos _store), [], 0, "CAN_COLLIDE"];
    _storeTable setDir _storeDirection;
    _store attachTo [_storeTable, [0,0.2,0.6]];

    _store allowDamage false;
    _storeTable allowDamage false;
};

if(hasInterface) then
{

    _storeBox = "Box_NATO_WpsSpecial_F" createVehicleLocal (getPos _store);
    clearBackpackCargo _storeBox;
    clearMagazineCargo _storeBox;
    clearWeaponCargo _storeBox;
    clearItemCargo _storeBox;

    _storeBox attachTo[_store, [0,0.9,-0.9]];

    _store setVariable ["R3F_LOG_disabled", true];
    _storeBox setVariable ["R3F_LOG_disabled", true];
    if (!isNull attachedTo _store) then {
        (attachedTo _store) setVariable ["R3F_LOG_disabled", true];
    };

    _store addAction ["Open Gun Store", "client\dialogs\gunStore\openGunStore.sqf", [vehicleVarName _store, _storeBox], 1.5, false, false, "", "_this distance _target < 3"];
};
