/*
 * Executed locally when player respawns in a multiplayer mission.
 *
 * Params: [<newUnit: Object>, <oldUnit: Object>, <respawn: Number>, <respawnDelay: Number>]
 */

//[] spawn setupPlayer;

// Check if player has actually respawned

systemChat "Spawned";

waitUntil { alive player };

if (player getVariable ["BIS_revive_incapacitated", false]) then
{
    // TODO: Strange revival loadout
    // For some reason when players go into the incapacitated state, they spawn a new default inventory.
    // loadout saved in onPlayerKilled.sqf
    _loadout = [player, [missionNamespace, "revivalLoadout"]] call BIS_fnc_loadInventory;
}
else
{
    _path = missionConfigFile >> "CfgRespawnInventory";
    _prefix =  toLower (str playerSide);

    systemChat _prefix;

    systemChat str (getPos player);
    systemChat str (isTouchingGround player);

    switch (true) do
    {
        case (floor ((getPosATL player) select 2) == 0):
        {
            _loadoutName = format ["%1Town1", _prefix];
            _loadout = [player, _path >> _loadoutName] call BIS_fnc_loadInventory;
        };
        case (floor ((getPosATL player) select 2) > 900):
        {
            _loadouts = [format ["%1Halo1", _prefix], format ["%1Halo2", _prefix]];
            _loadoutName = _loadouts select (floor (random (count _loadouts)));
            _loadout = [player, _path >> _loadoutName] call BIS_fnc_loadInventory;
        };
    };
};
