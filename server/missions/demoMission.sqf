waituntil {!isnil "bis_fnc_init"};

_vehClass = _this select 0;
_spawnPos = _this select 1;
_spawnDir = _this select 2;
_destPos = _this select 3;

if (isServer) then {
    _sv = [_spawnPos, _spawnDir, _vehClass, EAST] call BIS_fnc_spawnVehicle;
    
    _veh = _sv select 0;
    _grp = _sv select 2;
    _grp setBehaviour "CARELESS";
    
    _wp = _grp addWaypoint [_destPos, 0];
    _wp setWaypointType "MOVE";
    _wp setWaypointSpeed "LIMITED";

    // waitUntil{ !canMove _veh OR {alive _x} count crew _veh == 0};
    // sleep 10;
    // {deleteVehicle _x} forEach crew _veh; 
    // deletevehicle _veh; 

    // {deleteVehicle _x} forEach units _veh;

    // deleteGroup _grp;
};
