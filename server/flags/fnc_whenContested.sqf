/*
 * When the flag is contested, returns part of possession array.
 *
 * Params: [<previousHolders: Side>, <previousContestors: Side>, <previousCapStartTime: Number>, <previousCapTime: Number>]
 */

#define capture_time 30

_previousHolders = _this select 0;
_previousContestors = _this select 1;
_previousCapStart = _this select 2;
_previousCapTime = _this select 3;

[_previousHolders, _previousContestors, diag_tickTime, _previousCapTime];
