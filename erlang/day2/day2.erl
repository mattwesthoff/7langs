-module(day2).
-export([value_at/2]).
-export([value_at_better/2]).
-export([total_price/1]).
-export([tic_tac_toe/1]).
-export([tic_tac_toe_again/1]).

value_at(Key, Map) -> [First | _] = [V || {K, V} <- Map, K =:= Key], First.
value_at_better(Key, Map) -> hd([V || {K, V} <- Map, K =:= Key]).

total_price(Items) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- Items].

tic_tac_toe(Board) -> 
	[ZZ,ZO,ZT,OZ,OO,OT,TZ,TO,TT] = Board,
	Lines = [[ZZ,ZO,ZT],[OZ,OO,OT],[TZ,TO,TT],[ZZ,OZ,TZ],[ZO,OO,TO],[ZT,OT,TT],[ZZ,OO,TT],[ZT,OO,TZ]],
	Results = [case Line of 
		[x,x,x] -> x; 
		[o,o,o] -> o; 
		[x,x,o] -> draw;
		[x,o,x] -> draw; 
		[o,x,x] -> draw; 
		[o,o,x] -> draw; 
		[o,x,o] -> draw; 
		[x,o,o] -> draw; 
		_ -> unfinished 
	end || Line <- Lines],
	Allx = lists:any(fun(I) -> I =:= x end, Results),
	Allo = lists:any(fun(I) -> I =:= o end, Results),
	AllDraw = lists:all(fun(I) -> I =:= draw end, Results),
	if
		Allx == true -> x;
		Allo == true -> o;
		AllDraw == true -> draw;
		true -> unfinished
	end. 

tic_tac_toe_again(Board) -> 
	[ZZ,ZO,ZT,OZ,OO,OT,TZ,TO,TT] = Board,
	Lines = [[ZZ,ZO,ZT],[OZ,OO,OT],[TZ,TO,TT],[ZZ,OZ,TZ],[ZO,OO,TO],[ZT,OT,TT],[ZZ,OO,TT],[ZT,OO,TZ]],
	Results = [case Line of 
		[x,x,x] -> x; 
		[o,o,o] -> o; 
		_ -> unfinished 
	end || Line <- Lines],
	Allx = lists:any(fun(I) -> I =:= x end, Results),
	Allo = lists:any(fun(I) -> I =:= o end, Results),
	Draw = lists:all(fun(I) -> I =:= o orelse I =:= x end, Board),
	if
		Allx -> x;
		Allo -> o;
		Draw -> draw;
		true -> unfinished
	end. 