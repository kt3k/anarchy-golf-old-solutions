-module(a).
-export([m/0]).
m()->io:fwrite("~s",[os:cmd(dd)]).