class CfgFunctions
{
    class RT_Medical
    {
        class Medical {
            file = "rt\medical\Functions\Medical";
            class sutureProgress;
            class stitchOneWound;
            class getStitchTime;
        }

        class Bandages
        {
            file = "rt\medical\Functions\Bandages";
            class getBandageTime;
        };

        class Stamina
        {
            file = "rt\medical\Functions\Stamina";
            class triggerSecondWind;
        };
    };
};
