// Player
runPlayerHud = compile preprocessFileLineNumbers "client\dialogs\playerHud\runPlayerHud.sqf";

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
fnc_isAdmin = compile preprocessFileLineNumbers "client\functions\fnc_isAdmin.sqf";
openAdminMenu = compile preprocessFileLineNumbers "client\admin\openAdminMenu.sqf";

// Flags
flagFinance = compile preprocessFileLineNumbers "client\flags\flagFinance.sqf";
runFlagCapture = compile preprocessFileLineNumbers "client\dialogs\flagCapture\runFlagCapture.sqf";

// Misc
fnc_formatNumber = compile preprocessFileLineNumbers "client\functions\fnc_formatNumber.sqf";
fnc_drawMapIcons = compile preprocessFileLineNumbers "client\functions\fnc_drawMapIcons.sqf";
