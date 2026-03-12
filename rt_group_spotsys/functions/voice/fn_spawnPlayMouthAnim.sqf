params ["_unit","_time"]; 

comment "Make mouth move for some time"; 
[_unit,true] remoteExec ["setRandomLip"];  

sleep _time;  

[_unit,false] remoteExec ["setRandomLip"];  