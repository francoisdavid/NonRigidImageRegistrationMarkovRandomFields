% Function used to calculate the overall energy of the field accordinf to the SAD and the clique energy generated.
function e=EnergyOfField(I,J,T)
energy = 0 ; 
% Energy of every pixels.
for i = 1:512
    for j = 1:512
        % Calculates the difference between each end point (after transformation) of a pixel and point in static image.  
        energy = energy + abs((I(i+T(i,j,1),j+T(i,j,2)) - J(i,j)));
        if i~= 512
            energy = energy + abs((I(i+1+T(i+1,j,1),j+T(i+1,j,2)) - J(i+1,j)));
        end
        if i~=1 
            energy = energy + abs((I(i-1+T(i-1,j,1),j+T(i-1,j,2)) - J(i-1,j)));
        end
        if j~= 512 
            energy = energy + abs((I(i+T(i,j+1,1),j+1+T(1,j+1,2)) - J(i,j+1)));
        end
        if j~=1
            energy = energy + abs((I(i+T(i,j-1,1),j-1+T(i,j-1,2)) - J(i,j-1)));
        end
    end
end
a = 600; % Smoothing factor.
% Cliques potential.
for i = 1:511
    for j=1:511
        % Left and right clique calculations.
        x1 = i+T(i,j,1);
        x2 = i+1+T(i+1,j,1);
        y1 = j+T(i,j,2);
        y2 = j+T(i+1,j,2);
        energy = energy + a * abs(sqrt((x2-x1)^2 + (y2 - y1)^2));
        % Not divised by the distance in points, since the degree of the
        % field is 1, the distane between each point is 1. 
        
        % Up and down clique calculations.
        x1 = i+T(i,j,1);
        x2 = i+T(i,j+1,1);
        y1 = j+T(i,j,2);
        y2 = j+1+T(i,j+1,2);
        energy = energy + a * abs(sqrt((x2-x1)^2 + (y2 - y1)^2));
         % Not divised by the distance in points, since the degree of the
        % field is 1, the distane between each point is 1. 
    end
end
e = energy;
