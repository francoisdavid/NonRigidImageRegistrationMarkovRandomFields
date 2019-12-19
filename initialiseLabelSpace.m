% Function used to initialise the label space depending on the max length of the vectors and the scaling. 
function L=initialiseLabelSpace(dmax, scale)
% Start it with the null vector.
L = [0 0];
% Iterate through the given scaling.  
currentMax = dmax;
for i = 1:scale
     % Calulate the max of the vectors currently. 
     currentMax = (dmax/scale) *i;
     % Add the new label vectors.
     L = [L;
         currentMax 0;
         -currentMax 0;
         0 currentMax; 
         0 -currentMax;];
end
