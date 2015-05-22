/*
 * Monitors the flag possession.
 */

waitUntil { !isNil "flagInformation" };

#define capture_time 30

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

            _blues = ({ alive _x && side _x == west && vehicle _x in _triggerPlayers } count allUnits);
            _reds = ({ alive _x && side _x == east && vehicle _x in _triggerPlayers } count allUnits);
            _greens = ({ alive _x && side _x == resistance && vehicle _x in _triggerPlayers } count allUnits);

            _currentSide = civilian;
            _contestors = civilian;
            _capStart = 0;
            _capTime = 0;
            _re = [_currentSide, _contestors, _capStart, _capTime];
            if ( count _previousFlagProssession > 0 ) then
            {
                _previousHolders = (_previousFlagProssession select _forEachIndex) select 3;
                _previousContestors = (_previousFlagProssession select _forEachIndex) select 4;
                _previousCapStart = (_previousFlagProssession select _forEachIndex) select 5;
                _previousCapTime = (_previousFlagProssession select _forEachIndex) select 6;
                switch (true) do
                {
                    case ( _blues > _reds && _blues > _greens ):
                    {
                        _re = [_previousHolders, _previousContestors, _previousCapStart, _previousCapTime, west, _forEachIndex] call fnc_whenTeam;
                    };
                    case ( _reds > _blues && _reds > _greens ):
                    {
                        _re = [_previousHolders, _previousContestors, _previousCapStart, _previousCapTime, east, _forEachIndex] call fnc_whenTeam;
                    };
                    case ( _greens > _reds && _greens > _blues ):
                    {
                        _re = [_previousHolders, _previousContestors, _previousCapStart, _previousCapTime, resistance, _forEachIndex] call fnc_whenTeam;
                    };
                    case ( (_blues + _reds + _greens) == 0 ):
                    {
                        _re = [_previousHolders, _previousContestors, _previousCapStart, _previousCapTime] call fnc_whenEmpty;
                    };
                    case ( (_blues == _reds) || (_blues == _greens) || (_reds == _greens) ):
                    {
                        _re = [_previousHolders, _previousContestors, _previousCapStart, _previousCapTime] call fnc_whenContested;
                    };
                    default
                    {
                        _currentSide = civilian;
                        _contestors = civilian;
                        _capStart = 0;
                        _capTime = 0;
                        _re = [_currentSide, _contestors, _capStart, _capTime];
                    };
                };
            };

            _flagPossession pushBack [_blues, _reds, _greens, _re select 0, _re select 1, _re select 2, _re select 3];
        } forEach flagInformation;

        diag_log (str _flagPossession);

        missionNamespace setVariable ["flagPossession", _flagPossession];
        publicVariable "flagPossession";

        sleep 0.5;
    };
};
