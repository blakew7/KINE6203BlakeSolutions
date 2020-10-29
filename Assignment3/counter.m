function counter(number1,number2)
%%% This function takes two input numbers and then displays a counter.
%%% There are two main conditionals that allow the user for number1 or 
%%% number2 to be larger. Within the funciton, a = number1 (assuming number1 is larger),
%%% number1 is then displayed, and it then enters a for loop from number1 to number2. This
%%% set the paramaters for the loop although it technically
%%% won't ever run for number2 because of the conditional in the for loop 
%%% which will stop the loop the at the last number before number2,
%%% but using number2 as the end paramater allows for the loop to be
%%% flexible and will work for any input number. The for loop simply adds 1
%%% to every integer after number1 and then displays that number. When it 
%%% gets to the last number before number2 it will technically equal
%%% number2 so it will break from the loop. 

if number1 < number2
    a = number1;
    disp(number1)
     for i = number1:number2
          a = (a + 1);
          disp(a)
         if a == number2
             break 
         end
     end
end

if number1 > number2
     a = number2;
    disp(number2)
     for i = number2:number1
          a = (a + 1);
          disp(a)
         if a == number1
             break 
         end
     end
end
    
end
