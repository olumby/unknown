/*
 * Adds icons to the map.
 *
 * Params: [<map: Control>, <positions: Array>, <isStore: Boolean>, <icon: String>, <size: Number>]
 */

_map = [_this, 0, controlNull] call BIS_fnc_param;
_positions = [_this, 1, []] call BIS_fnc_param;
_isStore = [_this, 2, false] call BIS_fnc_param;
_icon = [_this, 3, ""] call BIS_fnc_param;
_size = [_this, 4, 30] call BIS_fnc_param;

_missionStr = (str missionConfigFile);
_dirPath = _missionStr select [0, (count _missionStr) - 15];

{
    _pos = if (_isStore) then
    {
        _marker = format ["%1_label", _x];
        getMarkerPos _marker;
    }
    else
    {
        _x
    };

    _map drawIcon [(_dirPath + _icon), [1,1,1,1], _pos, _size, _size, 0];
} forEach _positions;
