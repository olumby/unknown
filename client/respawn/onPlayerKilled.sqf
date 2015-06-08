/*
 * Executed when player is killed - CmdRespawn
 *
 * Params: [<unit: Object>, <killer: Object>, <respawn: Number>, <respawnDelay: Object>]
 */

_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_respawnDelay = [_this,3,0,[0]] call bis_fnc_param;

cutText ["","black out",0.5];
