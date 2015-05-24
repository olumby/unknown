_amount = _this select 3;

_currentCash = profileNamespace getVariable ["uk_var_cashOnHand", 0];

profileNamespace setVariable ["uk_var_cashOnHand", (_currentCash + _amount)];

saveProfileNamespace;
