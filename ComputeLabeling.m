function x=ComputeLabeling(I,J,T,L)

x = zeros(512,512,2); 
for i = 1:512
    for j = 1:512
            minEnergy = 9999999999;
            label = [0 0];
        for k = 1:size(L(:,1))
            energyOfLabel =  EnergyOfLabel(I,J, i,j,L(k,:), T);
            if(energyOfLabel< minEnergy)
                label = L(k,:); 
                minEnergy = energyOfLabel;
            end
            x(i,j,:) = label;
        end
    end
end
