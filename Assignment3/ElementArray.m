function [triangle] = ElementArray(input)
%%% This function requirs a valid 3 element array. The user has to put
%%% parenthesis and brackets around their answers to indicate an array. Ex. ([1,2,3]). 
%%% Each element of the array is equal to one of the three sides of a triangle,
%%% which are stored in the variables 'a', 'b', and 'c'.
%%% For a valid triangle the sum of the lengths of the 2 shorter sides are
%%% greater than the length of the longest side. Therefore, the conditional
%%% evalutates if one side is greater than the other two, and then it evaluates
%%% if the sum of the two smaller sides is greater than the one larger
%%% side. If this is so then then the 'triangle' = true logical so '1' is displayed. If
%%% this is false or if all the sides are equal then 'triangle' = false logical
%%% and '0' is displayed.

a = input(1,1);
b = input(1,2);
c = input(1,3);

    if a > b && c
        if a < (b+c)
            triangle = true; 
        else
            triangle = false;
        end
elseif b > a && c
        if b < (a+c)
            triangle = true;
        else
            triangle = false;
        end
elseif c > a && b
        if c < (a+b)
            triangle = true;
        else
            triangle = false;
        end
  else
       triangle = false;
   end
end



