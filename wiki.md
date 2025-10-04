
# Функции
## Примечание 
**Unsheduled*** и **Sheduled*** - означает, что функция сама вызовет в нужном Environment.
т.е. если стоит Sheduled*, а функцию вызвали через call, то функция сама вызовет себя через spawn, а если вызвали через spawn, то никаких дополнительных spawn не вызовется и возвращённый Script Handle будет указывать на этот вызов.


> [!CAUTION]
> Пожалуйста, не забывайте запускать на сервере ```[] call RT_Spectator_fnc_initServer;```, чтобы при выходе из режима наблюдателя  пропадала подсказка на экране.
> Также чтобы её убрать можно вызвать ```[] remoteExec ["RT_Spectator_fnc_removeSpectator", 0, false];```


## rt_group_animations
###  RT_Animations_fnc_act
**Описание**: Заставляет Юнит выполнить анимацию Действия.

**Локальность**: Loc A, Glob E

**Environment**: Sheduled*

**Параметры**: 
 1. _unit - Юнит
 2. _anim -  Наименование танца (анимации) (см. в rt_group_animations в CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Actions (все вложенные))

**Возвращает**: <ничего>

**Примеры**: 

```sqf
[_unit, "rt_exercisePushup"] spawn RT_Animations_fnc_act;
```
 
###  RT_Animations_fnc_stopActing
**Описание**: Заставляет Юнит остановить анимацию Действия.

**Локальность**: Loc A, Glob E

**Environment**: Sheduled*

**Параметры**: 
 1. _unit - Юнит

**Возвращает**: <ничего>

**Примеры**: 

```sqf
[_unit] spawn RT_Animations_fnc_stopActing;
```
 
 ### RT_Animations_fnc_isActing
**Описание**: Проверяет делает ли юнит какую-то анимацию Действия (проверят по списку Действий).

**Локальность**: Loc A

**Environment**: Unsheduled

**Возвращает**: Boolean

**Параметры**: 
 1. _unit - Юнит
 2. _anim - Проверить конкретную анимацию (default: nil) (см. в rt_group_animations в CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Actions (все вложенные))


**Примеры**: 

```sqf
[_unit] call RT_Animations_fnc_isActing; // true
[_unit, "rt_exercisePushup"] call RT_Animations_fnc_isActing; // false
```


###  RT_Animations_fnc_dance
**Описание**: Заставляет Юнит выполнить анимацию Танца.

**Локальность**: Loc A, Glob E

**Environment**: Sheduled*

**Параметры**: 
 1. _unit - Юнит
 2. _anim -  Наименование танца (анимации) (см. в rt_group_animations в CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Dances (все вложенные))

**Возвращает**: <ничего>

**Примеры**: 

```sqf
[_unit, "A3_Dance2"] spawn RT_Animations_fnc_dance;
```
 
###  RT_Animations_fnc_stopDancing
**Описание**: Заставляет Юнит остановить анимацию Танца.

**Локальность**: Loc A, Glob E

**Environment**: Sheduled*

**Параметры**: 
 1. _unit - Юнит

**Возвращает**: <ничего>

**Примеры**: 

```sqf
[_unit] spawn RT_Animations_fnc_stopDancing;
```
 
 ### RT_Animations_fnc_isDancing
**Описание**: Проверяет делает ли юнит какую-то анимацию Танца (проверят по списку Танцев).

**Локальность**: Loc A

**Environment**: Unsheduled

**Параметры**: 
 1. _unit - Юнит
 2. _anim - Проверить конкретную анимацию (default: nil) (см. в rt_group_animations в CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Dances (все вложенные))

**Возвращает**: Boolean


**Примеры**: 

```sqf
[_unit] call RT_Animations_fnc_isDancing; // true
[_unit, "A3_Dance2"] call RT_Animations_fnc_isDancing; // false
```


###  RT_Animations_fnc_emote
**Описание**: Заставляет Юнит выполнить жест Эмоции.

**Локальность**: Loc A, Glob E

**Environment**: Sheduled*

**Параметры**: 
 1. _unit - Юнит
 2. _anim -  Наименование танца (анимации) (см. в rt_group_animations в CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Emotes (все вложенные))

**Возвращает**: <ничего>

**Примеры**: 

