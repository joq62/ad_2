%%% -------------------------------------------------------------------
%%% @author  : Joq Erlang
%%% @doc: : 
%%% Created :
%%% Node end point  
%%% Creates and deletes Pods
%%% 
%%% API-kube: Interface 
%%% Pod consits beams from all services, app and app and sup erl.
%%% The setup of envs is
%%% -------------------------------------------------------------------
-module(all).      
 
-export([start/0]).



%% --------------------------------------------------------------------
%% Include files
%% --------------------------------------------------------------------

%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
start()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),
    
    ok=setup(),
    io:format("Test OK !!! ~p~n",[?MODULE]),
%    timer:sleep(1000),
%    init:stop(),
    ok.

%%--------------------------------------------------------------------
%% @doc
%% 
%% @end
%%--------------------------------------------------------------------
py_test()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME,?LINE}]),
    {ok,P}=python:start([{python,"python3"},{python_path,["py"]}]),
    python:call(P,xx,main,[]),
    44=2+python:call(P,xx,add,[20,22]),
    44=python:call(P,xx,cpu,[]),
    ok.


%% --------------------------------------------------------------------
%% Function: available_hosts()
%% Description: Based on hosts.config file checks which hosts are avaible
%% Returns: List({HostId,Ip,SshPort,Uid,Pwd}
%% --------------------------------------------------------------------
-define(Vm,'ad_2@c50').

setup()->
    io:format("Start ~p~n",[{?MODULE,?FUNCTION_NAME}]),
   
    ok=application:start(ad_2),
    pong=ad_2:ping(),
 %   rpc:call(?Vm,init,stop,[],6000),
 %   []=os:cmd("./_build/default/rel/ad_2/bin/ad_2 foreground &"),
 %   timer:sleep(2000),
  %  cccong=net_adm:ping(?Vm),
  %  pong=rpc:call(?Vm,ad_2,ping,[],6000),

    %rpc:call(?Vm,init,stop,[],6000),
    %timer:sleep(2000),
   % []=os:cmd("./_build/default/rel/ad_2/bin/ad_2 foreground &"),
   % timer:sleep(2000),
   % cccong=net_adm:ping(?Vm),
    %pong=rpc:call(?Vm,ad_2,ping,[],6000),
    
    ok.
