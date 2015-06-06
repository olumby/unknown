sleep (call missionCooldown);

//_outPostMissions = [[8100,22591,0], 6] execVM "server\missions\outpostMission.sqf";

_availableOutposts = [[8217,22537,0],[3839,21504,0],[5421,17919,0],[4557,15440,0],[3768,10373,0],[8294,10082,0],[11685,9527,0],[12229,12757,0],[13196,17322,0],[11714,19992,0],[9993,21160,0],[8036,20077,0],[7899,17604,0],[7158,13827,0],[6391,12436,0],[12347,14917,0],[13590,12181,0],[10301,7510,0],[9580,8846,0],[14154,21159,0],[16004,18253,0],[15541,15998,0],[17156,17055,0],[26579,23053,0],[23476,21141,0],[24546,19289,0],[19211,18420,0],[22895,16738,0],[19432,15593,0],[20888,14550,0],[20160,12826,0],[15373,11253,0],[18651,10183,0],[19504,7654,0],[21966,7550,0]];

while { isServer } do
{
    _activeOutpost = missionNamespace getVariable ["activeOutpost", [false, 0]];
    if (count _availableOutposts > 0 && !(_activeOutpost select 0)) then
    {
        if (diag_tickTime - (_activeOutpost select 1) > (call missionCooldown)) then
        {
            missionNamespace setVariable ["activeOutpost", [true, diag_tickTime]];
            
            _outpost = _availableOutposts select (floor (random (count _availableOutposts)));
            _availableOutposts = _availableOutposts - _outpost;

            [_outpost, 6] execVM "server\missions\outpostMission.sqf";
        };
    };

    sleep 5;
};


//{ _name = str _forEachIndex; _marker = createMarker [_name, _x]; _marker setMarkerShape "ICON"; _marker setMarkerType "mil_dot"; } forEach ();