```sqf
[_unit, "A3_Dance2"] spawn RT_Animations_fnc_emote;
```
 
###  RT_Animations_fnc_stopEmoting
**Описание**: Заставляет Юнит остановить жест Эмоции.

**Локальность**: Loc A, Glob E

**Environment**: Sheduled*

**Параметры**: 
 1. _unit - Юнит

**Возвращает**: <ничего>

**Примеры**: 

```sqf
[_unit] spawn RT_Animations_fnc_stopEmoting;
```
 
 ### RT_Animations_fnc_isEmoting
**Описание**: Проверяет делает ли юнит какой-то жест Эмоции (проверят по списку Эмоциий).

**Локальность**: Loc A

**Environment**: Unsheduled

**Параметры**: 
 1. _unit - Юнит
 2. _anim - Проверить конкретную эмоцию (default: nil) (см. в rt_group_animations в CfgVehicles >> CAManBase >> ACE_SelfActions >> RT_Animations >> Emotes (все вложенные))

**Возвращает**: Boolean

**Примеры**: 

```sqf
[_unit] call RT_Animations_fnc_isEmoting; // true
[_unit, "tsp_animate_loser_loop"] call RT_Animations_fnc_isEmoting; // false
```



## rt_group_dialog
###  RT_DialogSystem_fnc_OpenDialog
**Описание**: Открывает диалоговую систему, заданную специальным типо данных.

**Локальность**: Loc A

**Environment**: Sheduled

**Параметры**: 
 1. _target - Персонаж с которым открывается диалог (напр. Торговец)
 2. _dialogOptions - Массив со всеми возможными строчками диалога, имещуюие тип DialogItem (см. Типы данных)

**Возвращает**: <ничего>

**Типы данных**: 

```sqf
DialogItem (HashMap):
	id: <HashMapKey> -  ключ этого item'а, для последующей идентификации
	text: <string || TEXT> - текст, который говорит Speaker (можно использовать Structured Text)
	sound: <string> - название файла звука речи Speaker из CfgSounds
	textTime: <Number> - Длительность отображаемого текста (в основном должна соответствовать длине звукового файла)
	next: <HashMapKey || CODE> - ключ следующей строчки, которую надо будет отобразить после этой, (если есть options, То не учитывается)
		Если CODE,то он должен возвращать этот ключ. 
		Аргументы передающиеся внутрь:
			0: _speaker - соответвует Speaker
			1: _hash - переданный список всех DialogItem, запакованный в createHashMap, по id
			2: _stage - этот DialogItem
	nextSilent: <Boolean> - Выключает звук на следующей строчке (и пропускает строчку, если нет options).
	callbackBefore: <CODE> - код выполняющийся перед произношением фразы (после установки текста в Control с текстом Speaker'а)
		Аргументы передающиеся внутрь:
			0: _speaker - соответвует Speaker
			1: _hash - переданный список всех DialogItem, запакованный в createHashMap, по id
			2: _stage - этот DialogItem
	callbackAfter: <CODE> - код выполняющийся после произношения фразы (после установки текста в Control с текстом Speaker'а и во все Control'ы с Опциями диалога)
		Аргументы передающиеся внутрь:
			0: _speaker - соответвует Speaker
			1: _hash - переданный список всех DialogItem, запакованный в createHashMap, по id
			2: _stage - этот DialogItem
	options: <ARRAY<DialogItemOption>> - Опции, если нужно сделать диалог и требуется ответ пользователя

DialogItemOption (HashMap):
	text: <string> - текст который отображается в кнопке.
	condition: <CODE> - Код с условием показа кнопки, если true, то кнопка отображается,иначе нет
	conditionDisabled: <CODE>  - Код с условием блокировки кнопки, если возвращается true, то кнопка заблокирована
	textDisabled: <string> - текст который отображается в кнопке, если conditionDisabled возвращает true (если не задано, то берё1тся text)
	next: <Number || CODE> - ключ следующей строчки, которую надо будет отобразить после этой.
		Если CODE,то он должен возвращать этот ключ. 
		Аргументы передающиеся внутрь:
			0: _speaker - соответвует Speaker
			1: _hash - переданный список всех DialogItem, запакованный в createHashMap, по id
			2: _stage - этот DialogItem
			3: _option - этот DialogItemOption
	callback: <CODE> - код выполняющийся при нажатии на кнопку (До перехода к следующему пункту)
		Аргументы передающиеся внутрь:
			0: _speaker - соответвует Speaker
			1: _hash - переданный список всех DialogItem, запакованный в createHashMap, по id
			2: _stage - этот DialogItem
			3: _option - этот DialogItemOption
```

