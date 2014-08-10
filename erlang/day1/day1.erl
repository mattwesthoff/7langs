-module(day1).
-export([count_builtin/1]).
-export([count_words/1]).

% write a function that uses recursion to return the number of words in a string
count_builtin(Text) -> T = string:tokens(Text, " "), S = length(T), S.

count_words("") -> 0;
count_words([$\ ]) -> 0;
count_words([_]) -> 1;
count_words([$\ |Rest]) -> count_words(Rest);
count_words([_,$\ |Rest]) -> 1 + count_words(Rest);
count_words([_|T]) -> count_words(T).

% use recursion to count to ten

% use matching to selectively print "success" or "error: message" given input of the form {error, Message} or success