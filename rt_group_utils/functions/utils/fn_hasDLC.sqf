params ["_dlcName"];
private _dlcs = getDLCs 1;

switch (_dlcName) do {
	// Arma 3 Zeus
	case "Zeus" : { 275700 in _dlcs };
	// Arma 3 Karts
	case "Karts" : { 288520 in _dlcs };
	// Arma 3 Helicopters
	case "Helicopters" : { 304380 in _dlcs };
	// Arma 3 Marksmen
	case "Marksmen" : { 332350 in _dlcs };
	// Arma 3 Apex
	case "Apex" : { 395180 in _dlcs };
	// Arma 3 Jets
	case "Jets" : { 601670 in _dlcs };
	// Arma 3 Malden
	case "Malden" : { 639600 in _dlcs };
	// Arma 3 Laws of War
	case "LawsOfWar" : { 571710 in _dlcs };
	// Arma 3 Tac-Ops Mission Pack
	case "Tac-Ops" : { 744950 in _dlcs };
	// Arma 3 Tanks
	case "Tanks" : { 798390 in _dlcs };
	// Arma 3 Contact 
	case "Contact" : { 1021790 in _dlcs };
	// Arma 3 Art of War
	case "ArtOfWar " : { 1325500 in _dlcs };
	// Arma 3 Creator DLC: GlobalMobilization - Cold War Germany
	case "GlobalMobilization" : { 1042220 in _dlcs };
	// Arma 3 Creator DLC: S.O.G. Prairie Fire
	case "SOG" : { 1227700 in _dlcs };
	// Arma 3 Creator DLC: CSLA Iron Curtain
	case "IronCurtain" : { 1294440 in _dlcs };
	// Arma 3 Creator DLC: Western Sahara
	case "WesternSahara" : { 1681170 in _dlcs };
	// Arma 3 Creator DLC: Spearhead 1944
	case "Spearhead" : { 1175380 in _dlcs };
	// Arma 3 Creator DLC: Reaction Forces
	case "ReactionForces" : { 2647760 in _dlcs };
	default { false };
}