**Примеры**: 

```sqf
_arguments = [
	createHashMapFromArray [
		["id", 0], 
		["text", parseText "<t size='5' color='#ff0000'>Привет<t><br/><t size='2' color='#ffffff'>хочешь купить что-нибудь?</t>"],
		["sound", "shopOwnerHello"],
		// ["soundArgs", [100, 1, 2, 0]],
		["textTime", 1.66],
		["callbackBefore", {systemChat "Приветственная фраза началась"}],
		["callbackAfter", {systemChat "Приветственная фраза закончилась"}],
		["options", [
			createHashMapFromArray [
				["text", "Да, хочу Хлеб"],
				["next", 1],
				["callback", {systemChat "Нажали на Хлеб"}]
			],
			createHashMapFromArray [
				["text", "Да, хочу Сыр"],
				["condition", {NeedCheese}],
				["conditionDisabled", {
					params ["_speaker", "_hash", "_stage", "_option"];

					_speaker getVariable ["cheeseCount", 2] <= 0
				}],
				["textDisabled", "Да, хочу Сыр (Сыр закончился)"],
				["next", {
					params ["_speaker", "_hash", "_stage", "_option"];

					if (_speaker getVariable ["cheeseCount", 2] != 2) exitWith { 21};

					2 
				}],
				["callback", {}]
			],
			createHashMapFromArray [
				["text", "Да, хочу Колбасу"],
				["next", 3], 
				["callback", {systemChat "Нажали на Колбасу"}]
			],
			createHashMapFromArray [
				["text", "Пока"],
				["next", -1],
				["callback", {systemChat "Нажали на Пока"}]
			],
			createHashMapFromArray [
				["text", "Пока"],
				["next", -1],
				["callback", {systemChat "Нажали на Пока"}]
			],
			createHashMapFromArray [
				["text", "Пока"],
				["next", -1],
				["callback", {systemChat "Нажали на Пока"}]
			],
			createHashMapFromArray [
				["text", "Пока"],
				["next", -1],
				["callback", {systemChat "Нажали на Пока"}]
			],
			createHashMapFromArray [
				["text", "Пока"],
				["next", -1],
				["callback", {systemChat "Нажали на Пока"}]
			]
		]]
	],
	createHashMapFromArray [
		["id", 1],
		["text", "Вот тебе хлеб, свеженкий, только из печки"],
		["sound", "shopOwnerBread"],
		["textTime", 2.5],
		["next", 0],
		["nextSilent", true],
		["callbackBefore", {systemChat "Фраза про Хлеб началась"}],
		["callbackAfter", {systemChat "Фраза про Хлеб закончилась"}]
	],
	createHashMapFromArray [
		["id", 2],
		["text", "Вот тебе сыр... козий, как ты любишь. Из самого Ореокастро!"],
		["sound", "shopOwnerCheese"],
		["textTime", 4.2],
		["next", 0],
		["callbackBefore", {systemChat "Фраза про Сыр началась"}],
		["callbackAfter", {
			systemChat "Фраза про Сыр закончилась";
		
			params ["_speaker", "_hash", "_stage"];
			_cheeseCountLeft = (_speaker getVariable ["cheeseCount", 2]) - 1;
			systemChat format ["Вам выдали Сыр. Осталось %1", _cheeseCountLeft];

			_speaker setVariable ["cheeseCount", _cheeseCountLeft];
		}]
	],
	createHashMapFromArray [
		["id", 21],
		["text", "Ты же уже купил Сыр. Тебе второй нужен? Ну ладно, держи."],
		["sound", "shopOwnerCheese2"],
		["textTime", 4.3],
		["next", 0],
		["callbackBefore", {systemChat "Фраза про Сыр 2 началась"}],
		["callbackAfter", {
			systemChat "Фраза про Сыр 2 закончилась";
		
			params ["_speaker", "_hash", "_stage"];
			_cheeseCountLeft = (_speaker getVariable ["cheeseCount", 2]) - 1;
			systemChat format ["Вам выдали Сыр. Осталось %1", _cheeseCountLeft];

			_speaker setVariable ["cheeseCount", _cheeseCountLeft];
		}]
	],
	createHashMapFromArray [
		["id", 3],
		["text", "Держи колбасу, докторскую, сегодня она ничё такая!"],
		["sound", "shopOwnerSausage"],
		["textTime", 4.1],
		["next", 0],
		["callbackBefore", {systemChat "Фраза про Колбасу началась"}],
		["callbackAfter", {systemChat "Фраза про Колбасу закончилась"}]
	]
];

[_target, _dialogOptions] spawn RT_DialogSystem_fnc_OpenDialog;
```
## rt_group_items
###  RT_Items_fnc_createItemStah
**Описание**: Создаёт в точке и в выбранном направлении (или если передать объект, то в его позиции и направлении) groundweaponholder с описанными предметами.

