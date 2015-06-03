/*
 * Executed when player is killed in singleplayer or in multiplayer mission.
 *
 * Params: [<oldUnit: Object>, <killer: Object>, <respawn: Number>, <respawnDelay: Object>]
 */

// TODO: See onPlayerRespawn.sqf - revive loadout
// Save player loadout
[player, [missionNamespace, "revivalLoadout"]] call BIS_fnc_saveInventory;


waitUntil { !isNull (uiNamespace getVariable "RscDisplayRespawn_display") };
_respawnDisplay = uiNamespace getVariable ["RscDisplayRespawn_display", displayNull];

// Add draw event to respawn map
_respawnEh = (_respawnDisplay displayCtrl 1050) ctrlAddEventHandler ["draw", { [_this select 0] call e_drawMapIcons; }];
// Add respawn position event to ctrl list
_respawnPosEh = (_respawnDisplay displayCtrl 1500) ctrlAddEventHandler ["LBSelChanged", { call e_respawnListChange; }];
