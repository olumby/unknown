/*
 * Change the physical flag when captured.
 * Args:
 *     side       side to change to
 *     number     the index of the flag to change
 */

#define capture_time 30

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

newFlag = createVehicle [_flagType, getMarkerPos ((flagInformation select _flagIndex) select 0), [], 0, "CAN_COLLIDE"];

(flagInformation select _flagIndex) set [2, newFlag];

missionNamespace setVariable ["flagInformation", flagInformation];
publicVariable "flagInformation";
