/*
 * Returns a formatted number as a string.
 * Args:
 *     number     the number to be formatted.
 */

_number = _this select 0;

_arr = _number call BIS_fnc_numberDigits;
_count = count _arr;

_return = "";
{
    _return = _return + (str _x);
    if ( (_forEachIndex - (_count - 1 % 3)) % 3 == 0 && _forEachIndex != (_count - 1) ) then { _return = _return + " "; };
} forEach _arr;

_return;
