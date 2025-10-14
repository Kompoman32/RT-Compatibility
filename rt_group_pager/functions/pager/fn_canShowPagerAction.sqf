//Can't have minimap up while zoomed in on foot, but allow drivers to use while in "Gunner" to handle non-3d vehicles like most tanks
((cameraView != "GUNNER") || (!isNull objectParent player) && (driver vehicle player == player)) &&
("RT_Pager" in (player call ace_common_fnc_uniqueItems)) &&
([player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call ace_common_fnc_canInteractWith)