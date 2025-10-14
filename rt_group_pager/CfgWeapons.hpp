class CfgWeapons {
    class ACE_ItemCore;
    class CBA_MiscItem_ItemInfo;

    class RT_Pager: ACE_ItemCore {
        scope = 2;
        displayName = "Pager";
        descriptionShort = "";
        author = "Kompoman32";
        picture = "\rt\pager\pager-item-ca.paa";
        ACE_isTool = 1;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 2;
        };
    };
};
