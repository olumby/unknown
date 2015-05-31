/*
 * Returns the colour used for a side
 *
 * Params: [<side: Side>]
 */

_side = [_this, 0, west] call BIS_fnc_param;

switch (_side) do
{
    case west:
    {
        call westColor;
    };
    case east:
    {
        call eastColor;
    };
    case resistance:
    {
        call resistanceColor;
    };
    case civilian:
    {
        call playerColor;
    };
    default
    {
        call playerColor;
    };
};
