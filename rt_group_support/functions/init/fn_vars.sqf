// (local player) Handler стрельбы или киданием гранаты
RT_SUPPORT_VAR_FIRED_HANDLER = "VARS_RT_SUPPORT_VAR_FIRED_HANDLER";

// (local) Доп настройки для Express Artillery
RT_SUPPORT_VAR_EXPRESS_ARTILLERY_PARAMS = [
	10, // sleepTime before start THE BOMBARDMENT
	"Sh_82mm_AMOS", // ammunition to be used
	50, // radius of target area in meters
	12, // number of rounds to be fired
	0.25, // delay between rounds
	{false}, // condition to end THE BOMBARDMENT before all rounds are fired
	0, // safezone radius - minimal distance from the target position where shells may be directed at
	100, // altitude where the shell will be created
	150, // descending velocity, in m/s. if you use flare as ammo, set it to lower value (1-5) to let it fall down slowly
	[""] // sounds to be played on the incoming shell
]