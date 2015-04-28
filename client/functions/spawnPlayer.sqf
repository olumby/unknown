_spawnLocation = (call spawnLocations) call BIS_fnc_selectRandom;

_pos = getMarkerPos (_spawnLocation select 0);
_dir = random 359;
_spawnName = _randomLoc select 2;

_newPos = [(_pos select 0)-10*sin(_dir),(_pos select 1)-10*cos(_dir)];

waitUntil {!isNil "bis_fnc_init" && {bis_fnc_init}};

player setPos _newPos;

closeDialog 0;
9999 cutText ["", "BLACK IN"];
