/*
 * Event handler for "MPKilled".
 *
 * Params: [<unit: Object>, <killer: Object>]
 */

waitUntil { !isNil "flagPossession" };

_unit = _this select 0;
_killer = _this select 1;

if ( _killer == player && _unit != player && (player getVariable ["inOuterFlagZone", false]) ) then
{
    _flagIndex = player getVariable ["flagIndex", 0];
    _flagPossession = flagPossession select _flagIndex;

    if (_flagPossession select 3 == playerSide) then
    {
        ["flag_defence_kill", (call moneyFlagDefKill)] call fnc_rewardPlayer;
    }
    else
    {
        ["flag_attack_kill", (call moneyFlagAtkKill)] call fnc_rewardPlayer;
    };
};
