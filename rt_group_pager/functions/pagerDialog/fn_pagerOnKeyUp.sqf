params ["", "_key"];

/**
* https//community.bistudio.com/wiki/DIK_KeyCodes
*/

// Enter
if ((_key isEqualto 0x1C) || (_key isEqualto 0x9C)) exitWith {
	[] call RT_PAGER_fnc_pagerSendClick;
};

private _isSenderPage = (uiNameSpace getVariable [RT_PAGER_VAR_Pager_Page, 'message']) == "sender";

// Left
if (_isSenderPage && (_key isEqualto 0xCB)) exitWith {
	[] call RT_PAGER_fnc_pagerPrevRecipientClick;
};

// Right
if (_isSenderPage && (_key isEqualto 0xCD)) exitWith {
	[] call RT_PAGER_fnc_pagerNextRecipientClick;
};