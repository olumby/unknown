/*
 * Spawns an outpost mission
 *
 * Params: [<missionPosition: Position>, <aiCount: Number>]
 */

waituntil {!isnil "bis_fnc_init"};

if (isServer) then {
    _missionPosition = [_this, 0, [0,0,0]] call BIS_fnc_param;
    _aiCount = [_this, 1, 5] call BIS_fnc_param;

    _furnature = [
        [0, "Land_HBarrier_5_F", [0,0,0]],
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

    _furnatureObj = [];
    {
        _dir = _x select 0;
        _class = _x select 1;
        _pos = _x select 2;

        _newPos = [(_missionPosition select 0) + (_pos select 0), (_missionPosition select 1) + (_pos select 1), (_missionPosition select 2) + (_pos select 2)];

        _object = createVehicle [_class, _newPos, [], 0, "NONE"];
        _object setDir _dir;
        _object setPos _newPos;
        _object setVariable ["R3F_LOG_disabled", true];

        _furnatureObj pushBack _object;
    } forEach _furnature;

    _missionGroup = createGroup CIVILIAN;

    for "_i" from 1 to _aiCount do
    {
        _unit = _missionGroup createUnit ["c_man_1", _missionPosition, [], 0, "Form"];

        _unit addWeapon "arifle_TRG21_F";
        _unit setRank "SERGEANT";
        _unit addVest "V_PlateCarrier1_rgr";
        _unit addMagazine "30Rnd_556x45_Stanag";
        _unit addMagazine "30Rnd_556x45_Stanag";
        _unit addMagazine "30Rnd_556x45_Stanag";
    };


    // _sv = [_spawnPos, _spawnDir, _vehClass, EAST] call BIS_fnc_spawnVehicle;
    //
    // _veh = _sv select 0;
    // _grp = _sv select 2;
    // _grp setBehaviour "CARELESS";
    //
    // _wp = _grp addWaypoint [_destPos, 0];
    // _wp setWaypointType "MOVE";
    // _wp setWaypointSpeed "LIMITED";

    // waitUntil{ !canMove _veh OR {alive _x} count crew _veh == 0};
    // sleep 10;
    // {deleteVehicle _x} forEach crew _veh;
    // deletevehicle _veh;

    // {deleteVehicle _x} forEach units _veh;

    // deleteGroup _grp;
};
