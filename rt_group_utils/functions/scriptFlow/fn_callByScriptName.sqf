/** 
  * Calls current function (gets by _fnc_scriptNameParent) in call or spawn on Server or on Local
  * 
  * ATTENTION: dont use it in CBA event handlers
  * 
  * _arguments - arguments goes to script (usually just use _this)
  * _spawn - use Sheduled environment or not (default: false)
  * _onServer - should call/spawn on Server (default: false)
  * _JIP - should use JIP if remoteExec (if _spawn && _onServer && !isServer or !_spawn && canSuspend) (default: false)
  * 
  * ex:
  *    [_this, false, true, true] call RT_Utils_fnc_callByScriptName;
  *     (
  *      if current environment == Local and Unsheduled => 
  *      script wiil remoteExec on Server use JIP and will be in Unsheduled environment
  *     )
  * 
  * @returns Boolean - means you need to interrupt your current script, this function will call or spawn another your function unstance
  */

if ( ["CBA_fnc_", _fnc_scriptNameParent] call BIS_fnc_inString) exitWith {
	diag_log text "[RT_GROUP] ERROR: You cant call RT_Utils_fnc_callByScriptName in CBA functions";
	true
};

params ["_arguments", ["_spawn", false], ["_onServer", false], ["_JIP", false]];

diag_log format ["fn_callByScriptName: %1", [_this, _fnc_scriptNameParent, _fnc_scriptName] ];

if (isServer && !_onServer) then {
	_onServer = true;
};

/*
	true

	FALSE	FALSE	FALSE	FALSE
	FALSE	TRUE	FALSE	FALSE 		_onServer => true
	FALSE	TRUE	TRUE	FALSE
	TRUE	FALSE	FALSE	TRUE
	TRUE	TRUE	FALSE	TRUE		_onServer => true
	TRUE	TRUE	TRUE	TRUE
*/
if (canSuspend == _spawn && isServer == _onServer) exitWith {false};

/*
	spawn

	FALSE	FALSE	FALSE	TRUE
	FALSE	TRUE	TRUE	TRUE
*/
if (!canSuspend && (isServer == _onServer) && _spawn) exitWith {
	_arguments spawn (missionNameSpace getVariable _fnc_scriptNameParent);

	true
};

/*
	remoteExec server

	TRUE	FALSE	TRUE	TRUE
	FALSE	FALSE	TRUE	TRUE
*/
if (!isServer && _onServer && _spawn) exitWith {
	_arguments remoteExec [_fnc_scriptNameParent, 2, _JIP];

	true
};

/*
	remoteExecCall SameMachine

	TRUE	FALSE	FALSE	FALSE
	TRUE	TRUE	TRUE	FALSE
*/
if (canSuspend && (isServer == _onServer) && _spawn) exitWith {
	_arguments remoteExecCall [_fnc_scriptNameParent, clientOwner, _JIP];

	true
};

/*
	remoteExecCall Server

	TRUE	FALSE	TRUE	FALSE
	FALSE	FALSE	TRUE	FALSE
*/
if (!isServer && _onServer && !_spawn) exitWith {
	_arguments remoteExecCall [_fnc_scriptNameParent, 2, _JIP];

	true
};

false


/*
canSuspend	isServer	_onServer	_spawn		RESULT
FALSE		FALSE		FALSE		FALSE		FALSE
FALSE		FALSE		FALSE		TRUE		client spawn
FALSE		FALSE		TRUE		FALSE		remoteExec server call
FALSE		FALSE		TRUE		TRUE		remoteExec server spawn
FALSE		TRUE		FALSE		FALSE		_onServer = true => FALSE
FALSE		TRUE		FALSE		TRUE		_onServer = true => server spawn
FALSE		TRUE		TRUE		FALSE		FALSE
FALSE		TRUE		TRUE		TRUE		server spawn
TRUE		FALSE		FALSE		FALSE		remoteExec server call
TRUE		FALSE		FALSE		TRUE		FALSE
TRUE		FALSE		TRUE		FALSE		remoteExec server call
TRUE		FALSE		TRUE		TRUE		remoteExec server spawn
TRUE		TRUE		FALSE		FALSE		_onServer = true => server spawn
TRUE		TRUE		FALSE		TRUE		_onServer = true => FALSE
TRUE		TRUE		TRUE		FALSE		server spawn
TRUE		TRUE		TRUE		TRUE		FALSE
*/