class CfgFunctions
{
    class Asaayu
	{
		class AMA
		{
			class init
			{
				file="rt\medical_assistant\Functions\Medical\fn_init.sqf";
            };
            class initMenu
			{
				file="rt\medical_assistant\Functions\Medical\fn_initMenu.sqf";
			};
            class initMenuAll
			{
				file="rt\medical_assistant\Functions\Medical\fn_initMenuAll.sqf";
			};
            class heartRateGUI
			{
				file="rt\medical_assistant\Functions\Medical\fn_heartRateGUI.sqf";
			};
        };
    };

	class RT_Medical_Assistant
	{
		class Medical
		{
			file="rt\medical_assistant\Functions\Medical";
			class searchControl {};
			class initControls {};
			class clearControls {};
			class renderControl {};

			class onGroupButtonClick {};
			class setGroupText {};
			class getGroupColor {};
		};
	};
};
