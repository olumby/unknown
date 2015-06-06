// Flags
flagMonitor = compile preprocessFileLineNumbers "server\flags\flagMonitor.sqf";

fnc_changeFlag = compile preprocessFileLineNumbers "server\flags\fnc_changeFlag.sqf";
fnc_whenTeam = compile preprocessFileLineNumbers "server\flags\fnc_whenTeam.sqf";
fnc_whenEmpty = compile preprocessFileLineNumbers "server\flags\fnc_whenEmpty.sqf";
fnc_whenContested = compile preprocessFileLineNumbers "server\flags\fnc_whenContested.sqf";

// Functions
fnc_createObjects = compile preprocessFileLineNumbers "server\functions\fnc_createObjects.sqf";
fnc_unlockObjects = compile preprocessFileLineNumbers "server\functions\fnc_unlockObjects.sqf";
fnc_missionNotifier = compile preprocessFileLineNumbers "server\functions\fnc_missionNotifier.sqf";
