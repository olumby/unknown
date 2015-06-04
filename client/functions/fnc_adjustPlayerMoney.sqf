/*
 * Change the players money and save to profile.
 *
 * Params: [<amount: Number>, <useBank: Boolean>]
 */

_amount = [_this, 0, 0, [0]] call BIS_fnc_param;
_useBank = [_this, 1, false, [false]] call BIS_fnc_param;

_moneyVar = if (_useBank) then { "uk_var_cashInBank" } else { "uk_var_cashOnHand" };

_currentMoney = profileNamespace getVariable [_moneyVar, 0];
_newValue = (_currentMoney + _amount);
profileNamespace setVariable [_moneyVar, _newValue];

saveProfileNamespace;
