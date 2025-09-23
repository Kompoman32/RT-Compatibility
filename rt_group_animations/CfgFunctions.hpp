class CfgFunctions
{
    class RT_Animations
    {
        class Animations
        {
            file = "rt\animations\Functions\Animations";
            class StopAnimation {};
            class IsAnimating {};
        };

        class Dance
        {
            file = "rt\animations\Functions\Dance";
            class Dance {};
            class StopDancing {};
            class IsDancing {};
        };

        class Actions
        {
            file = "rt\animations\Functions\Actions";
            class Act {};
            class StopActing {};
            class IsActing {};
        }

        class Emotes
        {
            file = "rt\animations\Functions\Emotes";
            class Emote {};
            class StopEmoting {};
            class IsEmoting {};
        };

        class Utils
        {
            file = "rt\animations\Functions\Utils";
            class GetGestureDuration {};
            class GetMoveDuration {};
        };
    };
};