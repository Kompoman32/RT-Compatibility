class CfgFunctions
{
    class RT_Medical
    {
		class Bandages
        {
            file = "rt\medical\Functions\Bandages";
			class getBandageTime;
		};

		class MedicalAssistant
        {
            file = "rt\medical\Functions\Assistant";
			class initArrows;
		};
    };

    class Asaayu
	{
		class AMA
		{
			class init
			{
				file="rt\medical\Functions\fn_init.sqf";
            };
            class initMenu
			{
				file="rt\medical\Functions\fn_initMenu.sqf";
			};
            class heartRateGUI
			{
				file="rt\medical\Functions\Assistant\fn_heartRateGUI.sqf";
			};
        };
    };
};
