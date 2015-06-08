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

createDialog "CmdRespawnMenu";

_display = uiNamespace getVariable "CmdRespawnMenu";
_respawnMap = _display displayCtrl respawn_map;
_respawnList = _display displayCtrl respawn_list;

waitUntil { !isNil "activeSpawnPoints" };

while { true } do
{
    lnbClear _respawnList;

    {
        if ((_x select 0) == playerSide || (_x select 0) == civilian) then
        {
            _picture = switch (typeName (_x select 1)) do
            {
                case (typeName ""): { "" };
                case (typeName objNull): { getText (configFile >> "cfgVehicles" >> typeOf (_x select 1) >> "picture") };
            };
            _row = _respawnList lnbAddRow ["", (_x select 2)];
            _respawnList lnbSetPicture[[_row,0], _picture];
        };
    } forEach activeSpawnPoints;

    sleep 1;
};

// _ctrlMap ctrlmapanimadd [_commitTime,(_mapScaleW max _mapScaleH) * 2,[_posX,_posY]];
// ctrlmapanimcommit _ctrlMap;
