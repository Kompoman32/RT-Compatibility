private _subCategoryStr = "Movement";

RT_KEYBINDS_MOVEMENT_slide = "KEYBINDS_RT_KEYBINDS_MOVEMENT_slide";

[[RT_KEYBINDS_category, _subCategoryStr], RT_KEYBINDS_MOVEMENT_slide , "Скользить по лесенке",
{
    call RT_Movement_fnc_ladderSlideDown
}, {
    false
}, [DIK_S, [true, false, false]]] call CBA_fnc_addKeybind;