/*
 * Executed when player is killed in singleplayer or in multiplayer mission.
 *
 * Params: [<oldUnit: Object>, <killer: Object>, <respawn: Number>, <respawnDelay: Object>]
 */

fnc_spawnDiff =
{
    _arrayA = [_this, 0, []] call BIS_fnc_param;
    _arrayB = [_this, 1, []] call BIS_fnc_param;

    // ["One", "Two", "Three"] ["One", "Two", "Four"]
    // ["Three"] ["Four"]

    _removed = [];
    _added = [];
    {
        // Removed
        if ( !(_x in _arrayB)) then
        {
            _removed pushBack _forEachIndex;
        };
    } forEach _arrayA;

    {
        // Added
        if ( !(_x in _arrayA)) then
        {
            _added pushBack _forEachIndex;
        };
    } forEach _arrayB;

    [_removed, _added];
};

_oldUnit = _this select 0;

_curSpawn = [missionNamespace, [9418,20238,500], " HALO Jump"] call BIS_fnc_addRespawnPosition;

_whileIndex = 0;
while { playerSide != side player } do
{
    _whileIndex = _whileIndex + 1;
    systemChat ("Loop #" + (str _whileIndex));

    _curMarkers = missionNamespace getVariable ["activeSpawnMarkers", []];
    _curPositions = missionNamespace getVariable ["activeSpawnPositions", []];

    systemChat (str _curMarkers);

    _availableMarkers = [];
    {
        _marker = _x select 0;
        _pos = getMarkerPos (_marker);
        _units = nearestObjects [_pos, ["Man"], 200];

        _numEnemy = ({ alive _x && side _x != playerSide && vehicle _x in _units } count allUnits);
        _numFriend = ({ alive _x && side _x == playerSide && vehicle _x in _units } count allUnits);

        if (_numFriend > _numEnemy) then
        {
            _availableMarkers pushBack _marker;
        };
    } forEach (call spawnLocations);

    systemChat (str _availableMarkers);

    _diff = [_curMarkers, _availableMarkers] call fnc_spawnDiff;

    systemChat (str _diff);

    _newPositions = + _curPositions;
    _newMarkers = + _curMarkers;
    {
        // remove marker
        (_curPositions select _x) call BIS_fnc_removeRespawnPosition;
        _newPositions = _newPositions - [(_curPositions select _x)];
        _newMarkers = _newMarkers - [(_curMarkers select _x)];
    } forEach (_diff select 0);

    {
        _newPosition = [missionNamespace, _availableMarkers select _x] call BIS_fnc_addRespawnPosition;
        _newPositions pushBack _newPosition;
        _newMarkers pushBack (_availableMarkers select _x);
    } forEach (_diff select 1);

    systemChat (str _newMarkers);

    missionNamespace setVariable ["activeSpawnMarkers", _newMarkers];
    missionNamespace setVariable ["activeSpawnPositions", _newPositions];

    sleep 3;
};
