/*
 * Executed locally when player respawns in a multiplayer mission.
 *
 * Params: [<newUnit: Object>, <oldUnit: Object>, <respawn: Number>, <respawnDelay: Number>]
 */

waitUntil { alive player };

player enableFatigue false;
enableSentences false;

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

    switch (true) do
    {
        case (floor ((getPosATL player) select 2) == 0):
        {
            // Town Spawn
            _loadoutName = format ["%1Town1", _prefix];
            _loadout = [player, _path >> _loadoutName] call BIS_fnc_loadInventory;

            _list = player nearRoads 200;
            _roadToMove = _list select (floor (random (count _list)));
            player setPos (getPos _roadToMove);
        };
        case (floor ((getPosATL player) select 2) > 900):
        {
            // Halo Jump
            _loadouts = [format ["%1Halo1", _prefix], format ["%1Halo2", _prefix]];
            _loadoutName = _loadouts select (floor (random (count _loadouts)));
            _loadout = [player, _path >> _loadoutName] call BIS_fnc_loadInventory;

            player action ["GetOut", vehicle player];

            _chem = "chemlight_red" createVehicle [0,0,0];
            _chem attachTo [player, [0, -0.05, 0.05], "LeftShoulder"];

            waitUntil { ((getPosATL player) select 2) < 135 };
            _chute = createVehicle ["Steerable_Parachute_F", getPosATL player, [], getDir player, "FLY"];
            _chute setPos (getPos player);
            player assignAsDriver _chute;
            player moveIndriver _chute;

            waitUntil { ((getPosATL player) select 2) < 2 };
            detach _chem;
            deleteVehicle _chem;
        };
    };
};
