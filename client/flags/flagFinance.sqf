/*
 * Monitors the player flag activity for passive payouts.
 */

waitUntil { !isNil "flagPossession" };

while {true} do
{
    _curTime = time;
    _lastPay = player getVariable ["lastPayTime", (_curTime - (call flagPayoutTime))];

    if( _curTime >= _lastPay + (call flagPayoutTime)) then
    {
        if( player getVariable ["inFlagZone", false] || player getVariable ["inOuterFlagZone", false] ) then
        {
            _flagIndex = player getVariable ["flagIndex", 0];
            _flagPossession = flagPossession select _flagIndex;
            if (_flagPossession select 3 == playerSide) then
            {
                ["flag_defence", (call moneyFlagDefence)] call fnc_rewardPlayer;
            };

            if (player getVariable ["inOuterFlagZone", false] && player getVariable ["inFlagZone", false] && _flagPossession select 3 != playerSide) then
            {
                ["flag_attack", (call moneyFlagAttack)] call fnc_rewardPlayer;
            };
        };

        player setVariable ["lastPayTime", _curTime];
    };
};
