-module(day2).
-export([value_at/2]).
-export([total_price/1]).


value_at(Key, Map) -> [First | _] = [V || {K, V} <- Map, K =:= Key], First.

total_price(Items) -> [{Item, Quantity * Price} || {Item, Quantity, Price} <- Items].


