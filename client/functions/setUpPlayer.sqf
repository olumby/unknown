/*
 * Runs every time the player spawns.
 */

// TODO: Adjust position, this needs serious work and extracting to another file
// Check the type of spawn, etc.. maybe change gear depending on type of spawn..
_list = player nearRoads 200;
_roadToMove = _list select (floor (random (count _list)));
player setPos (getPos _roadToMove);

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

call gearPlayerUp;
