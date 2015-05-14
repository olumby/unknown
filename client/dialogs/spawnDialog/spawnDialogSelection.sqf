/*
 * Called when a spawn location is selected from the list.
 */

#include "spawnDialog_defines.hpp"

_display = uiNamespace getVariable "UK_SpawnDialog";
_locationsSpawnButton = _display displayCtrl spawn_locations_button;
_locationsList = _display displayCtrl spawn_locations_list;

_selectedLocation = lbCurSel _locationsList;
_spawnData = [_locationsList lbText _selectedLocation, _locationsList lbData _selectedLocation];

_locListBtnAction = format ["[%1,%2,%3] execVM ""client\functions\spawnPlayer.sqf""", 1, true, _spawnData];

_locationsSpawnButton buttonSetAction _locListBtnAction;
_locationsSpawnButton ctrlEnable true;
