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

        _flagPole = createVehicle ["FlagPole_F", _x select 0, [], 0, "NONE"];
        _flagPole allowDamage false;

        _flagInnerTrigger = createTrigger ["EmptyDetector", _x select 0, true];
        _flagInnerTrigger setTriggerArea [_x select 1, _x select 1, 0, false];
        _flagInnerTrigger setTriggerActivation ["ANY", "PRESENT", true];
        _flagInnerTrigger setTriggerStatements ["this", "", ""];

        _flagOuterTrigger = createTrigger ["EmptyDetector", _x select 0, true];
        _flagOuterTrigger setTriggerArea [_x select 2, _x select 2, 0, false];
        _flagOuterTrigger setTriggerActivation ["ANY", "PRESENT", true];
        _flagOuterTrigger setTriggerStatements ["this", "", ""];

        _flagInformation pushBack [_innerMarker, _outerMarker, _flagPole, _flagInnerTrigger, _flagOuterTrigger, _x select 3];
    } forEach _flags;

    missionNamespace setVariable ["flagInformation", _flagInformation];
    publicVariable "flagInformation";

    [] spawn flagMonitor;
};