**Локальность**: Glob A, Glob E

**Environment**: Sheduled* (ONLY SERVER)

**Параметры**: 
 1. _posOrObj - Позиция и направление ( [x, y, z, _direction] ) или Объект, позицию и направление которого надо использовать
 2. _items - Список предметов типа ItemDesc  (см. Типы данных).

**Возвращает**: <ничего>

**Типы данных**: 

```sqf
ItemDesc - массив [_itemName, _itemCount, _isBackpack]:
	1. _itemName - тип предмета (Class) (напр. "30Rnd_65x39_caseless_mag")
	2. _itemCount - количество предметов этого типа
	3. _isBackpack - используется если надо добавить Рюкзаки (default: false)
```

**Примеры**: 

```sqf
  [_posOrObj,
      [
          ["30Rnd_65x39_caseless_mag", 5],
          ["Item_U_Rangemaster", 1],
          ["B_Carryall_ocamo", 2, true]
      ]
  ] call RT_Items_fnc_createItemStash;
```

###  RT_Items_fnc_createResupply
**Описание**: Создаёт в ящике указанное количество боеприпасов для всех орудий (если есть) **каждого** игрока.

**Локальность**: Glob A, Glob E

**Environment**: Sheduled* (на сервере)

**Параметры**: 
 1. _ammoBox - Ящик, куда добавлять патроны.
 2. _numPrim - Количество боеприпасов Основного оружия. (default: 10)
 3. _numHand - Количество боеприпасов оружия в пистолетном слоте. (default: 2)
 4. _numSec - Количество боеприпасов оружия в Launcher слоте. (default: 2)
 5. _numUndBar - Количество боеприпасов подствольника Основного оружия. (default: 2)

**Возвращает**: <ничего>

**Примеры**: 

```sqf
Если на сервере 3 игрока:
	[_ammoBox, 5, 3, 1, 1] call RT_Items_fnc_createResupply; 
	/*
		5 для Основого оружия 1го игрока + 5 для Основого оружия 2го игрока + 5 для Основого оружия 3го игрока.
		3 для Пистолета 1го игрока + 3 для Пистолета 2го игрока + 3 для Пистолета 3го игрока.
		1 для Лаунчера 1го игрока + 1 для Лаунчера 2го игрока + 1 для Лаунчера 3го игрока.
		1 для Подствольника 1го игрока (если есть) + 1 для Подствольника 2го игрока (если есть) + 1 для Подствольника 2го игрока (если есть).
	*/

  [_ammoBox, 2, 0, 0, 0] call RT_Items_fnc_createResupply; // Только 3 магазина для Основного оружия (для каждого игрока)
```

## rt_group_music
###  RT_Music_fnc_setupMusic
**Описание**:  Включает плейлист с музыкой с определённым типо музыки (активная, спокойная).

**Локальность**: Glob E

**Environment**: Unsheduled

**Параметры**: 
 1. _musicKind - тип музыки ("pause", "calm", "action"). (default: "pause")
 2. _fadeTime - сколько секунд дать для затухания музыки. (default: 5)

**Возвращает**: <ничего>

**Примеры**: 
```sqf
["action", 6] call RT_Music_fnc_setupMusic; // Музыка переключиться через 6 секунд затухания + 6 секунд нарастания.

[] call RT_Music_fnc_setupMusic; // Музыка остановится.
```

