function guessThatNumber()  % *** WARNING: CONTAINS INTENTIONAL BUGS! ***
%---------------------------------------------------------------
%       USAGE: guessThatNumber() - Assignment 5
%
%        NAME: Blake Jones
%
%         DUE: November 12
%
%
% DESCRIPTION: This program is supposed to allow the user to play
%              the Number Guessing Game, however, it contains bugs.
%              Your job is to find, correct, and mark the errors with
%              comments describing the bug, how you found it, 
%              and how you corrected it. Correct the bugs and submit this
%              corrected file on github. There are between 9 - 12 bugs,
%              depending on how you correct them. 
%
%      INPUTS: None
%
%     OUTPUTS: None
%
%---------------------------------------------------------------
beginner = 1;               % beginner level #
moderate = 2;               % moderate level #
advanced = 3;               % advanced level #
beginnerHighest = 10;       % highest possible number for beginner
moderateHighest = 100;      % highest possible number for moderate
advancedHighest = 1000;    % highest possible number for advanced

% clear screen and display game introduction

clc()
fprintf(['Guess That Number Game (buggy)\n\n', ...
'This program plays the game of Guess That Number in which you have to guess\n', ...
'a secret number.  After each guess you will be told whether your \n', ...
'guess is too high, too low, or correct.\n\n'])

% Get level of play (1-3) from user

fprintf('Please select one of the three levels of play:\n')
fprintf('   1) Beginner (range is 1 to %d)\n', beginnerHighest)
fprintf('   2) Moderate (range is 1 to %d)\n', moderateHighest)
fprintf('   3) Advanced (range is 1 to %d)\n', advancedHighest)

level = input('Enter level (1-3): '); 

% BUG 3 the  while loop below intially had or operators ||. This prevented
% the user form being able to actually pick a level because if the
% user selects 'beginner' the or statements of level ~= moderate || 
% level ~= advanced are technichally true so the script enters the while
% loop continuously. This means the user cannot actually start the game
% because 'beginner', 'moderate', and 'advanced' all casue the loop to be
% initated. To fix this the || were replaced with the operator &&. If level 
% is eaqual to just one of three then the script will continue on. if the
% input is not equal any of the three listed words the while loop runs and
% requires the user to re-enter the input until they enter 'beginner',
% 'moderate', or 'advanced'
while level ~= beginner && level ~= moderate && level ~= advanced       
fprintf('Sorry, that is not a valid level selection.\n')
level = input('Please re-enter a level of play (1-3): ');
end

% set highest secret number based on level selected

% BUG 1 the if conditional was set to level = beginner which sets a
% variable = to a value instead of comparing values for equality like == does
if level == beginner                     

highest = beginnerHighest;

elseif level == moderate

highest = moderateHighest;

else
highest = advancedHighest; % BUG 4 in 'advancedhighest' the "h" in highest was not 
% capitalized so the adavanced option does not work because 'advancedhighest' 
% is not a variable. It should be 'advancedHighest' so the advanced level can be played         
end

% randomly select secret number between 1 and highest for level of play

% BUG 8 secretNumber was only guessing the highest number because 1 was being added to rand() 
% so only the max number for the level was being generated i.e 10, 100, or
% 1,000. Removed (+ 1) so it generates an actual random number that ranges
% from 1 to the highest number in the level. 
secretNumber = floor(rand() * highest);

% initialize number of guesses and User_guess

% BUG 9 numOfTries = 1 is incorrect because this caused numOfTries to always be one 
% larger than the actual number of tries in the congartualtions statement 
% i.e user gets it in 5 tries (Congratulations! You got ... in 6 tries). 
% Replaced 1 with 0 (numOfTries = 0) so numOfTries will start at 0 then changes
% to 1 after numOfTries + 1 instead of 2, which gives us the correct numOfTries
% in the ongratualtions statement. 
numOfTries = 0; 
userGuess = 0;

% repeatedly get user's guess until the user guesses correctly

% BUG 2 this while loop did not have an end statement. The new end 
% statement is placed after the end statement of the nested while loop (userGuess < 1)
while userGuess ~= secretNumber

% get a valid guess (an integer from 1-Highest) from the user

fprintf('\nEnter a guess (1-%d): ', highest)
userGuess = input('');

% BUG 6 the second part of the || statement (userGuess >= height) prevents
% the user form being able to enter the max number in the game. If the user selects
% beginner than they can't select number 10 because if userGuess is equal to 10 (highest)
% then the while loop below initates and the input is deemed not valid.
% Changed to (userGuess > highest) so the max value can be entered.
while userGuess < 1 || userGuess > highest 

fprintf('Sorry, that is not a valid guess.\nRe-enter a guess (1-%d): ', highest);

userGuess = input('');

end % of guess validation loop

numOfTries = numOfTries + 1; % add 1 to the number of guesses the user has made

% report whether the user's guess was high, low, or correct

if userGuess < secretNumber  % BUG 5 the if conditional was userGuess > secretNumber 
% which is already used in the the elseif conditional below it. If the user
% entered a number less than the secretNumber than the game would end. Also
% the fprintf below specifies if the userGuess is too low not too high.
% Changed to userGame < secretNumber so if the the user enters a number less 
% than secretNumebr the user is then prompted to enter a new number and the
% game isn't terminated

fprintf('Sorry, %d is too low.\n', userGuess); 

elseif userGuess > secretNumber 
fprintf('Sorry, %d is too high.\n', userGuess); 
elseif numOfTries == 1   
fprintf('\nLucky You!  You got it on your first try!\n\n');
else
fprintf('\nCongratulations!  You got %d in %d tries.\n\n', ...
secretNumber, numOfTries);  % BUG 7 Incorrect congratulations diplay. The 
% message was leaving out the number of tries it took. Added (numOfTries) 
% after (secretNumber) in the fprintf to display the correct congratulations 
% statement that includes the number of tries it took.


fprintf('Game Over. Thanks for playing the Guess That Number game.\n\n');

end  % of guessing while loop

end
% end of game