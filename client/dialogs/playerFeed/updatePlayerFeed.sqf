/*
 * Update the player feed with most recent information.
 *
 * Params: [<message: String/Boolean>]
 */

#include "playerFeed_defines.hpp"
disableSerialization;

_message = [_this, 0, ""] call BIS_fnc_param;

if (count _message > 0) then
{
    1002 cutRsc ["PlayerFeed", "PLAIN", 0, false];

    _display = uiNameSpace getVariable "PlayerFeed";
    _playerFeed = _display displayCtrl player_feed;

    _messages = missionNamespace getVariable ["playerFeedInformation", ["","","","",""]];
    _messages pushBack _message;
    reverse _messages;
    _messages = _messages select [0, 5];
    reverse _messages;

    _displayMessages = [];
    {
        _displayMessages pushBack (parseText ("<t align='right'>" + _x + "</t><br />"));
    } forEach _messages;

    _playerFeed ctrlSetStructuredText (composeText _displayMessages);

    missionNamespace setVariable ["playerFeedInformation", _messages];
};
