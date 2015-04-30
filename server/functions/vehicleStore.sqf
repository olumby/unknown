/*
 * Set up the vehicle stores.
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
    _store addAction ["Open Vehicle Store", "client\dialogs\stores\openVehicleStore.sqf", [vehicleVarName _store], 1.5, false, false, "", "_this distance _target < 3"];

    _store setVariable ["R3F_LOG_disabled", true];
    if (!isNull attachedTo _store) then {
        (attachedTo _store) setVariable ["R3F_LOG_disabled", true];
    };
};






// this needs to be made dynamic
// vehicleStore_001 setVariable ["R3F_LOG_disabled", true];
// vehicleStore_001 attachTo [vehicleTable_001, [0,0,0.58]];
// vehicleStore_001 setDir 90;
// vehicleStore_001 addAction ["Spawn Hunter HMG", "client\functions\vehicleSpawn.sqf", [getMarkerPos "vehicle_001", "B_MRAP_01_hmg_F"]];
// vehicleStore_001 addAction ["Spawn Pawnee", "client\functions\vehicleSpawn.sqf", [getMarkerPos "vehicle_001", "B_Heli_Light_01_armed_F"]];
// vehicleStore_001 addAction ["Spawn Quad", "client\functions\vehicleSpawn.sqf", [getMarkerPos "vehicle_001", "B_Quadbike_01_F"]];
