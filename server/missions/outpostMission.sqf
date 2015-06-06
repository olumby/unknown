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
        [0,"I_CargoNet_01_ammo_F",[-2,3,0]]
    ];

    _furniture =
    [
        [90,"Land_HBarrier_3_F",[7,5,0]],
        [270,"Land_BagBunker_Small_F",[8,0,0]],
        [90,"Land_HBarrier_3_F",[7,-2.8,0]],
        [0,"Land_HBarrier_5_F",[-4.8,-5,0]],
        [0,"Land_HBarrier_5_F",[1,-5,0]],
        [0,"Land_HBarrier_5_F",[-4.8,5,0]],
        [0,"Land_HBarrier_5_F",[1,5,0]],
        [90,"Land_HBarrier_3_F",[-6.2,5,0]],
        [90,"Land_HBarrier_3_F",[-6.2,-3,0]],
        [90,"Land_HBarrier_5_F",[-9,2,0]],
        [315,"Land_PortableLight_single_F",[-4.5,3.5,0]],
        [225,"Land_PortableLight_single_F",[-4.5,-3.5,0]],
        [0,"CamoNet_INDP_open_F",[0,-0.5,0]],
        [0,"Land_WoodenTable_large_F",[5,-2.5,0]],
        [45,"MapBoard_altis_F",[5,3,0]]
    ];

    _furnitureObj = [_missionPosition, _furniture] call fnc_createObjects;
    _ammoObj = [_missionPosition, _ammoBoxes, true, resistance] call fnc_createObjects;

    _missionGroup = createGroup resistance;

    for "_i" from 1 to _aiCount do
    {
        _availableLoadouts = ["aiRifle1","aiRifle2","aiRifle3"];

        _unit = _missionGroup createUnit ["i_soldier_universal_f", _missionPosition, [], 0, "Form"];
        _loadout = _availableLoadouts select (floor (random (count _availableLoadouts)));
        [_unit, missionConfigFile >> "CfgRespawnInventory" >> _loadout] call BIS_fnc_loadInventory;
    };

    _missionGroup setBehaviour "SAFE";
    _missionGroup setCombatMode "RED";
    _missionWp = _missionGroup addWaypoint [_missionPosition, 0];
    _missionWp setWaypointType "HOLD";
    _missionWp setWaypointFormation "WEDGE";

    _missionStartTime = diag_tickTime;
    ["add", "outpost", _missionPosition, [[west,"attack"],[east,"attack"],[resistance,"defend"]]] call fnc_missionNotifier;

    waitUntil { (({ alive _x } count units _missionGroup) == 0) || ((diag_tickTime - _missionStartTime) > (call missionMaxLength)) };

    _success = (({ alive _x } count units _missionGroup) == 0);

    if (_success) then
    {
        // unlock base objects, ammobox and remove indie respawn option
        [_furnitureObj] call fnc_unlockObjects;
        [_ammoObj, true] call fnc_unlockObjects;
        ["remove", "outpost", _missionPosition, [[west,"completed"],[east,"completed"],[resistance,"lost"]]] call fnc_missionNotifier;
    }
    else
    {
        // unlock base objects, delete AI
        [_furnitureObj] call fnc_unlockObjects;
        { deleteVehicle _x } forEach (units _missionGroup);
        ["remove", "outpost", _missionPosition, [[west,"failed"],[east,"failed"],[resistance,"defended"]]] call fnc_missionNotifier;
    };

    deleteGroup _missionGroup;
    missionNamespace setVariable ["activeOutpost", [false, diag_tickTime]];
};
