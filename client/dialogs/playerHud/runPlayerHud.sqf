/*
 * Start up and loop the player HUD.
 */

#include "playerHud_defines.hpp"
disableSerialization;

waitUntil { !isNil "flagPossession" && !isNil "flagInformation" };

while {true} do
{
    sleep 1;

    1000 cutRsc ["PlayerHud", "PLAIN", 0, false];
    _display = uiNameSpace getVariable "PlayerHud";

    // Set Player Health Bar
    _healthBar = _display displayCtrl health_bar;
    _damage = (1 - (damage player));
    _healthBar progressSetPosition (_damage);
    switch (true) do
    {
        case (_damage <= 0.25):
        {
            _healthBar ctrlSetTextColor [0.73,0.12,0.02,0.8];
        };
        case (_damage <= 0.50):
        {
            _healthBar ctrlSetTextColor [1,0.52,0.08,0.8];
        };
        case (_damage <= 0.75):
        {
            _healthBar ctrlSetTextColor [0.78,0.78,0.02,0.8];
        };
        case (_damage <= 1):
        {
            _healthBar ctrlSetTextColor [0.2,0.73,0.14,0.8];
        };
    };

    // Money
    _moneyDisplayBank = _display displayCtrl money_display_bank;
    _moneyDisplayHand = _display displayCtrl money_display_hand;

    _bankString = format ["<t color='#bbbbbb' align='right' size='1.2'>%1<img size='1' image='assets\image\austral.paa'/></t>", [profileNamespace getVariable ["uk_var_cashInBank", 0]] call fnc_formatNumber];
    _handString = format ["<t color='#ffffff' align='right' size='1.2'>%1<img size='1' image='assets\image\austral.paa'/></t>", [profileNamespace getVariable ["uk_var_cashOnHand", 0]] call fnc_formatNumber];
    _moneyDisplayBank ctrlSetStructuredText (parseText _bankString);
    _moneyDisplayHand ctrlSetStructuredText (parseText _handString);

    // Flags
    _flagInterface = [flag_0, flag_1, flag_2, flag_3];

    // Hide unused flag boxes
    if( (count _flagInterface) > (count flagPossession) ) then
    {
        _diff = (count _flagInterface) - (count flagPossession);
        for [{_i = 0}, {_i < _diff}, {_i=_i+1}] do
        {
            (_display displayCtrl (_flagInterface select _i)) ctrlShow false;
            _flagInterface = _flagInterface - [(_flagInterface select _i)];
        };
    };

    {
        _currentInterface = _flagInterface select _forEachIndex;
        _interface = _display displayCtrl _currentInterface;
        _interface ctrlSetText ((flagInformation select _forEachIndex) select 5);

        _holders = _x select 3;
        _contestors = _x select 4;

        if ( _contestors != _holders && _holders != civilian) then
        {
            // TODO: show some sort of contestor notification..
        };

        _backgroundColor = [_holders, 0.5] call fnc_colorForSide;
        _textColor = switch (_holders) do
        {
            case civilian: { [0,0,0,1]; };
            default { [1,1,1,1]; };
        };
        _interface ctrlSetBackgroundColor _backgroundColor;
        _interface ctrlSetTextColor _textColor;
    } forEach flagPossession;
};
