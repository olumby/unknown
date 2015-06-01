/*
 * Draw icons above players ingame.
 */

fnc_vehicleIcon =
{
    _object = _this select 0;

    switch (true) do
    {
        case (_object isKindOf "Man"):
        {
            "\a3\ui_f\data\map\Markers\NATO\b_inf.paa";
        };
        case (_object isKindOf "Tank"):
        {
            "\a3\ui_f\data\map\Markers\NATO\b_armor.paa";
        };
        case (_object isKindOf "Land"):
        {
            "\a3\ui_f\data\map\Markers\NATO\b_motor_inf.paa";
        };
        case (_object isKindOf "Plane"):
        {
            "\a3\ui_f\data\map\Markers\NATO\b_plane.paa";
        };
        case (_object isKindOf "Air"):
        {
            "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
        };
        case (_object isKindOf "Ship"):
        {
            "\a3\ui_f\data\map\Markers\NATO\b_naval.paa";
        };
        default
        {
            "\a3\ui_f\data\map\Markers\NATO\b_unknown.paa";
        };
    };
};

{
    _iconPlayer = "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa";
    _iconGroup = "\A3\ui_f\data\igui\cfg\islandmap\iconselect_ca.paa";
    _color = call playerColor;

    if (side _x == playerSide) then
    {
        if ((crew (vehicle _x) select 0) == _x) then
        {
            // Player doesn't need an icon.
            if (_x == player) exitWith {};

            // Don't draw icons for far away players unless targeted
            _distance = _x distance (positionCameraToWorld [0,0,0]);
            if (_distance > (call friendlyTagDrawDistance) && vehicle _x != cursorTarget) exitWith {};

            _icon = [vehicle _x] call fnc_vehicleIcon;

            _name = if (cursorTarget == vehicle _x && _distance < (call friendlyNameTagDrawDistance)) then { name (vehicle _x) } else { "" };

            _mempoint = if (vehicle _x == _x) then {"head" } else {"engine"};
            _pos = _x selectionPosition _mempoint;
            _pos set [2, (_pos select 2) + 0.7];
            _pos = ((vehicle _x) modelToWorld (_pos));

            _color = [playerSide] call fnc_colorForSide;

            _iconSize = 0.6 * (1 - (_distance / (call friendlyTagDrawDistance))) max 0.4 min 0.6;
            _fontSize = 0.03 * (1 - (_distance / (call friendlyNameTagDrawDistance))) max 0.025 min 0.03;

            drawIcon3D [_icon, _color, _pos, _iconSize, _iconSize, 0, _name, 1, _fontSize, "Purista"];
        };
    };
} forEach allUnits;
