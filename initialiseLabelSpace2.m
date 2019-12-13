

function L=initialiseLabelSpace2(dmax, scale)
 L = [0 0];
 currentMax = dmax;
 for i = 1:scale
      currentMax = (dmax/scale) *i;
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
 
 
 
 
 L = currentMax;