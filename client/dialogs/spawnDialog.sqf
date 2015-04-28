9999 cutText ["", "BLACK", 0.01];

createDialog "SpawnDialog";

((uiNamespace getVariable "UK_SpawnDialog") displayCtrl 1801) buttonSetAction format ["[%1,%2,%3] execVM ""client\functions\spawnPlayer.sqf""", 0, true, []];


// _display = uiNamespace getVariable "UK_SpawnDialog";
// _randomButton = _display displayCtrl 1801;
