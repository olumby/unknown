/*
 * Set up the game flags.
 */

if (isServer) then
{
    _flagSites = (call flagSites);
    _matchFlags = (_flagSites select (floor (random (count _flagSites))));

    _groupName = _matchFlags select 0;
    _flags = _matchFlags select 1;

    _flagInformation = [];
    {
        _innerName = format ["%1_inner", _x select 3];
        _innerMarker = createMarker [_innerName, _x select 0];
        _innerMarker setMarkerShape "ELLIPSE";
        _innerMarker setMarkerBrush "Border";
        _innerMarker setMarkerSize [_x select 1, _x select 1];
        _innerMarker setMarkerColor "ColorPink";

        _outerName = format ["%1_outer", _x select 3];
        _outerMarker = createMarker [_outerName, _x select 0];
        _outerMarker setMarkerShape "ELLIPSE";
        _outerMarker setMarkerBrush "Border";
        _outerMarker setMarkerSize [_x select 2, _x select 2];
        _outerMarker setMarkerColor "ColorCIV";

        _iconName = format ["%1_icon", _x select 3];
        _iconMarker = createMarker [_iconName, _x select 0];
        _iconMarker setMarkerShape "ICON";
        _iconMarker setMarkerType "mil_flag";
        _iconMarker setMarkerSize [1, 1];
        _iconMarker setMarkerColor "ColorWhite";
        _iconMarker setMarkerText (_x select 3);

        _flagPole = createVehicle ["FlagPole_F", _x select 0, [], 0, "NONE"];
        _flagPole allowDamage false;

        _flagTrigger = createTrigger ["EmptyDetector", _x select 0, true];
        _flagTrigger setTriggerArea [_x select 1, _x select 1, 0, false];
        _flagTrigger setTriggerActivation ["ANY", "PRESENT", true];
        _flagTrigger setTriggerStatements ["this", "", ""];

        _flagInformation pushBack [_innerMarker, _outerMarker, _flagPole, _flagTrigger, _x select 3];
    } forEach _flags;

    missionNamespace setVariable ["flagInformation", _flagInformation];
    publicVariable "flagInformation";

    [] execVM "server\flags\flagMonitor.sqf";
};
