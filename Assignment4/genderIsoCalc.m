function [femaleIsoIndMeans,maleIsoIndMeans,femaleGroupIsoMean,maleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3)


%%% This function take can take in array inputs that have been specified
%%% as 'Gender', 'Day1', 'Day2', adn 'Day3' so they are in the same format as 
%%% the variables that were used in the assignment 4 script from the isokinetic 
%%% data. It then can output 'femaleIsoIndMeans' and 'maleIsoIndMeans', which 
%%% are arrays, and 'femaleGroupIsoMean','maleGroupIsoMean', which are single values. 
%%% This function is failry specific for this data set but it could work if
%%% for other data sets that are trying to clagender averages over the 3
%%% different trials/occurences of the same type of data

%%% The function works by using a for loop to start at 1 and then go through
%%% the length of the 'Gender' variable, in this case, with 'i' being set equal to
%%% the number that the for loop is on within the length of the variable.
%%% Within the loop there is a conditional that says if
%%% 'Gender' (input 1) is equal to "f" for that number in the column
%%% then calculate the 'femaleIsoIndMeans' by adding 'Day1', 'Day2', and 'Day3'
%%% (input 2, 3, and 4)together and then dividing by 3 ot get the average 
%%% female. The elsefi portion of the conditional is for when 'Gender' is 
%%% equal to "M" then essentially the same thing happens except it is for 
%%% the male variable 'maleIsoIndMeans' Lastly,'a' is equal to nonzeros of 'femaleIsoIndMeans' because
%%% males are input into the array as 0s which would alter the group average 
%%% (vice versa for 'maleIsoIndMeans' which is equal to 'b')
%%% Then the mean of 'a' is taken to get the 'femalegroupIsoMeans' variable, 
%%% which is the average of of all of the individual means. The same thing
%%% happens for 'b' resulting in 'maleGroupIsoMean'

for i = 1:length(Gender)
    if Gender(i) == ('F')
         femaleIsoIndMeans(i) = (Day1(i) + Day2(i) + Day3(i))/3;
         
    elseif Gender(i) == ('M')
        maleIsoIndMeans(i) = (Day1(i) + Day2(i) +Day3(i))/3;
    end
end
a = nonzeros(femaleIsoIndMeans);
femaleGroupIsoMean = mean(a);

b = nonzeros(maleIsoIndMeans);
maleGroupIsoMean = mean(b);
end

