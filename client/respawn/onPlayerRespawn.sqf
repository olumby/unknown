/*
 * Executed when player respawns - CmdRespawn
 *
 * Params: [<newUnit: Object>, <oldUnit: Object>, <respawn: Number>, <respawnDelay: Number>]
 */

_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_respawnDelay = [_this,3,0,[0]] call bis_fnc_param;

createDialog "CmdRespawnMenu";
