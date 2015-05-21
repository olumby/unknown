/*
 * When the flag is empty, returns part of possession array.
 * Args:
 *     side       previous loops flag holders
 *     side       previous loops contesting flag holders
 *     number     previous loops capture start time
 *     number     previous loops capture time
 */

#define capture_time 30

_previousHolders = _this select 0;
_previousContestors = _this select 1;
_previousCapStart = _this select 2;
_previousCapTime = _this select 3;

[_previousHolders, civilian, 0, 0];
