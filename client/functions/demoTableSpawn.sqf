_tp = _this select 0;
_caller = _this select 1;
_id = _this select 2;
_pos = _this select 3;
_dir = random 359;

_tp = _caller setPos [(_pos select 0)-10*sin(_dir),(_pos select 1)-10*cos(_dir)];  
