private _display = (findDisplay RT_MEDICAL_ASSSISTANT_VAR_DISPLAY_IDC);

{
  _x ctrlSetFade 1;
  _x ctrlCommit 0;
}forEach (allControls _display);

{
  _x ctrlSetFade 0;
  _x ctrlCommit 0.25;
}forEach (allControls _display);

0 spawn RT_Medical_Assistant_fnc_onGroupButtonClick;