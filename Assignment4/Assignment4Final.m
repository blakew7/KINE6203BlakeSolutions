% Blake Jones

% November 5th 2020

% Assignment 5: Analyzing Isometric Strength Data

% Devleloped on Matlab version R2020b, on Mac OSX



%%% The importfile function brings in the isokinetic strength data from the
%%% csv file. It is set to include all of the variables which are listed in
%%% the output of this function i.e. [SubjectID, Age, etc..]. It also
%%% generates the importfile.m script which has the file import information
%%% from the file. 
[SubjectID,Age,Gender,Weight,Day1,Day2,Day3] = importfile("/Users/blakejones/Downloads/isok_data_6803.csv");



%%% The genderIsoCalc function is a user made function that calculates 
%%% female and male individual and group means from the isokinetic strength 
%%% file. This function is explained in detail in genderIsoCalc.m.
[femaleIsoIndMeans,maleIsoIndMeans,femaleGroupIsoMean,maleGroupIsoMean] = genderIsoCalc(Gender,Day1,Day2,Day3);



%%% The dayComparer function is a user made funciton that displays the subject ID
%%% if there is an increase in isokinetic strength data from day 1 to day 2 or
%%% day 2 to day 3. This function is explained in detail in
%%% dayComparer.m. The function does have to be called twice with the
%%% differnt day inputs and different outputs. 
[day1toDay2] = dayComparer(SubjectID,Day1,Day2);
[day2toDay3] = dayComparer(SubjectID,Day2,Day3);



%%% The normalized day means variables are the normalized isokinetic average
%%% strength data for each day. The variables are set equal to the average
%%% of isokinetic strength data on day 1, day 2, or day 3. The stregth data
%%% for each individual in a specific day, i.e. 'Day1', is then right divded
%%% via rdivide by the by the corresponding weight of that individual. The
%%% function rdivide works by dividing ever element of an array (Day1) by the
%%% corresponding element in an another array (Weight), as long as the
%%% arrays are the same size, nomalizing the strength data for day 1. The
%%% mean function is used to compute the average of the normalized data for
%%% Day1 utimately providing the average normalized
%%% strength data for 'Day1' (normDay1mean). This is repeated for 'Day2' and
%%% 'Day3' (normDay2mean & normDay3mean)

normDay1mean = mean(rdivide(Day1,Weight));
normDay2mean = mean(rdivide(Day2,Weight));
normDay3mean = mean(rdivide(Day3,Weight));



%%% The variable 'results' is equal to a 25 x 9 matrix (25 rows 9 columns) 
%%% made of zeros (to create a "blank" matrix). The size of this matirx was
%%% chosen because there are 25 total subjects and there are 9 total result
%%% variables. This gives a space to put the values for the result
%%% variables above, i.e. 'femaleIsoIndMeans', 'maleIsoIndMeans', 'Day1toDay2', etc...

results = zeros(25,9);


%%% The following for loops and statements place each of the above results
%%% variables into the different columns in the zeros 'results' matix. The
%%% for loops start at the first element of the results variable
%%% ('femaleIsoIndMeans', 'maleIsoIndMeans', 'day1toDay2',and 'day2toDay3')
%%% and runs through the length of that variable with 'i' being set equal to
%%% the number that the for loop is on within the length of the variable.
%%% For each number in the for loop the row element of the specified results 
%%% variable that corresponds to that for loop number, the value of that element 
%%% replaces a zero in the 'results' matrix. This contiinues for the for
%%% loops until the length of the results variable is reached and all of
%%% the values from the specified results variables are placed in its
%%% specified column. However, some of the rows will still have zeros for 
%%% some of the results  values. For example, 'femaleIsoIndMeans' 
%%% only considers female averages so if the subject is male there will be 
%%% a 0 in the corresponding row for that column becasue the 'femaleIsoIndMeans' 
%%% does not have any of the male averages. 


%%% The statements simply specify an element in the matrix and then replace
%%% the 0 with the value of the specified results variable ('femaleGroupIsoMean',
%%% 'maleGroupIsoMean', 'normDay1mean','normDay2mean', 'normDay3mean'). 
%%% The variables only have one value which is why a for loop isn't used.
%%% This means that every row in the column following one of these variables
%%% will have a 0 in it. This is an asthetic limittation to this method. 
%%% One reason it has to be like this so the write.function (dicussed later) 
%%% requires arrat or tables of the same size. 

for i = 1:length(femaleIsoIndMeans)
    results(i,1) = femaleIsoIndMeans(i); %%% first column in 'results' matrix
end

for i = 1:length(maleIsoIndMeans)
    results(i,2) = maleIsoIndMeans(i); %%% second column in 'results' matrix
end

results(1,3) = femaleGroupIsoMean; %%% first row third column

results(1,4) = maleGroupIsoMean; %%% first row fourth column

for i = 1:length(day1toDay2)
    results(i,5) = day1toDay2(i); %%% fifth column in 'results' matrix
end

for i = 1:length(day2toDay3)
    results(i,6) = day2toDay3(i); %%% sixth column in 'results' matrix
end

results(1,7) = normDay1mean;  %%% first row seventh column

results(1,8) = normDay2mean;  %%% first row eigth column

results(1,9) = normDay3mean;  %%% first row ninth column



resultsTable = array2table(results); %%% function converts 'results matrix'
                                     %%% to a table called 'resultsTable'

 
%%% This statement establishes the variable name for each column in the 
%%% 'resultsTable' in the order that they are listed. 
resultsTable.Properties.VariableNames(1:9) = {'femaleIsoIndMeans','maleIsoIndMeans','femaleGroupIsoMean'...
                'maleGroupIsoMean','day1toDay2','day2toDay3','normDay1mean','normDay2mean','normDay3mean'};

%%% The writetable funciton exports the 'resultsTable' into a csv file. 
%%% As mentioned before, the file will have zeros where result variable
%%% vallues were not placed, which is a draw back visually. However, the 
%%% csv file can be edited afterwards to be made more visually appealing. 
%%% Side note: it is posisble that if strings and cells were used instead
%%% of tables then mismatched arrays could be used to create a csv file
%%% that is not full of zeros or Nan.
writetable(resultsTable,'iso_results.csv')


