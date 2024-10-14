#include "CfgPatches.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgFunctions.hpp"

class AMA_menu {
	onLoad="[180025] spawn AMA_fnc_dialogFadeIn; [] spawn AMA_fnc_initMenu; [] spawn RT_Medical_Assitant_Init";
}

class ace_medical_treatment_actions
{
	class BasicBandage
	{
		treatmentTime="call RT_Medical_fnc_getBandageTime";
	};
};
