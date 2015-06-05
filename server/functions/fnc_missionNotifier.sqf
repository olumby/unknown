/*
 * Notify players about mission status.
 *
 * Params: [<type: String>, <name: String>, <position: Position>, <notification: Array>]
 */

_type = [_this, 0, "", [""]] call BIS_fnc_param;
_name = [_this, 1, "", [""]] call BIS_fnc_param;
_pos = [_this, 2, [0,0,0], [[]]] call BIS_fnc_param;
_notification = [_this, 3, [], [[]]] call BIS_fnc_param;

// Set up notification broadcast
bc_notification = _notification;
publicVariable "bc_notification";

// add/remove mission from active array
_bc_activeMissions = missionNamespace getVariable ["bc_activeMissions", []];
_new_bc_activeMissions = switch (_type) do
{
    case "add": { _bc_activeMissions + [_name, _pos] };
    case "remove": { _bc_activeMissions - [_name, _pos] };
    default { _bc_activeMissions };
};

missionNamespace setVariable ["bc_activeMissions", _new_bc_activeMissions]
publicVariable "bc_activeMissions";
