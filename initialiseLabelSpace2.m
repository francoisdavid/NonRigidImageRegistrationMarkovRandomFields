% Function used to initialise the label space depending on the max length of the vectors and the scaling. 
function L=initialiseLabelSpace2(dmax, scale)
% Start with the null vector. 
 L = [0 0];
 currentMax = dmax;
 % iterate through all the scaling.
 for i = 1:scale
      % Calculate the current max for this scaling. 
      currentMax = (dmax/scale) *i;
      % Calculate the diagonal values. Rounded of course. 
      diag = round(currentMax * currentMax / sqrt(3* currentMax * currentMax));
       L = [L;
           currentMax 0;
           -currentMax 0;
           0 currentMax; 
           0 -currentMax;
          diag,  diag;
          diag,-diag;
          -diag,diag;
         -diag,-diag];
 end
