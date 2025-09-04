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
        };
    };

	class RT_Medical_Assistant
	{
		class Medical
		{
			file="rt\medical_assistant\Functions\Medical";

			class displayLoad {};
			class displayUnload {};
			class displayKeyDown {};
			class displayKeyUp {};

			class initMenu {};
			class initMenuAll {};

			class heartRateGUI {};
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
