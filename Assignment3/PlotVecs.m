function [chart] = PlotVecs(Vec1,Vec2)
%%% This function takes two vecotrs as inputs and plots them in the output 'chart'. 
%%% For the inputs, there need to be brackets [] around each vector and the vectors
%%% must be the same length. Ex. PlotVecs([1,2,3],[5,6,7]) 
%%% not PlotVecs([1,2,3,12,4],[5,6,7]). The x and y axis labels along with
%%% the title are generic. Considered creating an input where the user can
%%% write their own labels and title but ended up deciding not to do that
%%% for this assignment. 

chart = plot(Vec1,Vec2);

xlabel('GenericX (Units)')
ylabel('GenericY (Units)')
title('Random Title')


end

