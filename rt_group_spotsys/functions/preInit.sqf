// Все текущие заспоченные юниты
RT_SPOTSYS_AllSpottedTargets = [];

// Юниты, которых не должны быть заспочены
RT_SPOTSYS_NonSpottableTargets = [];

// Ключ экшена (кнопки) спота юнита в ручном режиме (используется ()actionKeys RT_SPOTSYS_SpotTargetActionKey))
RT_SPOTSYS_SpotTargetActionKey = "revealTarget"; 

// Переменная используемая для определения кричал ли в ближайшие 20с игрок, при спотинге юнита
RT_SPOTSYS_SpotIsPlayingVoice = false;

// Переменные для спотов на карте (WIP)
RT_SPOTSYS_SpotMaxCursorRangeUnitMarker = 0.02; 
RT_SPOTSYS_SpotMinMapZoomUnitMarker = 0.035; 

// Update Rate времени последнего спота на Сервере
RT_SPOTSYS_ServerSpotUpdateRate = 1; 
// Update Rate времени последнего спота на Клиенте (НЕ используется)
RT_SPOTSYS_ClientSpotUpdateRate = 1; 

// Delay между спотом юнитов, при ужержании кнопки RT_SPOTSYS_SpotTargetActionKey
RT_SPOTSYS_VAR_Hold_Key_Delay = 2;
// последее время спота для Delay'я
RT_SPOTSYS_VAR_Hold_Key_Delay_LastCall = 0;

// (local player) HANDLER для эвента GetInMan
RT_SPOTSYS_VAR_GetInMan_HANDLER = "VARS_RT_SPOTSYS_VAR_GetInMan_HANDLER";
// (local player) HANDLER для эвента KeyDown
RT_SPOTSYS_VAR_SpotByKey_HANDLER = "VARS_RT_SPOTSYS_VAR_SpotByKey_HANDLER";

// (local missionNamespace) HANDLER для скрипта wallhack'a
RT_SPOTSYS_VAR_WALLHACK_HANDLER = "VARS_RT_SPOTSYS_VAR_WALLHACK_HANDLER";

// didn't used
// SpotMaxDistanceUnitMarkerText3D = 10; 
// SpotAllowAutoSpot = false; 
