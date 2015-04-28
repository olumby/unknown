9999 cutText ["", "BLACK", 0.01];

createDialog "SpawnDialog";

((uiNamespace getVariable "UK_SpawnDialog") displayCtrl 1801) buttonSetAction format ["%1 execVM ""client\functions\spawnPlayer.sqf""", getMarkerPos "spawn_001"];


// _display = uiNamespace getVariable "UK_SpawnDialog";
// //_display displayAddEventHandler ["KeyDown", "(respawnDialogActive && _this select 1 == 1)"];
// _randomButton = _display displayCtrl random_Spawn_Button;
// _otherButton = _display displayCtrl otherButton;

// _otherButton ctrlEnable false;


// _randomButton ctrlSetText "Spawn"
// _randomButton buttonSetAction format ["[%1] execVM 'client\functions\spawnPlayer.sqf'", getMarkerPos "spawn_001"];
