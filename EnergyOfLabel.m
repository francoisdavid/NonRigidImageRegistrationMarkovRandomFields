
function e = EnergyOfLabel(I,J,i,j,L,T, x)
	e = 0;
    a = 3.5;
    
    potentialx = i+ T(i,j,1)+L(1);
    potentialy = j + T(i,j,2)+L(2);
    if potentialx > 0 && potentialy > 0 && potentialx < 513 && potentialy <513  
      
        e = e +  abs((minus(I(potentialx ,potentialy), J(i,j))));

         
        % Calculating the energy of the different neighboring cells
        if potentialx ~= 512 && i ~= 512
            e = e + abs((minus(I(potentialx+1 ,potentialy), J(i+1,j))));
        end 
        if potentialx ~= 1 && i ~= 1 
             e = e + abs((minus(I(potentialx-1 ,potentialy), J(i-1,j))));
        end
        if potentialy ~= 512  && j~= 512
             e = e + abs((minus(I(potentialx ,potentialy+1), J(i,j+1))));
        end
        if potentialy ~= 1 && j ~= 1
             e = e + abs((minus(I(potentialx ,potentialy-1), J(i,j-1))));
        end

        
        if(i ~= 512)
             % Right clique energy calculations.
             x1 = i+L(1)+T(i,j,1) + x(i,j,1);
             x2 = i+1+T(i+1,j,1) + x(i+1,1);
             y1 = j+L(2)+T(i,j,2)+ x(i,j,2);
             y2 = j+T(i+1,j,2) + x(i+1,j,2);
             e = e + a * abs(sqrt( (x2-x1)^2 + (y2 - y1)^2));
        end 
        if(i ~= 1)
             % Left clique energy calculations.
             x1 = i+L(1)+T(i,j,1)+ x(i,j,1);
             x2 = i-1+T(i-1,j,1)+ x(i-1,j,1) ;
             y1 = j+L(2)+ T(i,j,2) + x(i,j,2);
             y2 = j+T(i-1,j,2)+ x(i-1,j,2);
             e = e + a * abs(sqrt( (x2-x1)^2 + (y2 - y1)^2));
        end
        if(j~=512)
              % Down clique energy calculations.
              x1 = i+L(1)+ T(i,j,1) + x(i,j,1);
              x2 = i+T(i,j+1,1) +  x(i,j+1,1);
              y1 = j+L(2)+ T(i,j,2) + x(i,j,2);
              y2 = j+1+T(i,j+1,2) + x(i,j+1,2);
              e = e + a * abs(sqrt( (x2-x1)^2 + (y2 - y1)^2));
        end
        if(j~=1)
              % Up clique energy calculations.
              x1 = i+L(1)+T(i,j,1) + x(i,j,1);
              x2 = i+T(i,j-1,1) + x(i,j-1,1);
              y1 = j+L(2)+ T(i,j,2) + x(i,j,2);
              y2 = j-1+T(i,j-1,2) + x(i,j-1,2);
              e = e + a * abs(sqrt( (x2-x1)^2 + (y2 - y1)^2));
        end
    else 
       e = 99999999999999; 
    end
end
