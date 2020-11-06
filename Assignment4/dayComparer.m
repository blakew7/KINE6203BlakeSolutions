function [day1toDay2,day2toDay3] = dayComparer(SubjectID,DayA,DayB)

%%% This function take can take in array inputs that have been specified
%%% as 'SubjectID', 'DayA', and 'DayB' so they are in a similar format as 
%%% the variables that were used in the assignment 4 script from the isokinetic 
%%% data. It then can output 'day1toDay2' and 'day2toDay3' which are arrays. 
%%% This function can work for other data sets as long as the first input is an indetifier
%%% for something subjects,number, letters, etc.. and the other two inputs 
%%% are values that you want to compare to see if one if the seocnd is larger 
%%% than the first. Make sure the first input is the same size as input 2
%%% and input 3 or it wont evaluate all of the data points.


%%% The function works by using a for loop to start at 1 and then go through
%%% the length of the 'subjecID', in this case, with 'i' being set equal to
%%% the number that the for loop is on within the length of the variable.
%%% Within the loop there is a conditional that determines if
%%% 'Day1'(input1) is greater than or equal to 'Day2' (input3). If 'Day1' is
%%% greater than 'day2' then  a 0 is placed in the ith row of 'day1toDay2'
%%% meaning know 'SubjectID' was stored and the conditional ends. 
%%% The esleif says that if 'Day2' is greater than day 'Day1' then the 'SubjectID' is stored
%%% in the appropriate ith row of the 'day1toDay2' variable. This continues
%%% the length of the 'SubjectID' or input 1. This works for 'Day2' and
%%% 'Day3' by calling the function, inputing 'Day2' in input DayA, inputing 
%%%'Day3' in input Day3 , and calling the output 'day2toDay3'.


for i = 1:length(SubjectID)
    if DayA(i) >= DayB(i)
    elseif DayB(i) > DayA(i)
        day1toDay2(i) = SubjectID(i);
        day2toDay3(i) = SubjectID(i);
    end
end
        

end

