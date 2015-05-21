/*
 * Monitors the flag possession.
 */

waitUntil { !isNil "flagInformation" };

#define capture_time 30

fnc_changeFlag =
{
    _side = _this select 0;
    _flagIndex = _this select 1;

    _flagType = switch (_side) do
    {
        case west:
        {
            "Flag_NATO_F";
        };
        case east:
        {
            "Flag_CSAT_F";
        };
        case resistance:
        {
            "Flag_AAF_F";
        };
        case civilian:
        {
            "FlagPole_F";
        };
        default
        {
            "FlagPole_F";
        };
    };

    deleteVehicle ((flagInformation select _flagIndex) select 2);

    newFlag = createVehicle [_flagType, getMarkerPos ((flagInformation select _flagIndex) select 0), [], 0, "CAN_COLLIDE"];

    (flagInformation select _flagIndex) set [2, newFlag];

    missionNamespace setVariable ["flagInformation", flagInformation];
    publicVariable "flagInformation";
};

fnc_whenTeam =
{
    _previousHolders = _this select 0;
    _previousContestors = _this select 1;
    _previousCapStart = _this select 2;
    _previousCapTime = _this select 3;
    _side = _this select 4;
    _flagIndex = _this select 5;

    switch (true) do
    {
        case (_previousCapStart != 0 && _previousCapTime <= capture_time && _previousContestors == _side):
        {
            _currentSide = _previousHolders;
            _contestors = _side;
            _capStart = _previousCapStart;
            _capTime = diag_tickTime - _previousCapStart;
            [_currentSide, _contestors, _capStart, _capTime];
        };
        case ( (_previousCapStart != 0 && _previousCapTime > capture_time) || _previousHolders == _side ):
        {
            _currentSide = _side;
            _contestors = civilian;
            _capTime = 0;
            _capStart = 0;

            if (_previousHolders != _side) then
            {
                [_side, _flagIndex] call fnc_changeFlag;
            };

            [_currentSide, _contestors, _capStart, _capTime];
        };
        default
        {
            _currentSide = _previousHolders;
            _contestors = _side;
            _capStart = diag_tickTime;
            _capTime = 0;
            [_currentSide, _contestors, _capStart, _capTime];
        };
    };
};

fnc_whenEmpty =
{
    _previousHolders = _this select 0;
    _previousContestors = _this select 1;
    _previousCapStart = _this select 2;
    _previousCapTime = _this select 3;

    [_previousHolders, civilian, 0, 0];
};

fnc_whenContested =
{
    _previousHolders = _this select 0;
    _previousContestors = _this select 1;
    _previousCapStart = _this select 2;
    _previousCapTime = _this select 3;

    [_previousHolders, _previousContestors, diag_tickTime, _previousCapTime];
};

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