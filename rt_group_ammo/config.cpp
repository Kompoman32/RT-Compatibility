#include "CfgPatches.hpp"
#include "CfgAmmo.hpp"
#include "CfgVehicles.hpp"
#include "CfgEventHandlers.hpp"

class CfgFunctions
{
    class RT_Ammo
    {
        class Ammo
        {
            file = "rt\ammo\functions\ammo";
            class grenadePickUp
            {
            };
        };
    };
};

class ACE_Medical_Injuries {
    class wounds {
        class RubberBulletHit {
            bleeding = 0;
            pain = 1.0;
        };

        class RubberBallHit: RubberBulletHit {};
    };

    class damageTypes {
        class rubberbullet {
            // thresholds[] = {{20, 10}, {4.5, 2}, {3, 1}, {0, 1}};

            noBlood = 1;
            class RubberBulletHit {
                // weighting[] = {{1, 1}, {0.35, 0}};
                weighting[] = {{0.01, 1}, {0.01, 0}};
            };
        }

        class rubberexplosion {
            thresholds[] = {{20, 15}, {8, 7}, {2, 3}, {1.2, 2}, {0.4, 1}, {0,0}};

            selectionSpecific = 0;

            noBlood = 1;
            class RubberBallHit {
                // weighting[] = {{1, 1}, {0.35, 0}};
                weighting[] = {{0.01, 1}, {0.01, 0}};
            };
            class Contusion {
                weighting[] = {{0.5, 0}, {0.35, 1}};
                sizeMultiplier = 2;
                painMultiplier = 0.9;
            };
        }

        class rubbergrenade {
            thresholds[] = {{20, 10}, {10, 5}, {4, 3}, {1.5, 2}, {0.8, 2}, {0.3, 1}, {0, 0}};

            selectionSpecific = 0;

            noBlood = 1;
            class RubberBallHit {
                // weighting[] = {{1, 1}, {0.35, 0}};
                weighting[] = {{0.01, 1}, {0.01, 0}};
            };
            class Contusion {
                weighting[] = {{0.5, 0}, {0.35, 1}};
                sizeMultiplier = 2;
                painMultiplier = 0.9;
            };
        }
    };
};