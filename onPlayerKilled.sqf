/*
 * Executed when player is killed in singleplayer or in multiplayer mission.
 *
 * Params: [<oldUnit: Object>, <killer: Object>, <respawn: Number>, <respawnDelay: Object>]
 */

while { playerSide != side player } do
{
    _curPositions = missionNamespace getVariable ["activeSpawnPositions", []];

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

    {
        _x call BIS_fnc_removeRespawnPosition;
    } forEach _curPositions;

    _newPositions = [];
    {
        _newPosition = [missionNamespace, _x] call BIS_fnc_addRespawnPosition;
        _newPositions pushBack _newPosition;
    } forEach _availableMarkers;

    _haloJump = [missionNamespace, [9418,20238,1000], " HALO Jump"] call BIS_fnc_addRespawnPosition;
    _newPositions pushBack _haloJump;

    missionNamespace setVariable ["activeSpawnPositions", _newPositions];

    sleep 3;
};
