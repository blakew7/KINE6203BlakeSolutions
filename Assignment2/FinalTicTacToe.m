%Title:  Bill-Lock-Ay's TicTacToe

%Author: Blake Jones

%Date: October 22nd, 2020

% Devleloped on Matlab version R2020b, on Mac OSX

disp('Welcome to Bill-Lock-Ay TicTacToe')

prompt = ('Would you like to play? Yes/No:');
prompt2 = ('Stop tripping. Only enter (yes) or (no);');
YesNo = input(prompt,'s');    %%% This is the input string that allos the user to start the game 


if     strcmpi(YesNo,'no') || strcmpi(YesNo,' no')  %%% strcmpi to evaluate the string the user enters. Specifically used strcmpi so captial letter wont matter, and added ' no' to allow the user to enter a space before typing their answer to make it more user friendly. This is something I did with every string input.
        disp('Laaaaammmmeeeee')
        return                                      %%% Exits the script 
elseif strcmpi(YesNo,'yes') || strcmpi(YesNo,' yes') %%% Will allow the script to keep running
        disp('Lets Play')
else                                               %%% This in case the user enters anything besides 'yes' or 'no'
       f = true;                                   %%% Initiator variable to start the following while loop
        while f==true                              %%% this will loop until the user enters 'yes' or 'no'
           YesNo2 = input(prompt2,'s');            %%% Second input string that functions similar to the first but uses a different pompt. Used a different variable to prevent issues with the first variable
                if strcmpi(YesNo2,'no') || strcmpi(YesNo2,' no')
                    disp('Laaaaammmmeeeee')
                    return
            elseif strcmpi(YesNo2,'yes') || strcmpi(YesNo2,' yes')
                    disp('Lets Play')
                    break  
               end
         end        
end    


