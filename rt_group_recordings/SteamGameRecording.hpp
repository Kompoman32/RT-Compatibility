class SteamManagerConfig
{
	class GameRecording 
	{
		class RTUnconsiousEvent
		{
			scope = 2;
			title = "Unconscious";
			description = "Lost consciousness";
			icon = "a3_revive";
			priority = 100;
			clipPriority = 3;
		};

		class RTConsiousEvent
		{
			scope = 2;
			title = "Conscious";
			description = "Regained consciousness.";
			icon = "a3_steam_view";
			priority = 99;
			clipPriority = 1;
		};
	};
};