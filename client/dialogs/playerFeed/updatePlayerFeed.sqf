/*
 * Update the player feed with most recent information.
 *
 * Params: [<message: String>]
 */

#include "playerFeed_defines.hpp"
disableSerialization;

_message = [_this, 0, "", [""]] call BIS_fnc_param;

1002 cutRsc ["PlayerFeed", "PLAIN", 0, false];
_display = uiNameSpace getVariable "PlayerFeed";
_playerFeed = _display displayCtrl player_feed;

_messages = missionNamespace getVariable ["playerFeedInformation", []];

_newMessages = [];
{
    if !(time - (_x select 1) > 10) then { _newMessages pushBack _x };
} forEach _messages;

// Add new message
if (count _message > 0) then { _newMessages pushBack [_message, time] };

reverse _newMessages;
_newMessages = _newMessages select [0, 5];
reverse _newMessages;

missionNamespace setVariable ["playerFeedInformation", _newMessages];

_feedComposition = [];
if (count _newMessages < 5) then
{
    for "_i" from 1 to (5 - (count _newMessages)) do { _feedComposition pushBack lineBreak };
};
{
    _feedComposition pushBack (parseText ("<t align='right'>" + (_x select 0) + "</t><br />"));
} forEach _newMessages;

_playerFeed ctrlSetStructuredText (composeText _feedComposition);
