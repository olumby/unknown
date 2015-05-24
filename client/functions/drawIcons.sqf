/*
 * Draw icons to players map.
 */

fnc_drawIcons =
{
    _map = _this select 0;

    {
        _icon = "\A3\ui_f\data\igui\cfg\islandmap\iconplayer_ca.paa";
        _color = [0,0,1,1];

        if (side _x == side player) then
        {
            if ((crew (vehicle _x) select 0) == _x) then
            {
                // if ((configFile >> "CfgVehicles" >> typeOf(vehicle _x) >> "icon") != "") then
                // {
                //     _icon = getText (configFile >> "CfgVehicles" >> (vehicle _x) >> "icon");
                // };
                if (_x == player) then
                {
                    _color = [1,1,1,1];
                };

                _map drawIcon [
                    _icon,
                    _color,
                    getPos (vehicle _x),
                    24,
                    24,
                    getDir (vehicle _x)
                ];
            };
        };
    } forEach allUnits;



    if (vehicle player != player) then
    {
        _icon = getText (configFile >> "cfgVehicles" >> (vehicle player) >> "icon");
    };



};

_eh = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["Draw", fnc_drawIcons];
