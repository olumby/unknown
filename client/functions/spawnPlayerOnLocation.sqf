/*
 * Spawn a player on a provided marker.
 * Args:
 *     string    spawn name
 *     string    marker name
 */

_pos = getMarkerPos (_this select 1);
_dir = random 359;
_spawnName = _this select 0;

_newPos = [(_pos select 0)-10*sin(_dir),(_pos select 1)-10*cos(_dir)];

waitUntil {!isNil "bis_fnc_init" && {bis_fnc_init}};

player setPos _newPos;

[_spawnName] spawn BIS_fnc_infoText;
