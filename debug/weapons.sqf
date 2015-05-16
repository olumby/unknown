// Mag List
_magList = [];
{
    _weaponClass = _x select 0;

    _weaponMagazines = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "magazines");
    _weaponMuzzles = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "muzzles") - ["this"];
    {
        _mags = getArray (configfile >> "CfgWeapons" >> _weaponClass >> _x >> "magazines");
        _weaponMagazines = _weaponMagazines + _mags;
    } forEach _weaponMuzzles;

    {
        if (!(_x in _magList)) then
        {
            _magList pushBack _x;
        };
    } forEach _weaponMagazines;

} forEach (call gunStoreContentRifles + call gunStoreContentMachine + call gunStoreContentSniperRifles + call gunStoreContentLaunchers + call gunStoreContentHandguns);

_magConfig = (configfile >> "CfgMagazines");

debug_magazineList = [];
{
    _name = getText (_magConfig >> _x >> "displayName");
    _price = 100;

    debug_magazineList pushBack [_x, _price, _name];
} forEach _magList;
