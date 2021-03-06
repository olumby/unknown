/*
 * Executed locally when player respawns in a multiplayer mission.
 *
 * Params: [<newUnit: Object>, <oldUnit: Object>, <respawn: Number>, <respawnDelay: Number>]
 */

// waitUntil { alive player && isNil "BIS_fnc_respawnMenuPosition_positions" };
//
// player enableFatigue false;
// enableSentences false;
//
// [player] call fnc_addActions;
//
// // Respawn loadouts
// if (player getVariable ["BIS_revive_incapacitated", false]) then
// {
//     // TODO: Strange revival loadout
//     // For some reason when players go into the incapacitated state, they spawn a new default inventory.
//     // loadout saved in onPlayerKilled.sqf
//     _loadout = [player, [missionNamespace, "revivalLoadout"]] call BIS_fnc_loadInventory;
// }
// else
// {
//     _path = missionConfigFile >> "CfgRespawnInventory";
//     _prefix =  toLower (str playerSide);
//
//     switch (true) do
//     {
//         case ((floor ((getPosATL player) select 2) > 900) && typeOf (vehicle player) == "Steerable_Parachute_F"):
//         {
//             // Halo Jump (Helis and Beacons)
//             _loadouts = [format ["%1Halo1", _prefix], format ["%1Halo2", _prefix]];
//             _loadoutName = _loadouts select (floor (random (count _loadouts)));
//             _loadout = [player, _path >> _loadoutName] call BIS_fnc_loadInventory;
//
//             deleteVehicle (vehicle player);
//
//             [player, 150, true, true] spawn fnc_haloJump;
//         };
//         case (typeOf (vehicle player) == "Steerable_Parachute_F"):
//         {
//             // Lower altidute heli jump.
//             _loadoutName = format ["%1Heli1", _prefix];
//             _loadout = [player, _path >> _loadoutName] call BIS_fnc_loadInventory;
//
//             deleteVehicle (vehicle player);
//
//             [player, 200, true, false] spawn fnc_haloJump;
//         };
//         case ((vehicle player) isKindOf "Helicopter_Base_F"):
//         {
//             // heli spawn
//             _loadoutName = format ["%1Heli1", _prefix];
//             _loadout = [player, _path >> _loadoutName] call BIS_fnc_loadInventory;
//
//             waitUntil { vehicle player == player };
//             if (floor ((getPosATL player) select 2) > 200) then
//             {
//                 [player, 180, false, false] spawn fnc_haloJump;
//             };
//         };
//         default
//         {
//             // Town/Ground Spawn
//             _loadoutName = format ["%1Town1", _prefix];
//             _loadout = [player, _path >> _loadoutName] call BIS_fnc_loadInventory;
//
//             _list = player nearRoads 200;
//             _roadToMove = _list select (floor (random (count _list)));
//             player setPos (getPos _roadToMove);
//         };
//     };
// };
