/*
 * Executed when player is killed in singleplayer or in multiplayer mission.
 *
 * Params: [<oldUnit: Object>, <killer: Object>, <respawn: Number>, <respawnDelay: Object>]
 */

// disableSerialization;
//
// // TODO: See onPlayerRespawn.sqf - revive loadout
// // Save player loadout
// [player, [missionNamespace, "revivalLoadout"]] call BIS_fnc_saveInventory;
//
// // Add draw event to respawn map
// waitUntil { !isNull (uiNamespace getVariable "RscDisplayRespawn_display") };
// _respawnDisplay = uiNamespace getVariable ["RscDisplayRespawn_display", displayNull];
// _respawnEh = (_respawnDisplay displayCtrl 1050) ctrlAddEventHandler ["draw", { [_this select 0] call e_drawMapIcons; }];
