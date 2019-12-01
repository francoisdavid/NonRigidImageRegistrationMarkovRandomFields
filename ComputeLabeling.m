function x=ComputeLabeling(I,J,T,L)
% The new labeling is initialized to zero.
x = zeros(512,512,2); 
for i = 1:512
    for j = 1:512
            % Maximum integer that will be replace with the energy of the
            % minimum possibility for all pixels. 
            minEnergy = intmax;
            % The label is just a 2D vector that will be replaced with the
            % choosen label for minimum energy. (Only used as a temp).
            label = [0 0];
         % Iterate through the labels.
        for k = 1:size(L(:,1))
            % Calculate the local energy of the possible label.
            energyOfLabel =  EnergyOfLabel(I,J, i,j,L(k,:), T, x);
            % If the energy is smaller than the current local minimum,
            % replace the label variable with this value. 
            if(energyOfLabel< minEnergy)
                label = L(k,:); 
                % Update the minimum energy.
                minEnergy = energyOfLabel;
            end
            % Replace the label in the x, which will be added to the
            % deformation field if the total energy of the field is lower
            % than prior.
            x(i,j,:) = label;
        end
    end
end

