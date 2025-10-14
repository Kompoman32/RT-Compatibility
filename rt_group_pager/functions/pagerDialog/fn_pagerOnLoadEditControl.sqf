params ["_control"];
uiNameSpace setVariable [RT_PAGER_VAR_Pager_Edit_Control, _control];

_control ctrlSetText (uiNameSpace getVariable [RT_PAGER_VAR_Pager_Message, ""]);
_control ctrlEnable true;
_control ctrlCommit 0;

_control spawn {
	sleep 0.1;
	ctrlSetFocus _this;

	_this ctrlSetTextSelection [count ctrlText _this, 0];
}