/*
 * Spawns an outpost mission
 *
 * Params: [<missionPosition: Position>, <aiCount: Number>]
 */

waituntil {!isnil "bis_fnc_init"};

if (isServer) then {
    _missionPosition = [_this, 0, [0,0,0]] call BIS_fnc_param;
    _aiCount = [_this, 1, 5] call BIS_fnc_param;

    _ammoBoxes =
    [
        [35, "I_CargoNet_01_ammo_f", [3,-4,0]]
    ];

    _furniture =
    [
        [0, "Land_HBarrier_5_F", [0,0,0]],
        [0, "Land_LampShabby_F", [1.5,-13.5,0]],
        [90, "Land_HBarrier_5_F", [0.2,-1.4,0]],
        [0, "Land_HBarrier_5_F", [5.7,0,0]],
        [90, "Land_HBarrier_5_F", [10.0,-1.4,0]],
        [90, "Land_HBarrier_5_F", [0.2,-9,0]],
        [90, "Land_HBarrier_5_F", [10.0,-9,0]],
        [0, "Land_HBarrier_5_F", [0.0,-14.9,0]],
        [0, "Land_HBarrier_5_F", [5.7,-14.9,0]],
        [270, "Land_BagBunker_Small_F", [12.5,-7.4,0]],
        [270, "Land_HBarrier_3_F", [-3.0,-8.5,0]],
        [0, "CamoNet_INDP_F", [5.0,-2,0]],
        [0, "Land_WoodenTable_large_F", [3.3,-11.5,0]],
        [0, "Land_WoodenTable_large_F", [7.0,-11.5,0]],
        [0, "Land_MapBoard_F", [5.0,-1.5,0]]
    ];

    _furnitureObj = [_missionPosition, _furniture] call fnc_createObjects;
    _ammoObj = [_missionPosition, _ammoBoxes, true, resistance] call fnc_createObjects;

    _aiPos = [((_missionPosition select 0) + 5), ((_missionPosition select 1) - 6), (_missionPosition select 2)];
    _missionGroup = createGroup resistance;

    for "_i" from 1 to _aiCount do
    {
        _availableLoadouts = ["aiRifle1","aiRifle2","aiRifle3"];

        _unit = _missionGroup createUnit ["i_soldier_universal_f", _aiPos, [], 0, "Form"];
        _loadout = _availableLoadouts select (floor (random (count _availableLoadouts)));
        [_unit, missionConfigFile >> "CfgRespawnInventory" >> _loadout] call BIS_fnc_loadInventory;
    };

    _missionGroup setBehaviour "SAFE";
    _missionGroup setCombatMode "RED";
    _missionWp = _missionGroup addWaypoint [_aiPos, 0];
    _missionWp setWaypointType "HOLD";
    _missionWp setWaypointFormation "WEDGE";

    _missionStartTime = diag_tickTime;

    waitUntil { (({ alive _x } count units _missionGroup) == 0) || ((diag_tickTime - _missionStartTime) > (call missionMaxLength)) };

    _success = (({ alive _x } count units _missionGroup) == 0);

    if (_success) then
    {
        diag_log "Mission Completeted";

        // unlock base, ammobox and remove indie respawn option
    }
    else
    {
        diag_log "Mission Failed";

        // tidy up. Delete base, ammobox, and indie respawn option
    };

    // delete group
};
