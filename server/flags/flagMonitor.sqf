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

                _isTeam = true;
                _side = civilian;
                
                switch (true) do
                {
                    case ( _blues > _reds && _blues > _greens ):
                    {
                        _side = west;
                    };
                    case ( _reds > _blues && _reds > _greens ):
                    {
                        _side = east;
                    };
                    case ( _greens > _reds && _greens > _blues ):
                    {
                        _side = resistance;
                    };
                    case ( _blues == 0 && _reds == 0 && _greens == 0 ):
                    {
                        _isTeam = false;
                    };
                };

                if (_isTeam) then
                {
                    switch (true) do
                    {
                        case (_previousCapStart != 0 && _previousCapTime <= 30):
                        {
                            _currentSide = _previousHolders;
                            _contestors = _side;
                            _tickTime = diag_tickTime - _previousCapStart;
                            _capTime = _tickTime;
                        };
                        case ( (_previousCapStart != 0 && _previousCapTime > 30) || _previousHolders == _side ):
                        {
                            _currentSide = _side;
                            _contestors = civilian;
                            _capTime = 0;
                            _capStart = 0;
                        };
                        default
                        {
                            _currentSide = _previousHolders;
                            _contestors = _side;
                            _capStart = diag_tickTime;
                        };
                    };
                }
                else
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

            _flagPossession pushBack [_blues, _reds, _greens, _currentSide, _contestors, _capStart, _capTime];
        } forEach flagInformation;

        diag_log (str _flagPossession);

        missionNamespace setVariable ["flagPossession", _flagPossession];
        publicVariable "flagPossession";

        sleep 0.5;
    };
};
