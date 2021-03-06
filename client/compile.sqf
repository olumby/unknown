// Player
runPlayerHud = compile preprocessFileLineNumbers "client\dialogs\playerHud\runPlayerHud.sqf";
updatePlayerFeed = compile preprocessFileLineNumbers "client\dialogs\playerFeed\updatePlayerFeed.sqf";

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

// Cash Machine
openCashMachine = compile preprocessFileLineNumbers "client\dialogs\cashMachine\openCashMachine.sqf";
performTransaction = compile preprocessFileLineNumbers "client\dialogs\cashMachine\performTransaction.sqf";

// Admin
openAdminMenu = compile preprocessFileLineNumbers "client\admin\openAdminMenu.sqf";

// Flags
flagFinance = compile preprocessFileLineNumbers "client\flags\flagFinance.sqf";
runFlagCapture = compile preprocessFileLineNumbers "client\dialogs\flagCapture\runFlagCapture.sqf";

// Functions
fnc_isAdmin = compile preprocessFileLineNumbers "client\functions\fnc_isAdmin.sqf";
fnc_formatNumber = compile preprocessFileLineNumbers "client\functions\fnc_formatNumber.sqf";
fnc_haloJump = compile preprocessFileLineNumbers "client\functions\fnc_haloJump.sqf";
fnc_colorForSide = compile preprocessFileLineNumbers "client\functions\fnc_colorForSide.sqf";
fnc_adjustPlayerMoney = compile preprocessFileLineNumbers "client\functions\fnc_adjustPlayerMoney.sqf";
fnc_rewardPlayer = compile preprocessFileLineNumbers "client\functions\fnc_rewardPlayer.sqf";
fnc_addMapIcons = compile preprocessFileLineNumbers "client\functions\fnc_addMapIcons.sqf";
fnc_addActions = compile preprocessFileLineNumbers "client\functions\fnc_addActions.sqf";

// Events
registerEvents = compile preprocessFileLineNumbers "client\events\registerEvents.sqf";
e_drawMapIcons = compile preprocessFileLineNumbers "client\events\e_drawMapIcons.sqf";
e_drawPlayerIcons = compile preprocessFileLineNumbers "client\events\e_drawPlayerIcons.sqf";
e_keyDown = compile preprocessFileLineNumbers "client\events\e_keyDown.sqf";
e_playerKilled = compile preprocessFileLineNumbers "client\events\e_playerKilled.sqf";
e_lockedInventory = compile preprocessFileLineNumbers "client\events\e_lockedInventory.sqf";
e_pvarMissionNotification = compile preprocessFileLineNumbers "client\events\e_pvarMissionNotification.sqf";
