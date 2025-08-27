#include "CfgPatches.hpp"
#include "CfgFunctions.hpp"
#include "CfgEventHandlers.hpp"

class ace_medical_treatment_actions
{
	class BasicBandage
	{
		treatmentTime="call RT_Medical_fnc_getBandageTime";
	};
};

class ace_medical_replacementItems {
    ItemType_401[] = {
		{"ACE_fieldDressing", 3},
		{"ACE_painkillers", 1},
		{"ACE_splint", 1},
		{"ACE_tourniquet", 1}
    };
    ItemType_619[] = {
		{"ACE_fieldDressing", 6},
		{"ACE_epinephrine", 2},
		{"ACE_morphine", 2},
		{"ACE_tourniquet", 1},
		{"ACE_splint", 1},
		{"ACE_suture", 1},
		{"ACE_painkillers", 1},
		{"ACE_adenosine", 1},
		{"ACE_salineIV_250", 1}
    };
};

class CfgMovesFatigue {
	staminaCooldown = 0.1;
};