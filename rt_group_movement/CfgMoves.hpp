class CfgMovesBasic
{
	// class StandBase;
	class Actions
	{
		class NoActions;
		class LadderCivilActions: NoActions
		{
			stop="PLP_LTR_LadderCivilStatic";
			default="PLP_LTR_LadderCivilStatic";
			down="PLP_LTR_LadderCivilDownLoop";
			up="PLP_LTR_LadderCivilUpLoop";
		};
		class LadderRifleActions: LadderCivilActions
		{
			stop="PLP_LTR_LadderRifleStatic";
			default="PLP_LTR_LadderRifleStatic";
			down="PLP_LTR_LadderRifleDownLoop";
			up="PLP_LTR_LadderRifleUpLoop";
		};
	};
};
class CfgMovesMaleSdr: CfgMovesBasic
{
	class States
	{
        /* 
            From "Swim Faster" by Alkanet
            https://steamcommunity.com/sharedfiles/filedetails/?id=1808723766 
        */
		class AswmPercMstpSnonWnonDnon;
		class AsswPercMstpSnonWnonDnon;
		class AbswPercMstpSnonWnonDnon;
		class AdvePercMstpSnonWrflDnon;
		class AsdvPercMstpSnonWrflDnon;
		class AbdvPercMstpSnonWrflDnon;
		class AswmPercMrunSnonWnonDf: AswmPercMstpSnonWnonDnon
		{
			speed=0.38;
		};
		class AsswPercMrunSnonWnonDf: AsswPercMstpSnonWnonDnon
		{
			speed=0.38;
		};
		class AbswPercMrunSnonWnonDf: AbswPercMstpSnonWnonDnon
		{
			speed=0.34999999;
		};
		class AdvePercMrunSnonWrflDf: AdvePercMstpSnonWrflDnon
		{
			speed=0.2;
		};
		class AsdvPercMrunSnonWrflDf: AsdvPercMstpSnonWrflDnon
		{
			speed=0.2;
		};
		class AbdvPercMrunSnonWrflDf: AbdvPercMstpSnonWrflDnon
		{
			speed=0.2;
		};

        /* 
            From "Ladder Tweak Remastered" by POLPOX
            https://steamcommunity.com/sharedfiles/filedetails/?id=2969350304
        */
		class LadderCivilStatic;
		class LadderRifleStatic;
		class LadderCivilOn_Top: LadderCivilStatic
		{
			ConnectTo[]=
			{
				"PLP_LTR_LadderCivilStatic",
				1
			};
		};
		class LadderRifleOn: LadderCivilOn_Top
		{
			ConnectTo[]=
			{
				"PLP_LTR_LadderRifleStatic",
				1
			};
		};
		class LadderCivilUpLoop;
		class PLP_LTR_LadderCivilUpLoop: LadderCivilUpLoop
		{
			file="rt\movement\ladder\ladderUpCiv.rtm";
			speed="-(25/30)";
			InterpolateTo[]=
			{
				"Unconscious",
				0.02,
				"PLP_LTR_LadderCivilStatic",
				0.1,
				"PLP_LTR_LadderCivilDownLoop",
				0.1,
				"LadderCivilTopOff",
				0.1,
				"PLP_LTR_LadderCivilSlide",
				0.1
			};
			stamina=-1;
		};
		class PLP_LTR_LadderCivilDownLoop: LadderCivilUpLoop
		{
			file="rt\movement\ladder\ladderDownCiv.rtm";
			speed="-(25/30)/1.1111";
			InterpolateTo[]=
			{
				"Unconscious",
				0.02,
				"PLP_LTR_LadderCivilStatic",
				0.1,
				"PLP_LTR_LadderCivilUpLoop",
				0.1,
				"LadderCivilDownOff",
				0.1,
				"PLP_LTR_LadderCivilSlide",
				0.1
			};
			stamina=-0.30000001;
		};
		class PLP_LTR_LadderRifleUpLoop: LadderCivilUpLoop
		{
			file="rt\movement\ladder\ladderUpRfl.rtm";
			speed="-(25/30)/1.1111";
			InterpolateTo[]=
			{
				"Unconscious",
				0.02,
				"PLP_LTR_LadderRifleStatic",
				0.1,
				"PLP_LTR_LadderRifleDownLoop",
				0.1,
				"LadderRifleTopOff",
				0.1,
				"PLP_LTR_LadderRifleSlide",
				0.1
			};
			actions="LadderRifleActions";
			stamina=-1;
		};
		class PLP_LTR_LadderRifleDownLoop: PLP_LTR_LadderRifleUpLoop
		{
			file="rt\movement\ladder\ladderDownRfl.rtm";
			InterpolateTo[]=
			{
				"Unconscious",
				0.02,
				"PLP_LTR_LadderRifleStatic",
				0.1,
				"PLP_LTR_LadderRifleUpLoop",
				0.1,
				"LadderRifleDownOff",
				0.1,
				"PLP_LTR_LadderRifleSlide",
				0.1
			};
			stamina=-0.30000001;
		};
		class PLP_LTR_LadderCivilStatic: LadderCivilStatic
		{
			file="rt\movement\ladder\ladderStaticCiv.rtm";
			InterpolateTo[]=
			{
				"Unconscious",
				0.02,
				"PLP_LTR_LadderCivilUpLoop",
				0.1,
				"PLP_LTR_LadderCivilDownLoop",
				0.1,
				"PLP_LTR_LadderCivilSlide",
				0.1
			};
		};
		class PLP_LTR_LadderRifleStatic: LadderRifleStatic
		{
			file="rt\movement\ladder\ladderStaticRfl.rtm";
			InterpolateTo[]=
			{
				"Unconscious",
				0.02,
				"PLP_LTR_LadderRifleUpLoop",
				0.1,
				"PLP_LTR_LadderRifleDownLoop",
				0.1,
				"PLP_LTR_LadderRifleSlide",
				0.1
			};
		};
		class PLP_LTR_LadderCivilSlide: LadderCivilStatic
		{
			file="rt\movement\ladder\ladderSlideCiv.rtm";
			InterpolateTo[]=
			{
				"Unconscious",
				0.02,
				"PLP_LTR_LadderCivilSlideEnd",
				0.0099999998
			};
			actions="NoActions";
		};
		class PLP_LTR_LadderRifleSlide: LadderRifleStatic
		{
			file="rt\movement\ladder\ladderSlideRfl.rtm";
			InterpolateTo[]=
			{
				"Unconscious",
				0.02,
				"PLP_LTR_LadderRifleSlideEnd",
				0.0099999998
			};
			actions="NoActions";
		};
		class PLP_LTR_LadderCivilSlideEnd: LadderCivilStatic
		{
			looped=0;
			speed="-(37/30)";
			file="rt\movement\ladder\ladderSlideEndCiv.rtm";
			InterpolateTo[]=
			{
				"Unconscious",
				0.02,
				"AmovPercMstpSnonWnonDnon",
				0.30000001
			};
			actions="NoActions";
		};
		class PLP_LTR_LadderRifleSlideEnd: LadderRifleStatic
		{
			looped=0;
			speed="-(37/30)";
			file="rt\movement\ladder\ladderSlideEndRfl.rtm";
			InterpolateTo[]=
			{
				"Unconscious",
				0.02,
				"AmovPercMstpSlowWrflDnon",
				0.30000001
			};
			actions="NoActions";
		};
	};
};


class CfgAnimation
{
	ladderSpeed="0.5*2.5";
};