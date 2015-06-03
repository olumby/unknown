/*
 * Set up spawn locations
 */

while { isServer } do
{
    _curPositions = missionNamespace getVariable ["activeSpawnPositions", []];

    // Remove current Spawns
    {
        _x call BIS_fnc_removeRespawnPosition;
    } forEach _curPositions;

    _newSpawnPoints = [];

    // Towns
    _availableMarkers = [];
    {
        _marker = _x select 0;
        _pos = getMarkerPos (_marker);
        _units = nearestObjects [_pos, ["Man"], 200];

        _numWest = ({ alive _x && side _x == west && vehicle _x in _units } count allUnits);
        _numEast = ({ alive _x && side _x == east && vehicle _x in _units } count allUnits);
        _numResistance = ({ alive _x && side _x == resistance && vehicle _x in _units } count allUnits);

        switch (true) do
        {
            case ((_numWest + _numEast + _numResistance) == 0): {};
            case (_numWest > _numEast && _numWest > _numResistance): { _newSpawnPoints pushBack [west, _marker] };
            case (_numEast > _numWest && _numEast > _numResistance): { _newSpawnPoints pushBack [east, _marker] };
            case (_numResistance > _numEast && _numResistance > _numWest): { _newSpawnPoints pushBack [resistance, _marker] };
        };
    } forEach (call spawnLocations);

    // Spawn on friendly helicopters
    {
        if (alive _x && vehicle _x != _x && driver vehicle _x == _x && vehicle _x isKindOf "Helicopter_Base_F" && (getPos vehicle _x) select 2 > (call heliSpawnAltitude)) then
        {
            switch (side _x) do
            {
                case west: { _newSpawnPoints pushBack [west, vehicle _x] };
                case east: { _newSpawnPoints pushBack [east, vehicle _x] };
                case resistance: { _newSpawnPoints pushBack [resistance, vehicle _x] };
            };
        };
    } forEach allUnits;

    // Add spawns
    _newPositions = [];
    {
        _newPosition = _x call BIS_fnc_addRespawnPosition;
        _newPositions pushBack _newPosition
    } forEach _newSpawnPoints;

    // Debug spawn locations
    _haloJump = [missionNamespace, [9418,20238,1000], "HALO Jump"] call BIS_fnc_addRespawnPosition;
    _newPositions pushBack _haloJump;
    _groundSpawn = [missionNamespace, [8048,22640,0], "Ground Spawn"] call BIS_fnc_addRespawnPosition;
    _newPositions pushBack _groundSpawn;

    missionNamespace setVariable ["activeSpawnPositions", _newPositions];

    sleep 3;
};
