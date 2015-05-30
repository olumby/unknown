/*
 * Draw icons above players ingame.
 */

{
    _iconPlayer = "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa";
    _iconGroup = "\A3\ui_f\data\igui\cfg\islandmap\iconselect_ca.paa";
    _color = call playerColor;

    if (side _x == playerSide) then
    {
        if ((crew (vehicle _x) select 0) == _x) then
        {
            if (vehicle _x == player) exitWith {};

            _distance = _x distance (positionCameraToWorld [0,0,0]);

            // too far away
            if (_distance > 200) exitWith {};

            _icon = getText (configFile >> "CfgVehicles" >> typeOf (vehicle _x) >> "icon");
            if (_icon == "") then { _icon == "iconMan" };
            //_pos = _x modelToWorldVisual [0,0,1.3];
            _mempoint = if (vehicle _x == _x) then {"head" } else {"engine"};
            _pos = _x selectionPosition _mempoint;
            _pos set [2, (_pos select 2) + 0.3];
            _pos = ((vehicle _x) modelToWorld (_pos));
            if (not(count _pos == 3)) exitWith {};

            _size = (1 - ((_distance / 200) * 0.5)) * 0.5;

            drawIcon3D [
                _icon, (call westColor), _pos,
                _size,
                _size,
                45,
                name (vehicle _x),
                1,
                0.03,
                "Purista"
            ];
        };
    };
} forEach allUnits;
