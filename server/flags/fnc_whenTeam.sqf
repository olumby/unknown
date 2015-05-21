/*
 * When a term holds possession of a flag, returns part of possession array.
 * Args:
 *     side       previous loops flag holders
 *     side       previous loops contesting flag holders
 *     number     previous loops capture start time
 *     number     previous loops capture time
 *     side       players side
 *     number     index of flag being captured
 */

#define capture_time 30

_previousHolders = _this select 0;
_previousContestors = _this select 1;
_previousCapStart = _this select 2;
_previousCapTime = _this select 3;
_side = _this select 4;
_flagIndex = _this select 5;

switch (true) do
{
    case (_previousCapStart != 0 && _previousCapTime <= capture_time && _previousContestors == _side):
    {
        _currentSide = _previousHolders;
        _contestors = _side;
        _capStart = _previousCapStart;
        _capTime = diag_tickTime - _previousCapStart;
        [_currentSide, _contestors, _capStart, _capTime];
    };
    case ( (_previousCapStart != 0 && _previousCapTime > capture_time) || _previousHolders == _side ):
    {
        _currentSide = _side;
        _contestors = civilian;
        _capTime = 0;
        _capStart = 0;

        if (_previousHolders != _side) then
        {
            [_side, _flagIndex] call fnc_changeFlag;
        };

        [_currentSide, _contestors, _capStart, _capTime];
    };
    default
    {
        _currentSide = _previousHolders;
        _contestors = _side;
        _capStart = diag_tickTime;
        _capTime = 0;
        [_currentSide, _contestors, _capStart, _capTime];
    };
};
