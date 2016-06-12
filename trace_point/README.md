# TracePoint
提供了跟`Kernel#set_trace_func`一样功能(跟踪Ruby程序的运行状态)的面向对象的API

## the events
```
:line
execute code on a new line

:class
start a class or module definition

:end
finish a class or module definition

:call
call a Ruby method

:return
return from a Ruby method

:c_call
call a C-language routine

:c_return
return from a C-language routine

:raise
raise an exception

:b_call
event hook at block entry

:b_return
event hook at block ending

:thread_begin
event hook at thread beginning

:thread_end
event hook at thread ending

:fiber_switch
event hook at fiber switch
```
