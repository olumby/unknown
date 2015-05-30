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

            _icon = switch (true) do
            {
                case (vehicle _x isKindOf "Man"):
                {
                    "\a3\ui_f\data\map\Markers\NATO\b_inf.paa";
                };
                case (vehicle _x isKindOf "Tank"):
                {
                    "\a3\ui_f\data\map\Markers\NATO\b_armor.paa";
                };
                case (vehicle _x isKindOf "Land"):
                {
                    "\a3\ui_f\data\map\Markers\NATO\b_motor_inf.paa";
                };
                case (vehicle _x isKindOf "Plane"):
                {
                    "\a3\ui_f\data\map\Markers\NATO\b_plane.paa";
                };
                case (vehicle _x isKindOf "Air"):
                {
                    "\a3\ui_f\data\map\Markers\NATO\b_air.paa";
                };
                case (vehicle _x isKindOf "Ship"):
                {
                    "\a3\ui_f\data\map\Markers\NATO\b_naval.paa";
                };
                default
                {
                    "\a3\ui_f\data\map\Markers\NATO\b_unknown.paa";
                };
            };

            _name = if (cursorTarget == vehicle _x) then { name (vehicle _x) } else { "" };

            _mempoint = if (vehicle _x == _x) then {"head" } else {"engine"};
            _pos = _x selectionPosition _mempoint;
            _pos set [2, (_pos select 2) + 0.7];
            _pos = ((vehicle _x) modelToWorld (_pos));

            drawIcon3D [_icon, (call westColor), _pos, 0.6, 0.6, 0, _name, 1, 0.03, "Purista"];
        };
    };
} forEach allUnits;
