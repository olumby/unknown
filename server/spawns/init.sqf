/*
 * Set up spawn locations
 */

while { isServer } do
{
    _newSpawnPoints = [];

    // Towns
    _availableMarkers = [];
    {
        _marker = _x select 0;
        _name = _x select 1;
        _pos = getMarkerPos (_marker);
        _units = nearestObjects [_pos, ["Man"], 200];

        _numWest = ({ alive _x && side _x == west && vehicle _x in _units } count allUnits);
        _numEast = ({ alive _x && side _x == east && vehicle _x in _units } count allUnits);
        _numResistance = ({ alive _x && side _x == resistance && vehicle _x in _units } count allUnits);

        switch (true) do
        {
            case ((_numWest + _numEast + _numResistance) == 0): {};
            case (_numWest > _numEast && _numWest > _numResistance): { _newSpawnPoints pushBack [west, _marker, _name, "town"] };
            case (_numEast > _numWest && _numEast > _numResistance): { _newSpawnPoints pushBack [east, _marker, _name, "town"] };
            case (_numResistance > _numEast && _numResistance > _numWest): { _newSpawnPoints pushBack [resistance, _marker, _name, "town"] };
        };
    } forEach (call spawnLocations);

    // Spawn on friendly helicopters
    {
        if (alive _x && vehicle _x != _x && driver vehicle _x == _x && vehicle _x isKindOf "Helicopter_Base_F" && (getPos vehicle _x) select 2 > (call heliSpawnAltitude)) then
        {
            switch (side _x) do
            {
                case west: { _newSpawnPoints pushBack [west, vehicle _x, name _x, "heli"] };
                case east: { _newSpawnPoints pushBack [east, vehicle _x, name _x, "heli"] };
                case resistance: { _newSpawnPoints pushBack [resistance, vehicle _x, name _x, "heli"] };
            };
        };
    } forEach allUnits;

    // Debug spawn locations
    _newSpawnPoints pushBack [civilian, [9418,20238,1000], "Example HALO Jump", "halo"];
    _newSpawnPoints pushBack [civilian, "spawn_001", "Example Town Spawn", "town"];

    missionNamespace setVariable ["activeSpawnPoints", _newSpawnPoints];
    publicVariable "activeSpawnPoints";

    sleep 3;
};
