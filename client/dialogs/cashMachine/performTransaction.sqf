/*
 * Performs a bank transaction
 *
 * Params: [<type: String>]
 */

#include "cashMachine_defines.hpp"
disableSerialization;

_type = _this select 0;

_display = uiNamespace getVariable "CashMachine";
_messageArea = _display displayCtrl message_area;
_inputBox = _display displayCtrl input_box;

_qty = parseNumber (ctrlText _inputBox);
_message = "";

switch (_type) do
{
    case "withdraw":
    {
        _message = "Insufficient Funds";
        if ((profileNamespace getVariable ["uk_var_cashInBank", 0]) >= _qty) then
        {
            [-(_qty), true] call fnc_adjustPlayerMoney;
            [_qty, false] call fnc_adjustPlayerMoney;
            _message = "Money Withdrawn";
        };
    };
    case "deposit":
    {
        _message = "Insufficient Funds";
        if ((profileNamespace getVariable ["uk_var_cashOnHand", 0]) >= _qty) then
        {
            [-(_qty), false] call fnc_adjustPlayerMoney;
            [_qty, true] call fnc_adjustPlayerMoney;
            _message = "Money Deposited";
        };
    };
};

_messageArea ctrlSetText _message;
