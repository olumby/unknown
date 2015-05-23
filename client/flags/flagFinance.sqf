/*
 * Monitors the player flag activity for passive payouts.
 */

#define payout_time 40

while {true} do
{
    _curTime = time;
    _lastPay = player getVariable ["lastPayTime", _curTime - payout_time];

    if( _curTime >= _lastPay + payout_time ) then
    {
        if( player getVariable ["inFlagZone", false] || player getVariable ["inOuterFlagZone", false] ) then
        {
            systemChat "I'm in zone: ";

            switch (true) do
            {
                case (player getVariable ["inOuterFlagZone", false] && player getVariable ["inFlagZone", false]):
                {
                    systemChat "Inner";
                };
                case (player getVariable ["inOuterFlagZone", false]):
                {
                    systemChat "Outer";
                };
            };
        };

        player setVariable ["lastPayTime", _curTime];
    };
};
