/*
 * Arguments
 *     int       spawn type (random,town,halo)
 *     boolean   gear up (give player a load out)
 *     array     spawn data (location, name)
 */

_spawnType = _this select 0
_gearUp = _this select 1

["Unknown", _gearUp] spawn BIS_fnc_infoText;


if (_gearUp)
{
    call gearPlayerUp;
}

switch (_spawnType) do
{
    case 1: { 
        //_data call spawnOnLocation;
    };
    case 2: {
        //_data call spawnHalo;
    };
    default {
        call spawnPlayerRandom;
    };
};

closeDialog 0;
9999 cutText ["", "BLACK IN"];
