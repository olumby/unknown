/*
 * Perform the jump.
 */

_key = _this select 1;

fn_jumpAnimation = {
    _unit = _this;
    _unit switchMove "AovrPercMrunSrasWrflDf";
};


if (_key in actionKeys "GetOver") then
{
    if (stance player in ["STAND", "CROUCH"]) then
    {
        player spawn {
            [player, "fn_jumpAnimation"] call BIS_fnc_MP;
        };
    };
};
