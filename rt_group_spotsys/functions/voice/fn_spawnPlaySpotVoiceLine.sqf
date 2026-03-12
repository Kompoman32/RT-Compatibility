RT_SPOTSYS_SpotIsPlayingVoice = true; 

[player,1.33] spawn RT_SpotSystem_fnc_spawnPlayMouthAnim; 

private _speakerType = toLower speaker player; 
private _language = _speakerType select [6]; 
private _cardinalName = [getDir player] call RT_SpotSystem_fnc_getCardinalDirectionName; 
private _voiceFileName = format["%1_%2.ogg",_cardinalName,(selectRandom ["1","2"])]; 

private _soundFilePath = switch (_language) do  
{ 
case "rus": {format ["A3\dubbing_radio_f_enoch\data\%1\%2\%3\010_Vehicles\%4",_language,_speakerType,"NORMALContact","veh_unknown_p.ogg"]}; 
case "pol": {format ["A3\dubbing_radio_f_enoch\data\%1\%2\%3\010_Vehicles\%4",_language,_speakerType,"NORMALContact","veh_unknown_p.ogg"]}; 
case "fre": {format ["A3\dubbing_radio_f_exp\data\%1\%2\RadioProtocol%3\%4\010_Vehicles\%5",_language,_speakerType,_language select [0,3],"NORMALContact","veh_unknown_p.ogg"]}; 
case "engfre": {format ["A3\dubbing_radio_f_exp\data\%1\%2\RadioProtocol%3\%4\010_Vehicles\%5",_language,_speakerType,_language select [0,3],"NORMALContact","veh_unknown_p.ogg"]}; 
case "chi": {format ["A3\dubbing_radio_f_exp\data\%1\%2\RadioProtocol%3\%4\010_Vehicles\%5",_language,_speakerType,_language select [0,3],"NORMALContact","veh_unknown_p.ogg"]}; 
default {format ["A3\dubbing_radio_f\data\%1\%2\RadioProtocol%3\%4\010_Vehicles\%5",_language,_speakerType,_language select [0,3],"NORMALContact","veh_unknown_p.ogg"]}; 
}; 

private _soundID = playSound3D [_soundFilePath, player,false,getPosASL player,5,1,100]; 

waitUntil { soundParams _soundID isEqualTo [] }; 

private _soundFilePath = switch (_language) do  
{ 
case "rus": {format ["A3\dubbing_radio_f_enoch\data\%1\%2\%3\DirectionCompass1\%4",_language,_speakerType,"CombatEngage",_voiceFileName]}; 
case "pol": {format ["A3\dubbing_radio_f_enoch\data\%1\%2\%3\DirectionCompass1\%4",_language,_speakerType,"CombatEngage",_voiceFileName]}; 
case "fre": {format ["A3\dubbing_radio_f_exp\data\%1\%2\RadioProtocol%3\%4\DirectionCompass1\%5",_language,_speakerType,_language select [0,3],"CombatEngage",_voiceFileName]}; 
case "engfre": {format ["A3\dubbing_radio_f_exp\data\%1\%2\RadioProtocol%3\%4\DirectionCompass1\%5",_language,_speakerType,_language select [0,3],"CombatEngage",_voiceFileName]}; 
case "chi": {format ["A3\dubbing_radio_f_exp\data\%1\%2\RadioProtocol%3\%4\DirectionCompass1\%5",_language,_speakerType,_language select [0,3],"CombatEngage",_voiceFileName]}; 
default {format ["A3\dubbing_radio_f\data\%1\%2\RadioProtocol%3\%4\DirectionCompass1\%5",_language,_speakerType,_language select [0,3],"CombatEngage",_voiceFileName]}; 
}; 

playSound3D [_soundFilePath, player,false,getPosASL player,5,1,100]; 

sleep 20; 

RT_SPOTSYS_SpotIsPlayingVoice = false; 