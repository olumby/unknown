/*
 * Change the physical flag when captured.
 *
 * Params: [<side: Side>, <index: Number>]
 */

_side = _this select 0;
_flagIndex = _this select 1;

_flagType = switch (_side) do
{
    case west:
    {
        "Flag_NATO_F";
    };
    case east:
    {
        "Flag_CSAT_F";
    };
    case resistance:
    {
        "Flag_AAF_F";
    };
    case civilian:
    {
        "FlagPole_F";
    };
    default
    {
        "FlagPole_F";
    };
};

deleteVehicle ((flagInformation select _flagIndex) select 2);

_newFlag = createVehicle [_flagType, getMarkerPos ((flagInformation select _flagIndex) select 0), [], 0, "CAN_COLLIDE"];
_newFlag setVariable ["R3F_LOG_disabled", true, true];

(flagInformation select _flagIndex) set [2, _newFlag];

missionNamespace setVariable ["flagInformation", flagInformation];
publicVariable "flagInformation";
