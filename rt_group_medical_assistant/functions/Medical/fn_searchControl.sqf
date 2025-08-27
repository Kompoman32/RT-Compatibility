params ["_ctrl_name","_ctrl_info","_ctrl_pulse", "_ctrl_dir", "_ctrl_blood_rate", ["_ctrl_groupIcon", objNull], ["_ctrl_groupIconBG", objNull]];

{ _x ctrlSetTextColor [1,1,1,1] } forEach [_ctrl_name, _ctrl_info, _ctrl_pulse];

_ctrl_name ctrlSetText "";
_ctrl_name ctrlSetTooltip "";

private _picture = format["a3\ui_f\data\igui\rsctitles\rschvtphase\jac_a3_signal_%1_ca.paa",(floor (uiTime % 5) min 4)];

if ((getResolution#5) >= 0.85) then
{
	_ctrl_info ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium'><img image='%1'/><br/><t size='0.64'>SEARCHING...</t></t>",_picture];
}
else
{
	_ctrl_info ctrlSetStructuredText parseText format["<t align='center' font='PuristaMedium'><img image='%1'/><br/><t size='0.64'>SEARCHING FOR A CONNECTION...</t></t>",_picture];
};
_ctrl_info ctrlSetTooltip "";

_ctrl_pulse ctrlSetBackgroundColor [0,0,0,0];
_ctrl_pulse ctrlSetTooltip "";

_ctrl_dir ctrlSetText "";

_ctrl_blood_rate ctrlSetTextColor [1,1,1,0];
_ctrl_blood_rate ctrlSetTooltip "";

if !(isNull _ctrl_groupIcon) then {
	_ctrl_groupIcon ctrlShow false;
	_ctrl_groupIcon ctrlCommit 0;
};

if !(isNull _ctrl_groupIconBG) then {
	_ctrl_groupIconBG ctrlShow false;
	_ctrl_groupIconBG ctrlCommit 0;
};