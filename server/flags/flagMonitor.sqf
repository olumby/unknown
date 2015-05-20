/*
 * Monitors the flag possession.
 */

 waitUntil { !isNil "flagInformation" };

if (isServer) then
{
    sleep 1; // required to ensure the trigger is set up
    while {true} do
    {
        _previousFlagProssession = missionNamespace getVariable ["flagPossession", []];
        _flagPossession = [];
        {
            _trigger = _x select 3;
            _triggerPlayers = list _trigger;
            _blues = 0; _reds = 0; _greens = 0;

            {
                switch (side _x) do
                {
                    case west: { _blues = _blues + 1; };
                    case east: { _reds = _reds + 1; };
                    case resistance: { _greens = _greens + 1; };
                };
            } forEach _triggerPlayers;

            _tick = 0;
            _currentTick = 0;
            if ( count _previousFlagProssession > 0 ) then
            {
                _previousTick = (_previousFlagProssession select _forEachIndex) select 3;
                _tick = _previousTick;

                if ( _blues > _reds && _blues > _greens ) then
                {
                    diag_log "Capping Blue";

                    if (_previousTick > 0) then
                    {
                        _tickTime = diag_tickTime - _previousTick;
                        diag_log (str _tickTime);
                        _currentTick = _tickTime;
                    }
                    else
                    {
                        _tick = diag_tickTime;
                    };
                };
            };

            //  blue    op     indi     current holders             contestors                  cap start   cap time
            // [_blues, _reds, _greens, west/east/resistance/empty, west/east/resistance/empty, _startTick, _currentTick]

            _flagPossession pushBack [_blues, _reds, _greens, _tick, _currentTick];
        } forEach flagInformation;

        missionNamespace setVariable ["flagPossession", _flagPossession];
        publicVariable "flagPossession";

        sleep 0.5;
    };
};
