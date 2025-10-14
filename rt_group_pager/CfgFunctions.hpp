class CfgFunctions
{
    class RT_Pager
    {
        class Pager
        {
            file = "rt\pager\functions\pager";
            class showMessage;
            class receiveMessage;
            class sendMessage;
            class canShowPagerAction;
        };

        class PagerDialog
        {
            file = "rt\pager\functions\pagerDialog";
            class pagerSendClick;
            class pagerNextRecipientClick;
            class pagerPrevRecipientClick;
            class pagerCloseClick;
            class pagerOnLoad;
            class pagerOnLoadEditControl;
            class pagerOnKeyUp;
        };
    };
};