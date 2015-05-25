/*
 * Runs every time the player spawns.
 */

player enableFatigue false;

enableSentences false;

removeAllWeapons player;
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

switch (side player) do
{
    case west:
    {
        player unassignItem "NVGoggles";
        player removeItem "NVGoggles";
    };
    case east:
    {
        player unassignItem "NVGoggles_OPFOR";
        player removeItem "NVGoggles_OPFOR";
    };
    case resistance:
    {
        player unassignItem "NVGoggles_INDEP";
        player removeItem "NVGoggles_INDEP";
    };
};

//[] spawn spawnDialog;
