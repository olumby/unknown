_tp = _this select 0;
_pos = _this select 3;
_dir = random 359;

spawnPosition = [(_pos select 0)-10*sin(_dir),(_pos select 1)-10*cos(_dir)];

player setPos _newPos findEmptyPosition;  

9999 cutText ["", "BLACK IN"];


// _tp = _this select 0;
// _caller = _this select 1;
// _pos = _this select 3;
// _dir = random 359;

// _newPos = [(_pos select 0)-10*sin(_dir),(_pos select 1)-10*cos(_dir)];

// _tp = _caller setPos _newPos findEmptyPosition;  