## rt_group_pause
###  RT_Pause_fnc_stopstart
**Описание**:  Останавливает/запускает симуляцию для игроков. (Для сценариев можно установить юнитов зевса
 ```missionNamespace setVariable [RT_PAUSE_VAR_IGNORE_UNITS, [zeus]];```, чтобы не прокидывать второй аргумент)

**Локальность**: Glob A, Glob E

**Environment**: Unsheduled

**Параметры**: 
 1. _stop - остановить или продолжить симуляцию
 2. _ignoreUnits - Юниты для игнорирования остановки. (default: missionNamespace getVariable [RT_PAUSE_VAR_IGNORE_UNITS, []])

**Возвращает**: <ничего>

**Примеры**: 
```sqf
[true] call RT_Pause_fnc_stopstart; // игра приостановится
[true, [z1]] call RT_Pause_fnc_stopstart; // игра приостановится, но не для z1
[false] call RT_Pause_fnc_stopstart; // игра продолжается
```

## rt_group_spectator
### RT_Spectator_fnc_initServer
**Описание**:  Настраивает хэндлеры для режима Наблюдателя на Сервере.

**Локальность**: Glob E

**Environment**: Sheduled* (на сервере)

**Параметры**: 
<Отсутствуют>

**Примеры**: 
```sqf
[] call RT_Spectator_fnc_initServer;
```

### RT_Spectator_fnc_removeSpectator
**Описание**:  Убирает подсказку о Режиме Наблюдателя (если такая необходимость есть (если залагало и она осталась на экране после пробуждения)).

**Локальность**: Loc E

**Environment**: Unsheduled

**Параметры**: 
 1. _onlyMessage - убрать только сообщение (не выводить из режима наблюдаетля) (default: false)

**Возвращает**: <ничего>

**Примеры**: 
```sqf
[true] call RT_Spectator_fnc_removeSpectator; // Если нужно убрать только сообщение
[] call RT_Spectator_fnc_removeSpectator; // Если нужно убрать сообщение и вывести из режима Наблюдателя
```

### RT_Spectator_fnc_spectatorGetQuote
**Описание**:  Получает случайную цитату (которые показываются в Unconsious состоянии) в соответсвии с текущими настройками (см Настройки Spectator Quotes):

* RT_SETTINGS_SPECTATOR_enable_quotes - Включить цитаты (функция на неё никак не реагирует)
* RT_SETTINGS_SPECTATOR_enable_add_fun_quotes - Добавлять FUN цитаты в выборку (если включено, то будут выдаваться и FUN цитаты)
* RT_SETTINGS_SPECTATOR_enable_only_fun_quotes - Добавлять ТОЛЬКО FUN цитаты в выборку (если включено, то будут выдаваться ТОЛЬКО FUN цитаты)
  
Цитата будет переведена в соответствии с текущей локализацией.

**Локальность**: Loc E

**Environment**: Unsheduled

**Параметры**: 
 <Отсутствуют>

**Возвращает**: [string, string] // [_quote, _author]

**Примеры**: 
```sqf
[] call RT_Spectator_fnc_spectatorGetQuote; // ["War. War never changes", "Fallout"]
```

## rt_group_support
###  RT_Support_fnc_expressArtillery
**Описание**:  Через некоторое время создаёт удар артиллерии на месте предмета. **После этого удаляет этот предмет**. (используется для броска красного дыма)

**Локальность**: Loc A, Glob E

**Environment**: Sheduled*

**Параметры**: 
1. _projectile -  предмет для отслеживания позиции.
2. _params - параметры задержки удара артилерии и параметры самого удара. (ArtParams, см. Типы данных)

**Возвращает**: <ничего>

**Типы данных**: 
```sqf
ArtParams:
	1. _sleepTime - Время задержки удара. (default: 10)
	(...params from BIS_fnc_fireSupportVirtual)
	2. _ammo = ammo. (default: "Sh_82mm_AMOS")
	3. _radius = radius. (default: 50)
	4. _rounds = rounds. (default: 12)
	5. _roundsDelay = delay. (default: 0.25)
	6. _conditionEnd = conditionEnd. (default: {false})
	7. _safezoneRadius = safezone. (default: 0)
	8. _altitude = alt. (default: 100)
	9. _roundSpeed = speed. (default: 150)
	10. _sounds = sounds. (default: [""])
```

