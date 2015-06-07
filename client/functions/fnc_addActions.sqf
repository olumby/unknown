/*
* Adds player actions on respawn.
 *
 * Params: [<player: Object>]
 */

_player = _this select 0;

// ATM
_atmCondition = "({ ((str _x) find ': atm_') > 0 } count (nearestObjects [_this, [], 2])) > 0";
_player addAction ["Use ATM", { call openCashMachine }, [], 1.5, true, true, "", _atmCondition];
