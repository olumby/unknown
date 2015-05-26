/*
 * Executed when player is killed in singleplayer or in multiplayer mission.
 *
 * Params: [<oldUnit: Object>, <killer: Object>, <respawn: Number>, <respawnDelay: Object>]
 */

while {!(alive player)} do
{
    _activeSpawns = missionNamespace getVariable ["activeSpawns", []];

    {
        _x call BIS_fnc_removeRespawnPosition;
    } forEach _activeSpawns;

    _activeSpawns = [];
    {
        _spawnMarker = _x select 0;
        _spawnName = _x select 1;

        _curSpawn = [missionNamespace, _spawnMarker] call BIS_fnc_addRespawnPosition;
        _activeSpawns pushBack _curSpawn;
    } forEach (call spawnLocations);

    _curSpawn = [missionNamespace, [9418,20238,500]] call BIS_fnc_addRespawnPosition;
    _activeSpawns pushBack _curSpawn;

    missionNamespace setVariable ["activeSpawns", _activeSpawns];

    sleep 3;
};