**Примеры**: 
```sqf
[_projectile] call RT_Units_fnc_expressArtillery;

[_projectile, [5, "Sh_82mm_AMOS", 300, 20, 0.5, {false}, 100, 100, 200, [""]] ] call RT_Units_fnc_expressArtillery;
```

###  RT_Support_fnc_fireSupportVirtualSquare
**Описание**:  Как стрельба BIS_fnc_fireSupportVirtual, но позволяет задать прямоугольные зоны обстрела и safe-зоны.

**Локальность**: Glob A, Glob E

**Environment**: Sheduled

**Параметры**: 
1. _virtualSupportParams -  настройки из BIS_fnc_fireSupportVirtual (см его параметры).
2. _bombArea - Зона обстрела BombAreaParams. (см. Типы данных)
3. _safeArea - Зона куда не будет вестись обстрел BombAreaParams. (см. Типы данных)

**Возвращает**: <ничего>

**Типы данных**: 
```sqf
BombAreaParams:
	Задаётся 4мя или 5ю параметрами схожими с тем, что возвращает функция BIS_fnc_getArea. [_center, _a, _b, _angle, _isRectangle]:
	1. _center - центр квадрата обстрела
	2. _a - радиус от центра по горизонтальной оси (см setTriggerArea).
	3. _b - радиус от центра по перпендикулярной оси (см setTriggerArea).
	4. _angle - угол поворота зоны вокруг Z оси, относительно положительного направления оси Y.
	5. _isRectangle -  является ли зона прямоугольником. (default: true)
```

**Примеры**: 
```sqf
[[BIS_Player,nil,100,24,10], (_trigger call BIS_fnc_getArea) select [0, 5]] spawn RT_Support_fnc_fireSupportVirtualSquare;

[[BIS_Player,"Sh_82mm_AMOS",100,24,10], [[0,0,0], 10,10, 0], [0,0,0], 0,0, 0]] spawn RT_Support_fnc_fireSupportVirtualSquare;

[[[3600,3600,0],"Sh_82mm_AMOS",100,24,10], [[0,0,0], 10,10, 0, false], [0,0,0], 0,0, 0]] spawn RT_Support_fnc_fireSupportVirtualSquare;
```


## rt_group_units

###  RT_Units_fnc_addCarry
**Описание**:  Добавлят возможность таскать юнита с помощью ACE Carry/Drag.

**Локальность**: Glob A, Glob E

**Environment**: Unsheduled

**Параметры**: 
 1. _unit - юнит.

**Возвращает**: Созданный ACE action

**Примеры**: 
```sqf
_unit_ call RT_Units_fnc_addCarry; // ACE action
```

###  RT_Units_fnc_enemyWaves
**Описание**:  Отправляет группы врагов с постоянной охотой на случайного игрока.
(для остановки использовать Script Handle который лежит в missionNamespace в переменной RT_UNITS_VAR_ENEMY_WAVES_HANDLER).
```sqf
(исполнить на сервере для остановки)

terminate (missionNamespace getVariable [RT_UNITS_VAR_ENEMY_WAVES_HANDLER])
```

**Локальность**: Glob A, Glob E

**Environment**: Sheduled* (на сервере)

**Параметры**: 
1. _availableTargets -  Доступные цели для охоты. (default: [] call RT_Utils_fnc_getAllPlayersWithoutCurators)
2. _endless - бесконечно спавнить новую волну, если предыдущий отряд погиб (или остался 1 в группе). (default: false)
3. _safeRadius - радиус в котором нельзя генерировать волну. (default: 200)
4. _maxHuntingDistance - максимальная дистанция до цели, выше которой отряд удаляется, чтобы отряд далеко не шёл. (default: 550)
5. _groupOptions - опции настройки спавная группы.  (см. аргументы BIS_fnc_spawnGroup)  (default: [])
6. _processGroupCode - код, который выполняется после спавна группы, для её дополнительной настройки
```sqf
default:
{
	private _group = _this;

	{
		_x setSkill [ "general", 1 ];
		_x setSkill [ "courage", 1 ];
		_x setSkill [ "aimingAccuracy", 0.15 ];
		_x setSkill [ "aimingShake", 1 ];
		_x setSkill [ "aimingSpeed", 1 ];
		_x setSkill [ "commanding", 1 ];
		_x setSkill [ "spotDistance", 1 ];
		_x setSkill [ "spotTime", 1 ];
		_x setSkill [ "reloadSpeed", 1 ];
		_x setUnitPos "UP";
		_x disableAI "AUTOCOMBAT";
		_x allowFleeing 0;

	} forEach ( units _group );

	_group setSpeedMode "NORMAL";
	_group setFormation "FILE";
}
```