a = true;        %%% initiator variable for the large while loop
while a == true  %%% this is the large while loop that ends on line 1302. It the user anser 'yes' to playing gain later on it will take you back to the next question so you can chose to be first or second again
   FirstorSecond = ('Would you like to go first or second? (if first You are X. If second you are O):');  
   FS = input(FirstorSecond, 's');                 %%% input string for chosing to go first or second
     if strcmpi(FS,'first') || strcmpi(FS,' first') %%% if 'first' is chosen it will run through the code below until line 674. If 'second' os chosen it jumps to line 678.

       
       t = 1;        %%% This is my time variable. It is set for one seconf so the for loop "timer" will move through the numbers after 1 second
       t2 = 1.5;       %%% Another time variable used later for pausing the CPU moves so they don't display so quickly 
       for clock = [(5),(4),(3),(2),(1)]        %%% for loop timer. Count down from 5
           fprintf('Starting in %d\n', clock);
           pause(t)     %%% puase function is what is actually allowing the "timer" to pause before dispaying the next number
       end
       
 
       b=true;    %%% Initiator variable
       c=true;    %%% Initiator Variable 
       while b == true   %%%starts a while loop that will cycle for the whole game if th user choses to go first. It is here to allow for an break statement to be bewtween this loop and the next after the game ends and user decide to play again it wont just move on the the next move, it will actually start over 
         while c == true  %%% The primary while loop that cycles the game if the user choses to go first. Works with the the while loop above as previously stated
          
          disp('Move 1')
          
          board = ([' 1 ',' 2 ',' 3 ';' 4 ',' 5 ',' 6 ';' 7 ',' 8 ',' 9 ']);  %%% This our 3x3 board. Although technichally 3x9 because of the spaces. It displays as 1-9.
         
          AM = [1 2 3 4 5 6 7 8 9];  %%% AM == Available Moves This allows previously taken moves to not be used again by the computer and the user
         
          disp(board)
         
          move = ('Move(1-9):');     %%% prompt for the user moves
          Error = ('Error Cannot Enter Value Outside (1-9). Try again:');
          
      %%% User Move 1
          UM = input(move); %%% Allows the user to pick their move. 
          
          while isempty(UM) %%% Prevents the user form just hitting enter. You have no idea how long it took me to figure this out. Litterally took me form Texas to Arizona
               UM = input(Error);
          end
                                
          
          while UM~=(AM)    %%% This while loop prevents the user from entering anything excpet for the available move. This loop will occur before ever user move. 
                 UM = input(Error);  %%% This one does not have ot be a string. It handles number outside AM, characters, spaces, and words. It breaks when you only hit enter, which is why I added the previous while loop.     
          end
          
  
                             
          if     UM==1                      %%% Initates the placement of the move. If UM==1 then the 1 postion on the board will be replaced with an x. This the same for all user and CPU moves
                  board = num2str(board);   %%% The function that changes the number value with a character while changing the board
                  board(board=='1') = 'X';
          elseif UM==2
                  board = num2str(board);
                  board(board=='2') = 'X';
          elseif UM==3
                  board = num2str(board);
                  board(board=='3') = 'X';
          elseif UM==4
                  board = num2str(board);
                  board(board=='4') = 'X';
          elseif UM==5
                  board = num2str(board);
                  board(board=='5') = 'X';
          elseif UM==6
                  board = num2str(board);
                  board(board=='6') = 'X';
          elseif UM==7
                  board = num2str(board);
                  board(board=='7') = 'X';
          elseif UM==8
                  board = num2str(board);
                  board(board=='8') = 'X';
          elseif UM==9
                  board = num2str(board);
                  board(board=='9') = 'X';
          end
          
         
          AM = setdiff(AM,UM); %%% This amazing function (saved me 100s of lines) alters the available moves by considering what move was just used by the user and then deleting that option from the available moves.
                               %%% This keeps the cumputer and the user from entering values that have already been entered. 
                               %%% For use the funtion is set right after the move. For the CPU it is set before. This is function is reapeated with all the moves. 
                               %%% I originally had it display the updated available moves in the command window so the user could see what values they could enter, but I ultimately decided  to supress it to make the command windowless busy
          
          disp(board)



          % CPU Move 1
          disp('CPU Move 1')
         
          CM = randsample(AM,1); %%%This randomly selects 1 value from the available moves. 
          AM = setdiff(AM,CM);   %%% Prevents the computer from selecting previously taken moves. Functions the same as the previous setfdiff
 

          if     CM==1
                  board = num2str(board);    
                  board(board=='1') = 'O';
          elseif CM==2
                  board = num2str(board);
                  board(board=='2') = 'O';
          elseif CM==3
                  board = num2str(board);
                  board(board=='3') = 'O';
          elseif CM==4
                  board = num2str(board);
                  board(board=='4') = 'O';
          elseif CM==5
                  board = num2str(board);
                  board(board=='5') = 'O';
          elseif CM==6
                  board = num2str(board);
                  board(board=='6') = 'O';
          elseif CM==7
                  board = num2str(board);
                  board(board=='7') = 'O';
          elseif CM==8
                  board = num2str(board);
                  board(board=='8') = 'O';
          elseif CM==9
                  board = num2str(board);
                  board(board=='9') = 'O';
          end

          pause(t2);      %%% This pause prevents the computer from quickly displaying its next move. It slows things down and make things a little less chaotic
          
          disp(board)
         
         
      %%% User Move 2
          disp('Move 2')
         
          UM2 = input(move);  %%% same as the firt User move. Only thing different is the variable name

          while isempty(UM2)
               UM2 = input(Error);
          end
          
          while UM2~=(AM)
                 UM2 = input(Error);
          end

          
          if     UM2==1
                  board = num2str(board);    
                  board(board=='1') = 'X';
          elseif UM2==2
                  board = num2str(board);
                  board(board=='2') = 'X';
          elseif UM2==3
                  board = num2str(board);
                  board(board=='3') = 'X';
          elseif UM2==4
                  board = num2str(board);
                  board(board=='4') = 'X';
          elseif UM2==5
                  board = num2str(board);
                  board(board=='5') = 'X';
          elseif UM2==6
                  board = num2str(board);
                  board(board=='6') = 'X';
          elseif UM2==7
                  board = num2str(board);
                  board(board=='7') = 'X';
          elseif UM2==8
                  board = num2str(board);
                  board(board=='8') = 'X';
          elseif UM2==9
                  board = num2str(board);
                  board(board=='9') = 'X';
          end  

          AM = setdiff(AM,UM2);
          
          
          disp(board)

         
      %%% CPU Move 2
          disp('CPU Move 2')
         
          CM2 = randsample(AM,1); %%% Same as the previous computer move. The only thing that is different is the variable name.
          AM = setdiff(AM,CM2);
    
     
          if     CM2==1
                  board = num2str(board);    % changes the number value with a character
                  board(board=='1') = 'O';
          elseif CM2==2
                  board = num2str(board);
                  board(board=='2') = 'O';
          elseif CM2==3
                  board = num2str(board);
                  board(board=='3') = 'O';
          elseif CM2==4
                  board = num2str(board);
                  board(board=='4') = 'O';
          elseif CM2==5
                  board = num2str(board);
                  board(board=='5') = 'O';
          elseif CM2==6
                  board = num2str(board);
                  board(board=='6') = 'O';
          elseif CM2==7
                  board= num2str(board);
                  board(board=='7') = 'O';
          elseif CM2==8
                  board= num2str(board);
                  board(board=='8') = 'O';
          elseif CM2==9
                  board= num2str(board);
                  board(board=='9') = 'O';
          end

          pause(t2);
          
          disp(board)

      %%% User Move 3
          disp('Move 3')
         
          UM3 = input(move); 
          
          while isempty(UM3)
               UM3 = input(Error);
          end
          
          while UM3~=(AM)
                 UM3 = input(Error);
          end
          
  
          if     UM3==1
                  board = num2str(board);    
                  board(board=='1') = 'X';
          elseif UM3==2
                  board = num2str(board);
                  board(board=='2') = 'X';
          elseif UM3==3
                  board = num2str(board);
                  board(board=='3') = 'X';
          elseif UM3==4
                  board = num2str(board);
                  board(board=='4') = 'X';
          elseif UM3==5
                  board = num2str(board);
                  board(board=='5') = 'X';
          elseif UM3==6
                  board = num2str(board);
                  board(board=='6') = 'X';
          elseif UM3==7
                  board = num2str(board);
                  board(board=='7') = 'X';
          elseif UM3==8
                  board = num2str(board);
                  board(board=='8') = 'X';
          elseif UM3==9 
                  board = num2str(board);
                  board(board=='9') = 'X';
          end

          AM = setdiff(AM,UM3);

          disp(board)
    
          if strcmp(board(1,2),'X') && strcmp(board(1,5),'X') && strcmp(board(1,8),'X') ||...  %%% determines a winner if there are 3 'Xs' in a row
             strcmp(board(1,2),'X') && strcmp(board(2,5),'X') && strcmp(board(3,8),'X') ||...
             strcmp(board(1,2),'X') && strcmp(board(2,2),'X') && strcmp(board(3,2),'X') ||...
             strcmp(board(1,5),'X') && strcmp(board(2,5),'X') && strcmp(board(3,5),'X') ||...
             strcmp(board(1,8),'X') && strcmp(board(2,8),'X') && strcmp(board(3,8),'X') ||...
             strcmp(board(1,8),'X') && strcmp(board(2,5),'X') && strcmp(board(3,2),'X') ||...
             strcmp(board(2,2),'X') && strcmp(board(2,5),'X') && strcmp(board(2,8),'X') ||...
             strcmp(board(3,2),'X') && strcmp(board(3,5),'X') && strcmp(board(3,8),'X') 
                 
              disp('Great Success! (Borat Voice)')  %%% I'm really banking off of you likeing The Borat as much as I do. Did you that He just made a second one?
              load handel                           
              sound(y, Fs)                          %%% I apologize in advance if you're grading this at night and it wakes up your entire family, but I though it would be a funny touch
             
              prompt3 = ('Would you like to play again?:'); 
              YesNo3 = input(prompt3,'s');           %%% another YesNo variable that ask the user if they would like to play again
                 
                   if strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                       disp('Laaaaammmmeeeee')
                       return                       %%% ends the script
               elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                       disp('Lets Play')
                       break                        %%% breaks out of this loop to back to the prompt that ask the user if they woud like to go first or second
                   else                             %%% If user enters anything besides 'yes' or 'no' 
                       h = true;                    %%% initator variable      
                       while h==true                %%% Will run this while loop to reprompt the user and it will keep running until the user enter yes or no
                         YesNo4 = input(prompt2,'s');  %%% another YesNo that allows the reprompt to function properly
                             if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                                     disp('Laaaaammmmeeeee')
                                     return         %%% exits the script
                             elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                                     disp('Lets Play')
                                     break          %%% breaks out this loop. Takes you back to where you can chose if you want to go first or second
                             end 
                       end
                   break                                               
                   end       
          end  
      
      %%% CPU Move 3
          disp('CPU Move 3')
          
          CM3 = randsample(AM,1);
          AM = setdiff(AM,CM3);
        

          if     CM3==1
                  board = num2str(board);    
                  board(board=='1') = 'O';
          elseif CM3==2
                  board = num2str(board);
                  board(board=='2') = 'O';
          elseif CM3==3
                  board = num2str(board);
                  board(board=='3') = 'O';
          elseif CM3==4
                  board = num2str(board);
                  board(board=='4') = 'O';
          elseif CM3==5
                  board = num2str(board);
                  board(board=='5') = 'O';
          elseif CM3==6
                  board = num2str(board);
                  board(board=='6') = 'O';
          elseif CM3==7
                  board = num2str(board);
                  board(board=='7') = 'O';
          elseif CM3==8
                  board = num2str(board);
                  board(board=='8') = 'O';
          elseif CM3==9
                  board = num2str(board);
                  board(board=='9') = 'O';
          end

          
          pause(t2);
          
          disp(board)

          if strcmp(board(1,2),'O') && strcmp(board(1,5),'O') && strcmp(board(1,8),'O') ||...
             strcmp(board(1,2),'O') && strcmp(board(2,5),'O') && strcmp(board(3,8),'O') ||...
             strcmp(board(1,2),'O') && strcmp(board(2,2),'O') && strcmp(board(3,2),'O') ||...
             strcmp(board(1,5),'O') && strcmp(board(2,5),'O') && strcmp(board(3,5),'O') ||...
             strcmp(board(1,8),'O') && strcmp(board(2,8),'O') && strcmp(board(3,8),'O') ||...
             strcmp(board(1,8),'O') && strcmp(board(2,5),'O') && strcmp(board(3,2),'O') ||...
             strcmp(board(2,2),'O') && strcmp(board(2,5),'O') && strcmp(board(2,8),'O') ||...
             strcmp(board(3,2),'O') && strcmp(board(3,5),'O') && strcmp(board(3,8),'O')  
               
               disp('Wow! This kid is an L-7 Weenie (The Sandlot)')    %%% I'm like 99% sure you're a Sandlot guy
               
               prompt3 = ('Would you like to play again?:');
               YesNo3 = input(prompt3,'s');
               
                 if     strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                         disp('Laaaaammmmeeeee')
                         return
                 elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                         disp('Lets Play')
                         break
                 else  
                        h = true;
                         while h==true
                          YesNo4 = input(prompt2,'s');
                            if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                                    disp('Laaaaammmmeeeee')
                                    return
                            elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                                    disp('Lets Play')
                                    break
                            end
                         end
                 break        
                 end
          end  
   
      %%% User Move 4
          disp('Move 4')
          UM4 = input(move);

          while isempty(UM4)
               UM4 = input(Error);
          end
          
          while UM4~=(AM)
                 UM4 = input(Error);
          end

          if     UM4==1
                  board= num2str(board);    % changes the number value with a character
                  board(board=='1') = 'X';
          elseif UM4==2
                  board = num2str(board);
                  board(board=='2') = 'X';
          elseif UM4==3
                  board= num2str(board);
                  board(board=='3') = 'X';
          elseif UM4==4
                  board= num2str(board);
                  board(board=='4') = 'X';
          elseif UM4==5
                  board= num2str(board);
                  board(board=='5') = 'X';
          elseif UM4==6
                  board= num2str(board);
                  board(board=='6') = 'X';
          elseif UM4==7
                  board= num2str(board);
                  board(board=='7') = 'X';
          elseif UM4==8
                  board= num2str(board);
                  board(board=='8') = 'X';
          elseif UM4==9
                  board= num2str(board);
                  board(board=='9') = 'X';
          end 

          AM=setdiff(AM,UM4);

          disp(board)

          if strcmp(board(1,2),'X') && strcmp(board(1,5),'X') && strcmp(board(1,8),'X') ||...
             strcmp(board(1,2),'X') && strcmp(board(2,5),'X') && strcmp(board(3,8),'X') ||...
             strcmp(board(1,2),'X') && strcmp(board(2,2),'X') && strcmp(board(3,2),'X') ||...
             strcmp(board(1,5),'X') && strcmp(board(2,5),'X') && strcmp(board(3,5),'X') ||...
             strcmp(board(1,8),'X') && strcmp(board(2,8),'X') && strcmp(board(3,8),'X') ||...
             strcmp(board(1,8),'X') && strcmp(board(2,5),'X') && strcmp(board(3,2),'X') ||...
             strcmp(board(2,2),'X') && strcmp(board(2,5),'X') && strcmp(board(2,8),'X') ||...
             strcmp(board(3,2),'X') && strcmp(board(3,5),'X') && strcmp(board(3,8),'X')  
                 
              disp('Very Nice! (Borat Voice)')
              load handel
              sound(y, Fs)
               
              prompt3 = ('Would you like to play again?:');
              YesNo3 = input(prompt3,'s');
               
                if     strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                        disp('Laaaaammmmeeeee')
                        return
                elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                        disp('Lets Play')
                        break
                else  
                       h = true;
                        while h==true
                         YesNo4 = input(prompt2,'s');
                           if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                                   disp('Laaaaammmmeeeee')
                                   return
                           elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                                   disp('Lets Play')
                                   break
                           end
                         end 
                break
                end
          end

      %%% CPU Move 4
          disp('CPU Move 4')
          
          CM4 = randsample(AM,1);
          AM = setdiff(AM,CM4);
       
    

          if     CM4==1
                  board = num2str(board);    % changes the number value with a character
                  board(board=='1') = 'O';
          elseif CM4==2
                  board = num2str(board);
                  board(board=='2') = 'O';
          elseif CM4==3
                  board = num2str(board);
                  board(board=='3') = 'O';
          elseif CM4==4
                  board = num2str(board);
                  board(board=='4') = 'O';
          elseif CM4==5
                  board = num2str(board);
                  board(board=='5') = 'O';
          elseif CM4==6
                  board = num2str(board);
                  board(board=='6') = 'O';
          elseif CM4==7
                  board = num2str(board);
                  board(board=='7') = 'O';
          elseif CM4==8
                  board = num2str(board);
                  board(board=='8') = 'O';
          elseif CM4==9
                  board= num2str(board);
                  board(board=='9') = 'O';
          end

          pause(t2);
          
          disp(board)
          
          if strcmp(board(1,2),'O') && strcmp(board(1,5),'O') && strcmp(board(1,8),'O') ||...
             strcmp(board(1,2),'O') && strcmp(board(2,5),'O') && strcmp(board(3,8),'O') ||...
             strcmp(board(1,2),'O') && strcmp(board(2,2),'O') && strcmp(board(3,2),'O') ||...
             strcmp(board(1,5),'O') && strcmp(board(2,5),'O') && strcmp(board(3,5),'O') ||...
             strcmp(board(1,8),'O') && strcmp(board(2,8),'O') && strcmp(board(3,8),'O') ||...
             strcmp(board(1,8),'O') && strcmp(board(2,5),'O') && strcmp(board(3,2),'O') ||...
             strcmp(board(2,2),'O') && strcmp(board(2,5),'O') && strcmp(board(2,8),'O') ||...
             strcmp(board(3,2),'O') && strcmp(board(3,5),'O') && strcmp(board(3,8),'O')  
             
               disp('I think it is time to hang up your TicTacToe gloves after that L')
               
               prompt3 = ('Would you like to play again?:');
               YesNo3 = input(prompt3,'s');
                if     strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                        disp('Laaaaammmmeeeee')
                        return
                elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                        disp('Lets Play')
                        break
                else  
                       h = true;
                        while h==true
                         YesNo4 = input(prompt2,'s');
                          if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                                  disp('Laaaaammmmeeeee')
                                  return
                          elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                                  disp('Lets Play')
                                  break
                          end
                        end 
                break
                end
          end
          
      %%% User Move 5
          disp('Move 5')
          UM5 = input(move);  
          
         while isempty(UM5)
               UM5 = input(Error);
         end

         while UM5~=(AM)
                UM5 = input('Error Cannot Enter Value Outside (1-9) Or Values That Have Already Been Used. Try again:');
         end

         if     UM5==1
                 board= num2str(board);    % changes the number value with a character
                 board(board=='1') = 'X'
         elseif UM5==2
                 board= num2str(board);
                 board(board=='2') = 'X';
         elseif UM5==3
                 board= num2str(board);
                 board(board=='3') = 'X';
         elseif UM5==4
                 board= num2str(board);
                 board(board=='4') = 'X';
         elseif UM5==5
                 board= num2str(board);
                 board(board=='5') = 'X';
         elseif UM5==6
                 board= num2str(board);
                 board(board=='6') = 'X';
         elseif UM5==7
                 board= num2str(board);
                 board(board=='7') = 'X';
         elseif UM5==8
                 board= num2str(board);
                 board(board=='8') = 'X';
         elseif UM5==9
                 board= num2str(board);
                 board(board=='9') = 'X';
         end

         
         AM=setdiff(AM,UM5);
         

         disp(board)

         if strcmp(board(1,2),'X') && strcmp(board(1,5),'X') && strcmp(board(1,8),'X') ||...
            strcmp(board(1,2),'X') && strcmp(board(2,5),'X') && strcmp(board(3,8),'X') ||...
            strcmp(board(1,2),'X') && strcmp(board(2,2),'X') && strcmp(board(3,2),'X') ||...
            strcmp(board(1,5),'X') && strcmp(board(2,5),'X') && strcmp(board(3,5),'X') ||...
            strcmp(board(1,8),'X') && strcmp(board(2,8),'X') && strcmp(board(3,8),'X') ||...
            strcmp(board(1,8),'X') && strcmp(board(2,5),'X') && strcmp(board(3,2),'X') ||...
            strcmp(board(2,2),'X') && strcmp(board(2,5),'X') && strcmp(board(2,8),'X') ||...
            strcmp(board(3,2),'X') && strcmp(board(3,5),'X') && strcmp(board(3,8),'X')  
               
               disp('Curry from way downtown BANG! BANG! Curry for 3! Thats the game! (Mike Breen Voice)') %%% im specifically thinking about that shot against OKC in the finals from a few years back
               load handel
               sound(y, Fs)
               
               prompt3 = ('Would you like to play again?:');
               YesNo3 = input(prompt3,'s');
                
               if      strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                        disp('Laaaaammmmeeeee')
                        return
               elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                        disp('Lets Play')
                        break
               else    
                      h = true;
                       while h==true
                        YesNo4 = input(prompt2,'s');
                         if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                                 disp('Laaaaammmmeeeee')
                                 return
                         elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                                 disp('Lets Play')
                                 break
                         else
                                h==false;
                         end
                       end 
               break
               end
         else            %%% This is here to offer a tie statement after the last move in case there is no winner
          disp('Looks like we have tie')
          
          prompt3 = ('Would you like to play again?:');
          YesNo3 = input(prompt3,'s');
          
           if     strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                   disp('Laaaaammmmeeeee')
                   return
           elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                   disp('Lets Play')
                   break
           else  
                  h = true;
                   while h==true
                    YesNo4 = input(prompt2,'s');
                     if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                              disp('Laaaaammmmeeeee')
                              return
                     elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                            disp('Lets Play')
                            break
                     else
                            h==false;
                     end
                   end 
           break
           end
          end
         end            %%% Ends While b on line 53
       break            
       end              %%% End While a on line 54
        
       
       
     elseif strcmpi(FS,'second') || strcmpi(FS,' second')  %%% This is a continuation of the conditional from line 42 where you can select to go first.  Below this line is essentially a seperate game where the user goes second and the computer goes first.
                                                           %%% Everything about the following code is essentially identical to the portion under the if statement where the user choses to go fist. 
                                                           %%% The only difference is that that computer goes first so there are 5 computer moves and 4 move.
                                                           
        
      t = 1;
      for clock = [(5),(4),(3),(2),(1)]
           fprintf('Starting in %d\n', clock);
           pause(t)
      end
            
      b=true;
      c=true;
      while b == true;
       while c == true;
                 
           
       board = ([' 1 ',' 2 ',' 3 ';' 4 ',' 5 ',' 6 ';' 7 ',' 8 ',' 9 ']);  
       
       AM = [1 2 3 4 5 6 7 8 9];  
       
       disp(board)


   %%% CPU first move
       disp('CPU Move 1')
       
       CM = randsample(AM,1);
       AM = setdiff(AM,CM);



       if     CM==1
               board = num2str(board);    % changes the number value with a character
               board(board=='1') = 'O';
       elseif CM==2
               board = num2str(board);
               board(board=='2') = 'O';
       elseif CM==3
               board = num2str(board);
               board(board=='3') = 'O';
       elseif CM==4
               board = num2str(board);
               board(board=='4') = 'O';
       elseif CM==5
               board = num2str(board);
               board(board=='5') = 'O';
       elseif CM==6
               board = num2str(board);
               board(board=='6') = 'O';
       elseif CM==7
               board = num2str(board);
               board(board=='7') = 'O';
       elseif CM==8
               board = num2str(board);
               board(board=='8') = 'O';
       elseif CM==9
               board = num2str(board);
               board(board=='9') = 'O';
       end
       
       pause(t2);
       
       disp(board)

    %%%User Move 1
       disp('User Move 1')
       
       move = 'Move(1-9):';
       UM = input(move); % Promts the user to pick a move

       while isempty(UM)
               UM = input(Error);
       end
          
       while UM~=(AM)
              UM = input(Error);
       end

       if     UM==1
               board = num2str(board);    % changes the number value with a character
               board(board=='1') = 'X';
       elseif UM==2
               board= num2str(board);
               board(board=='2') = 'X';
       elseif UM==3
               board = num2str(board);
               board(board=='3') = 'X';
       elseif UM==4
               board= num2str(board);
               board(board=='4') = 'X';
       elseif UM==5
               board= num2str(board);
               board(board=='5') = 'X';
       elseif UM==6
               board= num2str(board);
               board(board=='6') = 'X';
       elseif UM==7
               board= num2str(board);
               board(board=='7') = 'X';
       elseif UM==8
               board= num2str(board);
               board(board=='8') = 'X';
       elseif UM==9
               board= num2str(board);
               board(board=='9') = 'X';
       end

       AM=setdiff(AM,UM);

       disp(board)

       
       
   %%% CPU Move 2
       disp('CPU Move 2')
       
       CM2 = randsample(AM,1);
       AM = setdiff(AM,CM2);
    
     
       if     CM2==1
               board = num2str(board);   
               board(board=='1') = 'O';
       elseif CM2==2
               board = num2str(board);
               board(board=='2') = 'O';
       elseif CM2==3
               board = num2str(board);
               board(board=='3') = 'O';
       elseif CM2==4
               board = num2str(board);
               board(board=='4') = 'O';
       elseif CM2==5
               board = num2str(board);
               board(board=='5') = 'O';
       elseif CM2==6
               board = num2str(board);
               board(board=='6') = 'O';
       elseif CM2==7
               board= num2str(board);
               board(board=='7') = 'O';
       elseif CM2==8
               board = num2str(board);
               board(board=='8') = 'O';
       elseif CM2==9
               board= num2str(board);
               board(board=='9') = 'O';
       end
       
       pause(t2);
       
       disp(board)

       
   %%% User Move 2
       disp('Move 2')
       UM2 = input(move); 

       while isempty(UM2)
               UM2 = input(Error);
       end
          
       while UM2~=(AM)
              UM2 = input(Error);
       end

       if     UM2==1
               board= num2str(board);    % changes the number value with a character
               board(board=='1') = 'X';
       elseif UM2==2
               board= num2str(board);
               board(board=='2') = 'X';
       elseif UM2==3
               board= num2str(board);
               board(board=='3') = 'X';
       elseif UM2==4
               board= num2str(board);
               board(board=='4') = 'X';
       elseif UM2==5
               board= num2str(board);
               board(board=='5') = 'X';
       elseif UM2==6
               board= num2str(board);
               board(board=='6') = 'X';
       elseif UM2==7
               board= num2str(board);
               board(board=='7') = 'X';
       elseif UM2==8
               board= num2str(board);
               board(board=='8') = 'X';
       elseif UM2==9
               board= num2str(board);
               board(board=='9') = 'X';
       end

       AM=setdiff(AM,UM2);

       disp(board)

   %%% CPU Move 3
       disp('CPU Move 3')
       
       CM3 = randsample(AM,1);
       AM = setdiff(AM,CM3);
           


       if     CM3==1
               board= num2str(board);    % changes the number value with a character
               board(board=='1') = 'O';
       elseif CM3==2
               board= num2str(board);
               board(board=='2') = 'O';
       elseif CM3==3
               board= num2str(board);
               board(board=='3') = 'O';
       elseif CM3==4
               board= num2str(board);
               board(board=='4') = 'O';
       elseif CM3==5
               board= num2str(board);
               board(board=='5') = 'O';
       elseif CM3==6
               board= num2str(board);
               board(board=='6') = 'O';
       elseif CM3==7
               board= num2str(board);
               board(board=='7') = 'O';
       elseif CM3==8
               board= num2str(board);
               board(board=='8') = 'O';
       elseif CM3==9
               board= num2str(board);
               board(board=='9') = 'O';
       end
       
       pause(t2);
       
       disp(board)

       if strcmp(board(1,2),'O') && strcmp(board(1,5),'O') && strcmp(board(1,8),'O') ||...
          strcmp(board(1,2),'O') && strcmp(board(2,5),'O') && strcmp(board(3,8),'O') ||...
          strcmp(board(1,2),'O') && strcmp(board(2,2),'O') && strcmp(board(3,2),'O') ||...
          strcmp(board(1,5),'O') && strcmp(board(2,5),'O') && strcmp(board(3,5),'O') ||...
          strcmp(board(1,8),'O') && strcmp(board(2,8),'O') && strcmp(board(3,8),'O') ||...
          strcmp(board(1,8),'O') && strcmp(board(2,5),'O') && strcmp(board(3,2),'O') ||...
          strcmp(board(2,2),'O') && strcmp(board(2,5),'O') && strcmp(board(2,8),'O') ||...
          strcmp(board(3,2),'O') && strcmp(board(3,5),'O') && strcmp(board(3,8),'O')  
      
            disp('Wow! This kid is an L-7 Weenie (Sandlot)')
            
            prompt3 = ('Would you like to play again?:');
            YesNo3 = input(prompt3,'s');
            
             if      strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                      disp('Laaaaammmmeeeee')
                      return
             elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                      disp('Lets Play')
                      break
             else  
                    h = true;
                     while h == true
                      YesNo4 = input(prompt2,'s');
                       if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                               disp('Laaaaammmmeeeee')
                               return
                       elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                               disp('Lets Play')
                               break
                       end
                     end
             break
             end  
       end
    
   %%% User Move 3
       disp('Move 3')
       UM3 = input(move); 
       
       while isempty(UM3)
               UM3 = input(Error);
       end
       
       while UM3~=(AM)
              UM3 = input(Error);
       end
 
       if     UM3==1
               board = num2str(board);    % changes the number value with a character
               board(board=='1') = 'X';
       elseif UM3==2
               board = num2str(board);
               board(board=='2') = 'X';
       elseif UM3==3
               board = num2str(board);
               board(board=='3') = 'X';
       elseif UM3==4
               board = num2str(board);
               board(board=='4') = 'X';
       elseif UM3==5
               board = num2str(board);
               board(board=='5') = 'X';
       elseif UM3==6
               board = num2str(board);
               board(board=='6') = 'X';
       elseif UM3==7
               board = num2str(board);
               board(board=='7') = 'X';
       elseif UM3==8
               board = num2str(board);
               board(board=='8') = 'X';
       elseif UM3==9
               board = num2str(board);
               board(board=='9') = 'X';
       end

       AM=setdiff(AM,UM3);

       disp(board)
    
       if strcmp(board(1,2),'X') && strcmp(board(1,5),'X') && strcmp(board(1,8),'X') ||...
          strcmp(board(1,2),'X') && strcmp(board(2,5),'X') && strcmp(board(3,8),'X') ||...
          strcmp(board(1,2),'X') && strcmp(board(2,2),'X') && strcmp(board(3,2),'X') ||...
          strcmp(board(1,5),'X') && strcmp(board(2,5),'X') && strcmp(board(3,5),'X') ||...
          strcmp(board(1,8),'X') && strcmp(board(2,8),'X') && strcmp(board(3,8),'X') ||...
          strcmp(board(1,8),'X') && strcmp(board(2,5),'X') && strcmp(board(3,2),'X') ||...
          strcmp(board(2,2),'X') && strcmp(board(2,5),'X') && strcmp(board(2,8),'X') ||...
          strcmp(board(3,2),'X') && strcmp(board(3,5),'X') && strcmp(board(3,8),'X') 
            
            disp('Great Success! (Borat Voice)')
            load handel
            sound(y, Fs)
                
            prompt3 = ('Would you like to play again?:');
            YesNo3 = input(prompt3);
            
             if     strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                     disp('Laaaaammmmeeeee')
                     return
             elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                     disp('Lets Play')
                     break
             else  
                    h = true
                     while h == true
                      YesNo4 = input(prompt2,'s');
                        if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                               disp('Laaaaammmmeeeee')
                               return
                        elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                               disp('Lets Play')
                               break
                        end 
                     end
             break
             end     
       end  
      
   %%% CPU Move 4
       disp('CPU Move 4')
       
       CM4 = randsample(AM,1);
       AM = setdiff(AM,CM4);
       

       if     CM4==1
               board = num2str(board);    % changes the number value with a character
               board(board=='1') = 'O';
       elseif CM4==2
               board = num2str(board);
               board(board=='2') = 'O';
       elseif CM4==3
               board = num2str(board);
               board(board=='3') = 'O';
       elseif CM4==4
               board = num2str(board);
               board(board=='4') = 'O';
      elseif CM4==5
               board = num2str(board);
               board(board=='5') = 'O';
      elseif CM4==6
               board = num2str(board);
               board(board=='6') = 'O';
      elseif CM4==7
               board = num2str(board);
               board(board=='7') = 'O';
      elseif CM4==8
               board = num2str(board);
               board(board=='8') = 'O';
      elseif CM4==9
               board = num2str(board);
               board(board=='9') = 'O';
       end
      
       pause(t2);

      disp(board)
      
      if strcmp(board(1,2),'O') && strcmp(board(1,5),'O') && strcmp(board(1,8),'O') ||...
         strcmp(board(1,2),'O') && strcmp(board(2,5),'O') && strcmp(board(3,8),'O') ||...
         strcmp(board(1,2),'O') && strcmp(board(2,2),'O') && strcmp(board(3,2),'O') ||...
         strcmp(board(1,5),'O') && strcmp(board(2,5),'O') && strcmp(board(3,5),'O') ||...
         strcmp(board(1,8),'O') && strcmp(board(2,8),'O') && strcmp(board(3,8),'O') ||...
         strcmp(board(1,8),'O') && strcmp(board(2,5),'O') && strcmp(board(3,2),'O') ||...
         strcmp(board(2,2),'O') && strcmp(board(2,5),'O') && strcmp(board(2,8),'O') ||...
         strcmp(board(3,2),'O') && strcmp(board(3,5),'O') && strcmp(board(3,8),'O')  
             
           disp('I think it is time to hang up your TicTacToe gloves after that L')
           
           prompt3 = ('Would you like to play again?:');
           YesNo3 = input(prompt3,'s');
           
            if     strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                    disp('Laaaaammmmeeeee')
                    return
            elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                    disp('Lets Play')
                    break
            else  
                   h = true;
                    while h == true
                     YesNo4 = input(prompt2,'s');
                      if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                              disp('Laaaaammmmeeeee')
                              return
                      elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                              disp('Lets Play')
                              break
                      end
                    end 
            break
            end
      end

   %%%User Move 4
      disp('Move 4')
      UM4 = input(move);

      while isempty(UM4)
               UM4 = input(Error);
      end
      
      while UM4~=(AM)
             UM4 = input('Error Cannot Enter Value Outside (1-9) Or Values That Have Already Been Used. Try again:');
      end

      if     UM4==1
              board = num2str(board);    % changes the number value with a character
              board(board=='1') = 'X';
      elseif UM4==2
              board = num2str(board);
              board(board=='2') = 'X';
      elseif UM4==3
              board = num2str(board);
              board(board=='3') = 'X';
      elseif UM4==4
              board = num2str(board);
              board(board=='4') = 'X';
      elseif UM4==5
              board = num2str(board);
              board(board=='5') = 'X';
      elseif UM4==6
              board = num2str(board);
              board(board=='6') = 'X';
      elseif UM4==7
              board = num2str(board);
              board(board=='7') = 'X';
      elseif UM4==8
              board = num2str(board);
              board(board=='8') = 'X';
      elseif UM4==9
              board = num2str(board);
              board(board=='9') = 'X';
      end

      AM=setdiff(AM,UM4);

      disp(board)

      if strcmp(board(1,2),'X') && strcmp(board(1,5),'X') && strcmp(board(1,8),'X') ||...
         strcmp(board(1,2),'X') && strcmp(board(2,5),'X') && strcmp(board(3,8),'X') ||...
         strcmp(board(1,2),'X') && strcmp(board(2,2),'X') && strcmp(board(3,2),'X') ||...
         strcmp(board(1,5),'X') && strcmp(board(2,5),'X') && strcmp(board(3,5),'X') ||...
         strcmp(board(1,8),'X') && strcmp(board(2,8),'X') && strcmp(board(3,8),'X') ||...
         strcmp(board(1,8),'X') && strcmp(board(2,5),'X') && strcmp(board(3,2),'X') ||...
         strcmp(board(2,2),'X') && strcmp(board(2,5),'X') && strcmp(board(2,8),'X') ||...
         strcmp(board(3,2),'X') && strcmp(board(3,5),'X') && strcmp(board(3,8),'X')  
          
           disp('Very Nice! (Borat Voice)')
           load handel
           sound(y, Fs)
 
           prompt3 = ('Would you like to play again?:');
            YesNo3 = input(prompt3,'s');
            
             if     strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                     disp('Laaaaammmmeeeee')
                     return
             elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                     disp('Lets Play')
                     break
             else  
                    h = true;
                     while h == true
                      YesNo4 = input(prompt2,'s');
                       if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                               disp('Laaaaammmmeeeee')
                               return
                       elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                               disp('Lets Play')
                               break
                       end
                     end 
             break
             end
      end
      
      
  %%% CPU Move 3
      disp('CPU Move 5')

      CM5 = randsample(AM,1);
      AM = setdiff(AM,CM5);
       
  
      if     CM5==1
              board = num2str(board);    % changes the number value with a character
              board(board=='1') = 'O';
      elseif CM5==2
              board = num2str(board);
              board(board=='2') = 'O';
      elseif CM5==3
              board = num2str(board);
              board(board=='3') = 'O';
      elseif CM5==4
              board = num2str(board);
              board(board=='4') = 'O';
      elseif CM5==5
              board = num2str(board);
              board(board=='5') = 'O';
      elseif CM5==6
              board = num2str(board);
              board(board=='6') = 'O';
      elseif CM5==7
              board = num2str(board);
              board(board=='7') = 'O';
      elseif CM5==8
              board = num2str(board);
              board(board=='8') = 'O';
      elseif CM5==9
              board = num2str(board);
              board(board=='9') = 'O';
      end

      pause(t2);
      
      disp(board)
      
      
      if strcmp(board(1,2),'O') && strcmp(board(1,5),'O') && strcmp(board(1,8),'O') ||...
         strcmp(board(1,2),'O') && strcmp(board(2,5),'O') && strcmp(board(3,8),'O') ||...
         strcmp(board(1,2),'O') && strcmp(board(2,2),'O') && strcmp(board(3,2),'O') ||...
         strcmp(board(1,5),'O') && strcmp(board(2,5),'O') && strcmp(board(3,5),'O') ||...
         strcmp(board(1,8),'O') && strcmp(board(2,8),'O') && strcmp(board(3,8),'O') ||...
         strcmp(board(1,8),'O') && strcmp(board(2,5),'O') && strcmp(board(3,2),'O') ||...
         strcmp(board(2,2),'O') && strcmp(board(2,5),'O') && strcmp(board(2,8),'O') ||...
         strcmp(board(3,2),'O') && strcmp(board(3,5),'O') && strcmp(board(3,8),'O')  
             
          disp('That L was worse than my first Orgo2 exam grade')
          
          prompt3 = ('Would you like to play again?:');
          YesNo3 = input(prompt3,'s');
          
           if     strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                   disp('Laaaaammmmeeeee')
                   return
           elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                   disp('Lets Play')
                   break
           else  
                  h = true;
                   while h == true
                    YesNo4 = input(prompt2,'s');
                     if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                             disp('Laaaaammmmeeeee')
                             return
                     elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                             disp('Lets Play')
                             break
                     end
                   end 
           break
           end
      else
       disp('Looks like we have tie')
       prompt3 = ('Would you like to play again?:');
       YesNo3 = input(prompt3,'s');
        if     strcmpi(YesNo3,'no') || strcmpi(YesNo3,' no')
                disp('Laaaaammmmeeeee')
                return
        elseif strcmpi(YesNo3,'yes') || strcmpi(YesNo3,' yes')
                disp('Lets Play')
                break
        else  
               h = true;
                while h == true
                 YesNo4 = input(prompt2,'s');
                  if     strcmpi(YesNo4,'no') || strcmpi(YesNo4,' no')
                          disp('Laaaaammmmeeeee')
                          return
                  elseif strcmpi(YesNo4,'yes') || strcmpi(YesNo4,' yes')
                          disp('Lets Play')
                          break
                  end
                end 
        break
        end
       end
     end
    break
    end

   else     %%%% this else statement is connected to the conditional if at line 42 and the elseif at line 702. This is for when the user enter sometime outside of 'first' or 'second'
         g = true;
         while g == true %%% will loop you back to the original first or second input if you enter an incorrect value
               disp('You are literaly the worst. Only enter (fisrt) or (second):');
               break
         end
   end  %%% end for the conditional from line 42
end %%% end for the conditional from line 37


