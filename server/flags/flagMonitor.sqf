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

            _currentSide = civilian;
            _contestors = civilian;
            _capStart = 0;
            _capTime = 0;
            if ( count _previousFlagProssession > 0 ) then
            {
                _previousHolders = (_previousFlagProssession select _forEachIndex) select 3;
                _previousContestors = (_previousFlagProssession select _forEachIndex) select 4;
                _previousCapStart = (_previousFlagProssession select _forEachIndex) select 5;
                _previousCapTime = (_previousFlagProssession select _forEachIndex) select 6;


                _capStart = _previousCapStart;

                switch (true) do
                {
                    case ( _blues > _reds && _blues > _greens ):
                    {
                        switch (true) do
                        {
                            case (_previousCapStart != 0 && _previousCapTime <= 30):
                            {
                                _contestors = west;
                                _tickTime = diag_tickTime - _previousCapStart;
                                _capTime = _tickTime;
                            };
                            case ( (_previousCapStart != 0 && _previousCapTime > 30) || _previousHolders == west ):
                            {
                                _currentSide = west;
                                _contestors = civilian;
                                _capTime = 0;
                                _capStart = 0;
                            };
                            default
                            {
                                _contestors = west;
                                _capStart = diag_tickTime;
                            };
                        };
                    };

                    case ( _blues == 0 && _reds == 0 && _greens == 0 ):
                    {
                        _currentSide = _previousHolders;
                        if (_previousContestors != civilian) then
                        {
                            _contestors = civilian;
                            _capTime = 0;
                            _capStart = 0;
                        };
                    };
                };
            };

// 11:46:42 "[[0,0,0,CIV,"",0,0],[0,0,0,CIV,"",0,0],[0,0,0,CIV,"",0,0]]"
// 11:46:42 "[[0,0,0,CIV,"",0,0],[0,0,0,CIV,"",0,0],[0,0,0,CIV,"",0,0]]"
// 11:46:43 "[[0,0,0,CIV,"",0,0],[0,0,0,CIV,"",0,0],[0,0,0,CIV,"",0,0]]"
// 11:46:43 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,0],[0,0,0,CIV,"",0,0]]"
// 11:46:44 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,0.500999],[0,0,0,CIV,"",0,0]]"
// 11:46:44 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,1.005],[0,0,0,CIV,"",0,0]]"
// 11:46:45 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,1.511],[0,0,0,CIV,"",0,0]]"
// 11:46:45 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,2.015],[0,0,0,CIV,"",0,0]]"
// 11:46:46 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,2.516],[0,0,0,CIV,"",0,0]]"
// 11:46:46 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,3.022],[0,0,0,CIV,"",0,0]]"
// 11:46:47 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,3.525],[0,0,0,CIV,"",0,0]]"
// 11:46:47 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,4.026],[0,0,0,CIV,"",0,0]]"
// 11:46:48 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,4.529],[0,0,0,CIV,"",0,0]]"
// 11:46:48 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,5.036],[0,0,0,CIV,"",0,0]]"
// 11:46:49 "[[0,0,0,CIV,"",0,0],[1,0,0,CIV,WEST,83.797,5.54],[0,0,0,CIV,"",0,0]]"
// 11:46:49 "[[0,0,0,CIV,"",0,0],[0,0,0,CIV,"",83.797,0],[0,0,0,CIV,"",0,0]]"
// 11:46:50 "[[0,0,0,CIV,"",0,0],[0,0,0,CIV,"",83.797,0],[0,0,0,CIV,"",0,0]]"
// 11:46:50 "[[0,0,0,CIV,"",0,0],[0,0,0,CIV,"",83.797,0],[0,0,0,CIV,"",0,0]]"
// 11:46:51 "[[0,0,0,CIV,"",0,0],[0,0,0,CIV,"",83.797,0],[0,0,0,CIV,"",0,0]]"


            //  blue    op     indi     current holders             contestors                  cap start   cap time
            // [_blues, _reds, _greens, west/east/resistance/empty, west/east/resistance/empty, _startTick, _currentTick]

            _flagPossession pushBack [_blues, _reds, _greens, _currentSide, _contestors, _capStart, _capTime];
        } forEach flagInformation;

        diag_log (str _flagPossession);

        missionNamespace setVariable ["flagPossession", _flagPossession];
        publicVariable "flagPossession";

        sleep 0.5;
    };
};