**Возвращает**: <ничего>

**Примеры**: 
```sqf
[] call RT_Units_fnc_enemyWaves;

[nil, false, 500, 1000, [], { _this setSpeedMode "NORMAL" }] call RT_Units_fnc_enemyWaves;

[[unit1, unit2], nil, 700, nil, nil, { _this setSpeedMode "NORMAL" }] call RT_Units_fnc_enemyWaves;
```

## rt_group_utils
### ==== Checking ====
###  RT_Utils_fnc_hasDLC
**Описание**:  Проверяет есть ли у Игрока **какой-нибудь** DLC из списка. (выполнгяется локально на машине пользователя)

**Локальность**: Loc A

**Environment**: Unsheduled

**Параметры**: 
Список DLC для проверки, есть ли **какой-нибудь** из них у игрока.
```sqf
Доступные значения:
"Zeus" - Arma 3 Zeus
"Karts" - Arma 3 Karts
"Helicopters" - Arma 3 Helicopters
"Marksmen" - Arma 3 Marksmen
"Apex" - Arma 3 Apex
"Jets" - Arma 3 Jets
"Malden" - Arma 3 Malden
"LawsOfWar" - Arma 3 Laws of War
"Tac-Ops" - Arma 3 Tac-Ops Mission Pack
"Tanks" - Arma 3 Tanks
"Contact" - Arma 3 Contact 
"ArtOfWar" - Arma 3 Art of War
"GlobalMobilization" - Arma 3 Creator DLC: GlobalMobilization - Cold War Germany
"SOG" - Arma 3 Creator DLC: S.O.G. Prairie Fire
"IronCurtain" - Arma 3 Creator DLC: CSLA Iron Curtain
"WesternSahara" - Arma 3 Creator DLC: Western Sahara
"Spearhead" - Arma 3 Creator DLC: Spearhead 1944
"ReactionForces" - Arma 3 Creator DLC: Reaction Forces
"ExpeditionaryForces" - Arma 3 Creator DLC: Expeditionary Forces
```

**Возвращает**: Boolean

**Примеры**: 
```sqf
["Apex"] call RT_Utils_fnc_hasDLC; // Есть ли у игрока DLC Apex

["Helicopters", "Jets"] call RT_Utils_fnc_hasDLC; // Есть ли у игрока DLC Helicopters ИЛИ Jets
```

###  RT_Utils_fnc_hasACE
**Описание**:  Проверяет есть ли у Игрока мод ACE. (выполняется локально на машине пользователя)

**Локальность**: Loc A

**Environment**: Unsheduled

**Параметры**: 
<Отсутствуют>

**Возвращает**: Boolean

**Примеры**: 
```sqf
[] call RT_Utils_fnc_hasACE; // Есть ли у игрока ACE
```

###  RT_Utils_fnc_dontHasACE
**Описание**:  Проверяет отсутствует ли у Игрока мод ACE. (выполняется локально на машине пользователя) **(ФУНКЦИЯ ОБРАТНАЯ RT_Utils_fnc_hasACE)**

**Локальность**: Loc A

**Environment**: Unsheduled

**Параметры**: 
<Отсутствуют>

**Возвращает**: Boolean

**Примеры**: 
```sqf
[] call RT_Utils_fnc_dontHasACE; // Отсутствует ли у игрока ACE
```

###  RT_Utils_fnc_isAdmin
**Описание**:  Проверяет админ ли текущая машина

**Локальность**: <Отсутствуют>

**Environment**: Unsheduled

**Параметры**: 
<Отсутствуют>

**Возвращает**: Boolean

**Примеры**: 
```sqf
[] call RT_Utils_fnc_isAdmin; // Админ ли текущая машина
```

