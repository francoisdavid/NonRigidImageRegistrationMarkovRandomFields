function L=initialiseLabelSpace(dmax, scale)
L = [0 0];
currentMax = dmax;
for i = 1:scale
     currentMax = (dmax/scale) *i;
     %diag = curentMax * currentMax / sqrt(3* currentMax * currentMax);
     L = [L;
         currentMax 0;
         -currentMax 0;
         0 currentMax; 
         0 -currentMax;];
        %diag,  diag;
        %diag,-diag;
        %-diag,diag;
        %-diag,-diag];
end
L
% To select
%L = L(2,:);