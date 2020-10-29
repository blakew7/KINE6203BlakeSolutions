function [Sum, Diff, Product, Max] = SumDiffProductMax(number1, number2)
%%% This function takes in two numbers then it outputs the sum,
%%% the difference, the product, and the max of the two numbers all at
%%% once.

Sum = (number1 + number2);

Diff = (number1 - number2);

Product = (number1 * number2);

Max = max(number1, number2);

end

