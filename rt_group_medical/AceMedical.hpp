
class ace_medical_treatment_actions
{
    class BasicBandage
    {
        treatmentTime="call RT_Medical_fnc_getBandageTime";
    };

    class SurgicalKit;
    class Suture: SurgicalKit {
        displayName = "$STR_RT_Medical_Use_Suture";
        items[] = {"ACE_suture"};
        treatmentTime="RT_Medical_fnc_getStitchTime"
        medicRequired = "0";
        callbackProgress = "rt_medical_fnc_sutureProgress";
        consumeItem = "false";
        litter[] = {{"ACE_MedicalLitter_suture"}};
    };
};

class ace_medical_replacementItems {
    ItemType_401[] = {
        {"ACE_fieldDressing", 3},
        {"ACE_painkillers", 1},
        {"ACE_splint", 1},
        {"ACE_tourniquet", 1},
        {"ACE_suture", 3}
    };
    ItemType_619[] = {
        {"ACE_fieldDressing", 6},
        {"ACE_epinephrine", 2},
        {"ACE_morphine", 2},
        {"ACE_tourniquet", 1},
        {"ACE_splint", 1},
        {"ACE_suture", 6},
        {"ACE_painkillers", 1},
        {"ACE_adenosine", 1},
        {"ACE_salineIV_250", 1}
    };
};