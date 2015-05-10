/*
 * If the player is an admin, open and populate admin store.
 */

if ([player] call isAdmin) then
{
    createDialog "AdminDialog";
    adminDialogOpen = true;
}
else
{
    hint "You are no admin.";
};
