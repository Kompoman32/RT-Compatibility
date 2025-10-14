params ["_to", "_message"];

_message = trim _message;

if (_message isEqualTo "") exitWith {};

if !(isServer) exitWith {
	[_to, _message] remoteExec ["RT_PAGER_fnc_sendMessage", 2];
};

[_message] remoteExec ["RT_PAGER_fnc_receiveMessage", owner _to];
