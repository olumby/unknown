/*
 * Present the player with the spawn screen.
 */

#include "spawnDialog_defines.hpp"

9999 cutText ["", "BLACK", 0.01];

createDialog "SpawnDialog";

_display = uiNamespace getVariable "UK_SpawnDialog";
_randomButton = _display displayCtrl random_spawn_button;

_randomButton buttonSetAction format ["[%1,%2,%3] execVM ""client\functions\spawnPlayer.sqf""", 0, true, []];
