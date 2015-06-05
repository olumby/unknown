/*
 * add event handlers.
 */

// Set up key bindings
[] spawn
{
    waitUntil { !isNull (findDisplay 46); };
    (findDisplay 46) displayAddEventHandler ["KeyDown", e_keyDown];
};

// Draw Map Icons
[] spawn
{
    waitUntil { !isNull (findDisplay 12); };
    _mainEh = ((findDisplay 12) displayCtrl 51) ctrlAddEventHandler ["draw", { [_this select 0] call e_drawMapIcons; }];
    waitUntil { !isNull (uiNamespace getVariable ["RscMiniMap", displayNull]); };
    _gpsEh = ((uiNamespace getVariable ["RscMiniMap", displayNull]) displayCtrl 101) ctrlAddEventHandler ["draw", { [_this select 0] call e_drawMapIcons; }];
};

// Draw 3d Icons
[] spawn
{
    _playerIconsEh = addMissionEventHandler ["Draw3D", { call e_drawPlayerIcons } ];
};

// Add kill event handler
player addMPEventHandler ["MPKilled", { call e_playerKilled } ];

// Locked ammo boxes event handler
// TODO: Find way to lock rearm options
player addEventHandler ["InventoryOpened", { call e_lockedInventory }];
player addEventHandler ["Take", { call e_lockedInventory }];


// Public variable events.
