/*
 * Sets a unit off on a HALO Jump.
 *
 * Params: [<unit: Object>, <pullAltitude: Number>, <useChem: Boolean>, <useSmoke: Boolean>]
 */

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_pullAltitude = [_this, 1, 150, [0]] call BIS_fnc_param;
_useChem = [_this, 2, false, [true]] call BIS_fnc_param;
_useSmoke = [_this, 3, false, [true]] call BIS_fnc_param;

if (_useChem) then
{
    [_unit] spawn
    {
        _unit = _this select 0;
        _chem = "chemlight_red" createVehicle [0,0,0];
        _chem attachTo [_unit, [-0.05,-0.2,-0.014], "lfemur"];

        // when in chute
        waitUntil { animationState _unit == "para_pilot" };
        _chem attachTo [vehicle _unit, [-0.05,-0.2,-0.014], "lfemur"];

        // when ~20m from ground
        waitUntil { ((getPosATL _unit) select 2) < 20 };
        detach _chem;
        deleteVehicle _chem;
    };
};

if (_useSmoke) then
{
    [_unit] spawn
    {
        _unit = _this select 0;
        _smoke = "SmokeShellRed" createVehicle [0,0,0];
        _smoke attachTo [_unit, [-0.05,-0.2,0], "lfemur"];

        // when in chute
        waitUntil { animationState _unit == "para_pilot" };
        detach _smoke;
        deleteVehicle _smoke;
    };
};

// when ~135m from ground
waitUntil { ((getPosATL _unit) select 2) < _pullAltitude };
_chute = createVehicle ["Steerable_Parachute_F", getPos _unit, [], getDir _unit, "FLY"];
_chute setPos (getPos _unit);
_unit assignAsDriver _chute;
_unit moveIndriver _chute;
