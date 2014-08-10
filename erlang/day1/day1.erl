-module(day1).
-export([count_builtin/1]).
-export([count_words/1]).
-export([count_to_ten/0]).
-export([count_to_ten/1]).
-export([success_or_error/1]).

% write a function that uses recursion to return the number of words in a string
count_builtin(Text) -> T = string:tokens(Text, " "), S = length(T), S.

count_words("") -> 0;
count_words([$\ ]) -> 0;
count_words([_]) -> 1;
count_words([$\ |Rest]) -> count_words(Rest);
count_words([_,$\ |Rest]) -> 1 + count_words(Rest);
count_words([_|T]) -> count_words(T).

% use recursion to count to ten
count_to_ten() -> count_to_ten(1).
count_to_ten(10) -> io:write(10);
count_to_ten(T) when T < 10 -> io:write(T), count_to_ten(T + 1).

% use matching to selectively print "success" or "error: message" given input of the form {error, Message} or success
% io:write was outputting lists of ints, chars makes it more like chars?
success_or_error({error, Message}) -> io:put_chars(Message ++ "\n");
success_or_error(success) -> io:put_chars("success\n").