/*
 * Set up the vehicle stores.
 *
 * Params: [<store: Object>]
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
    _store addAction ["Open Vehicle Store", "client\dialogs\vehicleStore\openVehicleStore.sqf", [vehicleVarName _store], 1.5, false, false, "", "_this distance _target < 3"];

    _store setVariable ["R3F_LOG_disabled", true];
    if (!isNull attachedTo _store) then {
        (attachedTo _store) setVariable ["R3F_LOG_disabled", true];
    };
};
