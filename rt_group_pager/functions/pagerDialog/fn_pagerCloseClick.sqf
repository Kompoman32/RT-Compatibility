disableSerialization;
private _page = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Page, 'message'];

switch (_page) do {
	case "message": {
		(findDisplay RT_PAGER_VAR_DISPLAY_IDC) closeDisplay 2;
	};
	case "sender": { 
		private _ctrlEdit = uiNameSpace getVariable [RT_PAGER_VAR_Pager_Edit_Control, controlNull];
		if (isNull _ctrlEdit) exitWith {};

		uiNameSpace setVariable [RT_PAGER_VAR_Pager_Page, 'message'];

 		_ctrlEdit ctrlSetText (uiNameSpace getVariable [RT_PAGER_VAR_Pager_Message, ""]);
		_ctrlEdit ctrlEnable true;
		_ctrlEdit ctrlCommit 0;
	};
};


