function [Total] = Change(quarters,dimes,nickles,pennies) 
%%% This function takes the input of the number of quarters, dimes, nickles,
%%% and pennies in that order. It then multiplies those number by their appropriate value i.e. number of quarter * .25 etc...
%%% It stores each value in a different variable that has the same first letter
%%% as the coin being multiplied. I did not supress the output for the 4 
%%% variables so the user can see what the value is for each coin. 
%%% It then add up the total value of all the change in the outcome called 'total'. 
%%% The function num2str is used to convert the total value to string so a
%%% '$' can be added in front of the value to show that the value is a monetary value. 

    q = (quarters * .25)
    d = (dimes * .10)
    n = (nickles * .05)
    p = (pennies * .01)
    Total = (q + d + n + p);
    Total = num2str(Total);
    Total = ("$" + Total);
    
end


