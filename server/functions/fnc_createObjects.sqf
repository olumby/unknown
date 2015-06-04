/*
 * Creates objects for missions and returns an array.
 *
 * Params: [<missionPosition: Position>, <objects: Array>, <lockInventory: Boolean>, <lockSide: Side>]
 */

_missionPosition = [_this, 0, [0,0,0]] call BIS_fnc_param;
_objects = [_this, 1, []] call BIS_fnc_param;
_lockInventory = [_this, 2, false] call BIS_fnc_param;
_lockSide = [_this, 3, civilian] call BIS_fnc_param;

_returnObjects = [];
{
    _dir = _x select 0;
    _class = _x select 1;
    _pos = _x select 2;

    _newPos = [(_missionPosition select 0) + (_pos select 0), (_missionPosition select 1) + (_pos select 1), (_missionPosition select 2) + (_pos select 2)];

    _object = createVehicle [_class, _newPos, [], 0, "NONE"];
    _object setDir _dir;
    _object setPos _newPos;
    _object setVariable ["R3F_LOG_disabled", true, true];
    if (_lockInventory) then { _object setVariable ["cmd_inv_locked", [true, _lockSide], true] };

    _returnObjects pushBack _object;
} forEach _objects;

_returnObjects;
