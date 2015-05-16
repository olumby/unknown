// Magazines
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

debug_magazineList = [];
{
    _name = getText (configfile >> "CfgMagazines" >> _x >> "displayName");
    _price = 100;

    debug_magazineList pushBack [_x, _price, _name];
} forEach _magList;

// Accessories
pointerList = [];
muzzleList = [];
barrelList = [];
opticList = [];
{
    _weaponClass = _x select 0;

    _pointerArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
    _muzzleArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
    _barrelArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "UnderBarrelSlot" >> "compatibleItems");
    _opticArray = getArray (configfile >> "CfgWeapons" >> _weaponClass >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");

    {
        _config = (configFile >> "CfgWeapons" >> _x);
        _name = getText (_config >> "displayName");
        _price = 120;

        _pointer = [configName _config, _price, _name];
        if (! (_pointer in pointerList) ) then
        {
            pointerList pushBack _pointer;
        }
    } forEach (_pointerArray);

    {
        _config = (configFile >> "CfgWeapons" >> _x);
        _name = getText (_config >> "displayName");
        _price = 120;

        _muzzle = [configName _config, _price, _name];
        if (! (_muzzle in muzzleList) ) then
        {
            muzzleList pushBack _muzzle;
        }
    } forEach (_muzzleArray);

    {
        _config = (configFile >> "CfgWeapons" >> _x);
        _name = getText (_config >> "displayName");
        _price = 120;

        _barrel = [configName _config, _price, _name];
        if (! (_barrel in barrelList) ) then
        {
            barrelList pushBack _barrel;
        }
    } forEach (_barrelArray);

    {
        _config = (configFile >> "CfgWeapons" >> _x);
        _name = getText (_config >> "displayName");
        _price = 120;

        _optic = [configName _config, _price, _name];
        if (! (_optic in opticList) ) then
        {
            opticList pushBack _optic;
        }
    } forEach (_opticArray);
} forEach (call gunStoreContentRifles + call gunStoreContentMachine + call gunStoreContentSniperRifles + call gunStoreContentLaunchers + call gunStoreContentHandguns);

allAccessories = pointerList + muzzleList + barrelList + opticList;
