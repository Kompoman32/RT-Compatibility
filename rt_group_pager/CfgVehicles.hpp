class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class RT_Pager {
                    displayName = "Pager";
                    showDisabled = 0;
                    condition = "RT_SETTINGS_INITIALIZATION_pager call CBA_settings_fnc_get && [] call RT_PAGER_fnc_canShowPagerAction";
                    statement = "createDialog 'RT_Pager'";

                    icon = "\rt\pager\pager-icon-ca.paa";
                };
            };
        };
    };

    class Box_NATO_Support_F;
    class ACE_Box_Misc: Box_NATO_Support_F {
        class TransportItems {
            class _xx_RT_Pager
            {
                name = "RT_Pager";
                count = 10;
            };
        };
    };

    class Item_Base_F;
    class RT_Pager_Item: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = "Pager";
        author = "Kompoman32";
        icon = "\rt\pager\pager-icon-ca.paa";
        vehicleClass = "Items";
        model = "\A3\Weapons_f\DummyWeapon.p3d";
        class TransportItems {
            class _xx_RT_Pager
            {
                name = "RT_Pager";
                count = 1;
            };
        };
    };
};