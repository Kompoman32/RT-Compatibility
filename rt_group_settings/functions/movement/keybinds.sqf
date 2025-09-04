private _subCategoryStr = "Movement";

RT_KEYBINDS_MOVEMENT_slide = "KEYBINDS_RT_KEYBINDS_MOVEMENT_slide";

[[RT_KEYBINDS_category, _subCategoryStr], RT_KEYBINDS_MOVEMENT_slide , "Скользить по лесенке",
{
    call RT_Movement_fnc_ladderSlideDown
}, {
    false
}, [DIK_S, [true, false, false]]] call CBA_fnc_addKeybind;

RT_KEYBINDS_MOVEMENT_dropBackpack = "KEYBINDS_RT_KEYBINDS_MOVEMENT_dropBackpack";
RT_KEYBINDS_MOVEMENT_takeBackpack = "KEYBINDS_RT_KEYBINDS_MOVEMENT_takeBackpack";

[[RT_KEYBINDS_category, _subCategoryStr], RT_KEYBINDS_MOVEMENT_dropBackpack , "Скинуть рюкзак",
{
    [player] call RT_Movement_fnc_dropBackpack;
}, {
    false
}, [DIK_F, [false, false, true]]] call CBA_fnc_addKeybind;

[[RT_KEYBINDS_category, _subCategoryStr], RT_KEYBINDS_MOVEMENT_takeBackpack , "Поднять СВОЙ рюкзак (по возможности)",
{
    [player] call RT_Movement_fnc_takeBackpack;
}, {
    false
}, [DIK_F, [false, true, false]]] call CBA_fnc_addKeybind;