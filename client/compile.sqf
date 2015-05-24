// Player
setupPlayer = compile preprocessFileLineNumbers "client\functions\setupPlayer.sqf";
spawnDialog = compile preprocessFileLineNumbers "client\dialogs\spawnDialog\spawnDialog.sqf";
spawnDialogSelection = compile preprocessFileLineNumbers "client\dialogs\spawnDialog\spawnDialogSelection.sqf";
spawnPlayer = compile preprocessFileLineNumbers "client\functions\spawnPlayer.sqf";
spawnPlayerRandom = compile preprocessFileLineNumbers "client\functions\spawnPlayerRandom.sqf";
spawnPlayerOnLocation = compile preprocessFileLineNumbers "client\functions\spawnPlayerOnLocation.sqf";
gearPlayerUp = compile preprocessFileLineNumbers "client\functions\gearPlayerUp.sqf";
runHud = compile preprocessFileLineNumbers "client\dialogs\hud\runHud.sqf";

// Vehicles
spawnVehicle = compile preprocessFileLineNumbers "client\functions\vehicleSpawn.sqf";

// Vehicle Store
vehicleStoreFilter = compile preprocessFileLineNumbers "client\dialogs\vehicleStore\vehicleStoreFilter.sqf";
vehicleStoreSelection = compile preprocessFileLineNumbers "client\dialogs\vehicleStore\vehicleStoreSelection.sqf";
vehicleStoreVariation = compile preprocessFileLineNumbers "client\dialogs\vehicleStore\vehicleStoreVariation.sqf";
buyVehicle = compile preprocessFileLineNumbers "client\dialogs\vehicleStore\buyVehicle.sqf";

// Gun Store
gunStoreFilter = compile preprocessFileLineNumbers "client\dialogs\gunStore\gunStoreFilter.sqf";
gunStoreSelection = compile preprocessFileLineNumbers "client\dialogs\gunStore\gunStoreSelection.sqf";
gunStoreMainSelection = compile preprocessFileLineNumbers "client\dialogs\gunStore\gunStoreMainSelection.sqf";
gunStoreChangeQty = compile preprocessFileLineNumbers "client\dialogs\gunStore\gunStoreChangeQty.sqf";
buyWeapons = compile preprocessFileLineNumbers "client\dialogs\gunStore\buyWeapons.sqf";

// Admin
isAdmin = compile preprocessFileLineNumbers "client\functions\isAdmin.sqf";
openAdminMenu = compile preprocessFileLineNumbers "client\admin\openAdminMenu.sqf";

// Flags
flagFinance = compile preprocessFileLineNumbers "client\flags\flagFinance.sqf";
runFlagCapture = compile preprocessFileLineNumbers "client\dialogs\flagCapture\runFlagCapture.sqf";
