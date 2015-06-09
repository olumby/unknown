/*
 * Executed when player respawns - CmdRespawn
 *
 * Params: [<newUnit: Object>, <oldUnit: Object>, <respawn: Number>, <respawnDelay: Number>]
 */

#include "dialog\respawnMenu_defines.hpp"
disableSerialization;

_unit = [_this,0,objnull,[objnull]] call bis_fnc_param;
_respawnDelay = [_this,3,0,[0]] call bis_fnc_param;

cutText ["","black out",0.01];
_unit enableSimulation false;
_unit setVariable ["playerIsSpawning", true];

createDialog "CmdRespawnMenu";

_display = uiNamespace getVariable "CmdRespawnMenu";
_respawnMap = _display displayCtrl respawn_map;
_respawnList = _display displayCtrl respawn_list;
_respawnButton = _display displayCtrl respawn_button;

_respawnList ctrlAddEventHandler ["LBSelChanged",
{
    diag_log (activeSpawnPoints select (_this select 1));
    // _ctrlMap ctrlmapanimadd [_commitTime,(_mapScaleW max _mapScaleH) * 2,[_posX,_posY]];
    // ctrlmapanimcommit _ctrlMap;

}];

waitUntil { !isNil "activeSpawnPoints" };

while { true } do
{
    lnbClear _respawnList;
    _respawnButton ctrlEnable false;

    {
        if ((_x select 0) == playerSide || (_x select 0) == civilian) then
        {
            _picture = switch (_x select 3) do
            {
                case "town": { "assets\image\spawnInf.paa" };
                case "heli": { "assets\image\spawnHeli.paa" };
                case "halo": { "assets\image\spawnPara.paa" };
                default { "assets\image\spawnInf.paa" };
            };
            _row = _respawnList lnbAddRow ["", (_x select 2)];
            _respawnList lnbSetPicture [[_row,0], _picture];
        };
    } forEach activeSpawnPoints;

    if ( ((lnbSize _respawnList) select 0 > 0) && (lnbCurSelRow _respawnList == -1) ) then { _respawnList lnbSetCurSelRow 0 };
    if (lnbCurSelRow _respawnList != -1) then { _respawnButton ctrlEnable true };

    sleep 1;
};
