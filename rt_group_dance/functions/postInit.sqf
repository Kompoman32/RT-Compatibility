/** Script Works Only with Ace */
if ([] call RT_UTILS_fnc_dontHasAce) exitwith {};

_this spawn {
	[] call RT_UTILS_fnc_waitUntilPlayerInit;

	// Отключение танцев при закрытии ACE Menu
	[player, "ace_interactMenuClosed", RT_DANCE_VAR_CHECK_HANDLER, {
		// Проверям что есть танцы
		if (!([player] call RT_Dance_fnc_isDancing))  exitWith {};

		[player] call RT_Dance_fnc_StopDance;
	}] call Rt_Utils_fnc_addCBAEventhandler;

	// Creating Actions Recursively
	private _createDances = {
		params ["_createDances", "_actionName", "_name", ["_childDances", []]];

		private _insertChildren = {};
		private _code = {};
		private _condition = {true};

		if (count _childDances > 0) then {
			_insertChildren = {
				params ["_target", "_player", "_params"];
				_params params ["_createDances", "_danceAnim", ["_childDances", []]];

				_childDances apply {
					private _params = [_createDances];
					{ _params pushBack _x } forEach _x;

					
					[_params call _createDances, [], _target]	
					
				}
			}
		} else {
			_code = {
				params ["_target", "_player", "_params"];
				_params params ["_createDances", "_danceAnim", ["_childDances", []]];

				[_player, _danceAnim] call RT_DANCE_fnc_Dance;
			};

			_condition = {
				params ["_target", "_player", "_params"];
				_params params ["_createDances", "_danceAnim", ["_childDances", []]];
				// true

				// if (count _childDances) exitWith {true};

				!(animationState _player == _danceAnim)
			};
		};


		[format ["RT_DANCE_%1", _actionName], _name , "", _code, _condition, _insertChildren, [_createDances, _actionName, _childDances]] call ace_interact_menu_fnc_createAction
	};

	private _insertChildren = {
		params ["_target", "_player", "_createDances"];
		RT_DANCE_AVAILABLE_DANCES apply {
			private _params = [_createDances];
			{ _params pushBack _x } forEach _x;

			
			[_params call _createDances, [], _target]
		}
	};

	// Main Action
	private _condition = {
		params ["_target", "_player", "_params"];

		RT_DANCE_ALLOWED && [player,objNull,[]] call ACE_common_fnc_canInteractWith
	};

	private _action = ["RT_DANCE_MAIN", "Dancing", "", {}, _condition, _insertChildren, _createDances] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject; 

	private _code = {
		params ["_target", "_player", "_params"];

		[_player] call RT_DANCE_fnc_StopDance;
	};


	// Stop Dancing!
	_condition = {
		params ["_target", "_player", "_params"];
		[_player] call RT_Dance_fnc_isDancing
	};

	_action = ["RT_DANCE_STOP", "Stop Dancing!", "", _code, _condition] call ace_interact_menu_fnc_createAction;
	[player, 1, ["ACE_SelfActions","RT_DANCE_MAIN"], _action] call ace_interact_menu_fnc_addActionToObject;

}
