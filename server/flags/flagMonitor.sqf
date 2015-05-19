/*
 * Monitors the flag possession.
 */

 waitUntil { !isNil "flagInformation" };

if (isServer) then
{

    while {true} do
    {
        // the sleep is required to ensure the trigger is set up, also helps reduce load on server.
        sleep 1;
        _flagPossession = [];
        {
            _trigger = _x select 3;
            _triggerPlayers = list _trigger;

            _blues = 0;
            _greens = 0;
            _reds = 0;

            {
                switch (side _x) do
                {
                    case west:
                    {
                        _blues = _blues + 1;
                    };
                    case east:
                    {
                        _reds = _reds + 1;
                    };
                    case resistance:
                    {
                        _greens = _greens + 1;
                    };
                };
            } forEach _triggerPlayers;

            _flagPossession pushBack [_blues, _reds, _greens];

        } forEach flagInformation;

        missionNamespace setVariable ["flagPossession", _flagPossession];
        publicVariable "flagPossession";
    };
};
