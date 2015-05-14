/*
 * Present the player with the spawn screen.
 */

#include "spawnDialog_defines.hpp"

9999 cutText ["", "BLACK", 0.01];

createDialog "SpawnDialog";
spawnDialogOpen = true;

_display = uiNamespace getVariable "UK_SpawnDialog";
_display displayAddEventHandler ["KeyDown", "if (spawnDialogOpen && _this select 1 == 1) then { true }"];

_randomButton = _display displayCtrl random_spawn_button;
_locationsSpawnButton = _display displayCtrl spawn_locations_button;
_locationsList = _display displayCtrl spawn_locations_list;

_randomButton buttonSetAction format ["[%1,%2,%3] execVM ""client\functions\spawnPlayer.sqf""", 0, true, []];
_locationsSpawnButton ctrlEnable false;

{
    _spawnMarker = _x select 0;
    _spawnName = _x select 1;

    _location = _locationsList lbAdd _spawnName;
    _locationsList lbSetData [_location, _spawnMarker];
} forEach (call spawnLocations);
