/*
 * Get a player ready for spawn, then hand off to appropriate function. 
 * Args:
 *     int       spawn type (random,town,halo)
 *     boolean   gear up (give player a load out)
 *     array     spawn data (location, name)
 */

_spawnType = _this select 0;
_gearUp = _this select 1;
_spawnData = _this select 2;

if (_gearUp) then
{
    call gearPlayerUp;
};

switch (_spawnType) do
{
    case 1: { 
        _spawnData call spawnPlayerOnLocation;
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