###  RT_Utils_fnc_isZeus
**Описание**:  Проверяет является ли текущий игрок Зевсом

**Локальность**: <Отсутствуют>

**Environment**: Unsheduled

**Параметры**: 
<Отсутствуют>

**Возвращает**: Boolean

**Примеры**: 
```sqf
[] call RT_Utils_fnc_isAdminOrZeus; // Текущий игрок имеет Зевс
```

###  RT_Utils_fnc_isAdminOrZeus
**Описание**:  Проверяет админ ли текущая машина или является ли текущий игрок Зевсом

**Локальность**: <Отсутствуют>

**Environment**: Unsheduled

**Параметры**: 
<Отсутствуют>

**Возвращает**: Boolean

**Примеры**: 
```sqf
[] call RT_Utils_fnc_isAdminOrZeus; // Админ ли текущая машина или текущий игрок имеет Зевс
```

### ==== Utils ====
###  RT_Utils_fnc_skipTime
**Описание**:  Проматывает время, ускоряя скорость течения игрового времени.

**Локальность**: Loc A

**Environment**: Sheduled* (на сервере)

**Параметры**: 
1. _hours -  какое количество часов промотать

**Возвращает**: <ничего>

**Примеры**: 
```sqf
[6] call RT_Utils_fnc_skipTime; // время ускорится, прмотается 6 часов, затем вернётся к привычной скорости
```

###  RT_Utils_fnc_timer
**Описание**:  Отсчитывает некоторое время и показывает подсказку об оставшемся времени на экране (hintSilent).

**Локальность**: Loc A

**Environment**: Unsheduled

**Параметры**: 
1. _time - время для отсчёта. (в секундах)
2. _text - текст для подсказки. (%1 заменится на время в формате MM:SS )

**Возвращает**: <ничего>

**Примеры**: 
```sqf
[120, "You need to defend this position! \n Time Left: \n %1"] remoteExec ["RT_Utils_fnc_timer", 0, true]
```

###  RT_Utils_fnc_stopTimer
**Описание**:  Останавливает таймер, запущенный функцией **RT_Utils_fnc_timer**.

**Локальность**: Loc A

**Environment**: Unsheduled

**Параметры**: 
<Отсутствуют>

**Возвращает**: <ничего>

**Примеры**: 
```sqf
[] remoteExec ["RT_Utils_fnc_stopTimer", 0, true]
```

###  RT_Utils_getAllPlayersWithoutCurators
**Описание**:  Возвращает список юнитов Игроков, исключая юниты, принадлежащие Зевсам.

**Локальность**: Loc A

**Environment**: Unsheduled

**Параметры**: 
<Отсутствуют>

**Возвращает**: Array юнитов игроков (исключая юниты Зевсов)

**Примеры**: 
```sqf
call RT_Utils_fnc_getAllPlayersWithoutCurators; // если на сервере player1, player2, zeus1 то возвращается [player1, player2]
```

###  RT_Utils_getAllCuratorUnits
**Описание**:  Возвращает список юнитов, принадлежащих Зевсам.

**Локальность**: Loc A

**Environment**: Unsheduled

**Параметры**: 
<Отсутствуют>

**Возвращает**: Array юнитов Зевсов

**Примеры**: 
```sqf
call RT_Utils_getAllCuratorUnits; // если на сервере player1, player2, zeus1 то возвращается [zeus1]
```

## rt_group_vehicles
###  RT_Vehicles_fnc_isSafelyParked
**Описание**:  Определяет, правильно ли припаркован транспорт (например вертолет, приземлившийся на здание, лодка (выброшенная на берег или нет) и подводная лодка (под водой или нет)). Также работает и на юнитов. Возвращает false, если _vehicle == null, disabled или уничтожен.


**Локальность**: Glob A

**Environment**: Unsheduled

**Параметры**: 
1. _vehicle - транспорт
2. _altitudeTolerance - погрешность в высоте (в метрах) (default: 0.1) 
3. _velocityTolerance - погрешность в скоросте (в км/ч) (default: 0.1) 

**Возвращает**: Boolean

**Примеры**: 
```sqf
[_car, 0.1, 0.1] call RT_Vehicles_fnc_isSafelyParked; // true
```


