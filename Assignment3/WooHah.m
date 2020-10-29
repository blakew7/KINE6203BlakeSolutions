function  WooHah(number1,number2)
%%% This function takes two number inputs, adds them , stores them in the variable 'SumWooHah',
%%% and then puts SumWooHah through a conditional using the rem function 
%%% which states that if  'SumWooHah' is dividsible by 2 with no remainder
%%% (when it's equal to 0) then the number is even so 'Woo' is displayed, 
%%% if there is a remainder then the number is odd so 'Hah' is displayed. 

%%% This function does not have an output but it still display 'Woo' or
%%% 'Hah' when number is even or odd respectively. I wan not entirely sure
%%% if you were asking to have two outputs consiting of 'Woo' and 'Hah'. I
%%% did try though this by setting 'SumWooHah' = 'Woo' after the first if statement 
%%% and then 'SumWooHah' = 'Hah' after the else, but this caused issues in
%%% getting the function to actually return anything becuase one of the
%%% variables would not be defined if the outher potion of the conditional
%%% was being used. I also considering setting the output to 'SumWooHah' and 
%%% returing the actual sum and then it woudld display 'Woo' or 'Hah,'
%%% but then I realized that you never asked for the actual value of the sum.
%%% Therefore, I went with my original solution of no output and 
%%% just displaying 'Woo' or 'Hah' if the appropriate conditions were met.

SumWooHah = (number1 + number2);

if rem(SumWooHah,2)==0
  disp('Woo')
else 
  disp('Hah')
end
end


