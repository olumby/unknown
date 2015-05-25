hint "Killed";

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

    missionNamespace setVariable ["activeSpawns", _activeSpawns];

    sleep 3;
};
