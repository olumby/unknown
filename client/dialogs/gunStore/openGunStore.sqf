/*
 * Open the gun store, should be called from addAction.
 * Args:
 *     string    store name
 */

uiNamespace setVariable ["storeName", _this select 3 select 0];

#include "gunStore_defines.hpp"

createDialog "GunStore";
gunStoreDialogOpen = true;

_display = uiNamespace getVariable "UK_GunStoreDialog";
