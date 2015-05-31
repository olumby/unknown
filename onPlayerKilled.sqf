/*
 * Executed when player is killed in singleplayer or in multiplayer mission.
 *
 * Params: [<oldUnit: Object>, <killer: Object>, <respawn: Number>, <respawnDelay: Object>]
 */

// TODO: See onPlayerRespawn.sqf - revive loadout
// Save player loadout
[player, [missionNamespace, "revivalLoadout"]] call BIS_fnc_saveInventory;

// Add draw event to respawn map
waitUntil { !isNull (uiNamespace getVariable "RscDisplayRespawn_display") };
_respawnDisplay = uiNamespace getVariable ["RscDisplayRespawn_display", displayNull];
_respawnEh = (_respawnDisplay displayCtrl 1050) ctrlAddEventHandler ["draw", { [_this select 0] call fnc_drawMapIcons; }];

while { playerSide != side player } do
{
    _curPositions = missionNamespace getVariable ["activeSpawnPositions", []];

    // Remove current Spawns
    {
        _x call BIS_fnc_removeRespawnPosition;
    } forEach _curPositions;

    // Spawn on friendly towns
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

    _newPositions = [];
    {
        _newPosition = [missionNamespace, _x] call BIS_fnc_addRespawnPosition;
        _newPositions pushBack _newPosition;
    } forEach _availableMarkers;

    // Spawn on friendly helicopters
    {
        if (alive _x && side _x == playerSide && vehicle _x != _x && driver vehicle _x == _x && vehicle _x isKindOf "Helicopter_Base_F" && (getPos vehicle _x) select 2 > (call heliSpawnAltitude)) then
        {
            _newPosition = [missionNamespace, vehicle _x] call BIS_fnc_addRespawnPosition;
            _newPositions pushBack _newPosition;
        };
    } forEach allUnits;

    // Debug spawn types
    _haloJump = [missionNamespace, [9418,20238,1000], "HALO Jump"] call BIS_fnc_addRespawnPosition;
    _newPositions pushBack _haloJump;
    _groundSpawn = [missionNamespace, [8048,22640,0], "Ground Spawn"] call BIS_fnc_addRespawnPosition;
    _newPositions pushBack _groundSpawn;

    missionNamespace setVariable ["activeSpawnPositions", _newPositions];

    sleep 3;
};
