/*
 * Present the player with the spawn screen.
 */

#include "spawnDialog_defines.hpp"

9999 cutText ["", "BLACK", 0.01];

createDialog "SpawnDialog";

_display = uiNamespace getVariable "UK_SpawnDialog";
_randomButton = _display displayCtrl random_spawn_button;
_locationsSpawnButton = _display displayCtrl spawn_locations_button;
_locationsList = _display displayCtrl spawn_locations_list;

_randomButton buttonSetAction format ["[%1,%2,%3] execVM ""client\functions\spawnPlayer.sqf""", 0, true, []];

_towns = [];
{
    _townName = _x select 1;
    
    _locationsList lbAdd _townName;
} forEach (call spawnLocations);
