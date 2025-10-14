disableSerialization;
private _page = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Page, 'message'];

switch (_page) do {
	case "message": { 
		private _ctrlEdit = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Edit_Control, controlNull];
		if (isNull _ctrlEdit) exitWith {};
		
		uiNameSpace setVariable [RT_PAGER_VAR_Pager_Message, ctrlText _ctrlEdit];
		uiNameSpace setVariable [RT_PAGER_VAR_Pager_Page, 'sender'];

		_ctrlEdit ctrlEnable false;

		private _selectedRecepientIndex = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Selected_Recipient, 0];
		private _recipients = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Recipients, []];

		if (count _recipients == 0) exitWith {
			_ctrlEdit ctrlSetText "NO CONTACT";
			_ctrlEdit ctrlSetTextSelection [0, 0];
			_ctrlEdit ctrlCommit 0;
		};

		_selectedRecepientIndex = 0 max _selectedRecepientIndex min ((count _recipients) - 1);

		private _selectedRecepient = _recipients select _selectedRecepientIndex ;

		_ctrlEdit ctrlSetText (toUpper (name _selectedRecepient));
		_ctrlEdit ctrlSetTextSelection [0, 0];
		_ctrlEdit ctrlCommit 0;
	};
	case "sender": { 
		private _selectedRecepientIndex = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Selected_Recipient, 0];
		private _recipients = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Recipients, []];

		if (count _recipients == 0) exitWith {};
		_selectedRecepientIndex = 0 max _selectedRecepientIndex min ((count _recipients) - 1);

		private _message = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Message, ""];
		private _recipient = _recipients select _selectedRecepientIndex;

		_message = format ["%1: %2", name player, _message];

		[_recipient, _message] call RT_Pager_fnc_sendMessage;

		uiNameSpace setVariable [RT_PAGER_VAR_Pager_Message, ""];

		(findDisplay RT_PAGER_VAR_DISPLAY_IDC) closeDisplay 2;
	};
};


