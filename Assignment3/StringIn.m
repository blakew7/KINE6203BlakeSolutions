function [LengthString,FirstChar,LastChar] = StringIn(str)
%%% This function takes any sting input value 'str' and returns the sting length
%%% via 'strlength(str)' and then also outputs FirstChar which is the first
%%% letter in the 'str' via [1] and LastChar which is the last letter in the 'str' via
%%% [end] statement.



LengthString = strlength(str);

FirstChar = str(1);

LastChar = str(end);

end

