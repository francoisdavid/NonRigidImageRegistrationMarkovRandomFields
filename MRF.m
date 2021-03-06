function registration=MRF(imageI, imageJ,maxIteration)
% Save the original image to a variable that will be used to calculate the SADBefore at the end.
I = imageI;
% Linear registration like in the paper.
[~,imageI] = imregdemons(imageI,imageJ,[500 400 200],'AccumulatedFieldSmoothing',1.3);

% Make the 2 images as double for computations. 
imageI=double(imageI);
imageJ = double(imageJ);

% Initialize the labeling. 
L = initialiseLabelSpace(25,5);

% Transformation matrix of 2D vectors. 
T = zeros(512, 512 ,2 );
iteration = 1;

% Calculate the current energy of the field.
currentEnergy = EnergyOfField(imageI, imageJ,T);

% Used for convergence. 
while(iteration  < maxIteration)
        % Compute the current labelling. Store the matrix of labels in the
        % variables X. 
       x = ComputeLabeling(imageI, imageJ, T, L);
       % Calculate the energy of the field with the transformation calculated
       % above + the current transformation to the image. 
       energyNow = EnergyOfField(imageI, imageJ, UpdateTransformation(T,x));
       % If the energy newly calculate witht the current labelling is smaller,
       % update the current transformation.
       if(currentEnergy > energyNow)
           % Update transformation. 
            T = UpdateTransformation(T,x);
            
            %update the value of the current energy of the field. 
            currentEnergy = energyNow;
       else 
           % If not, then we refine the labelling so that the new labelling
           % might change the current energy of the field. If not changed, it
           % would stay the same. 
            L = RefineLabelSpace(L, 0.67);
       end
       iteration = iteration + 1
       currentEnergy
end
    % Return the transformation field. 
    registration =imwarp(imageI,T);
    SADBefore = SAD(I, imageJ)
    SADAfter = SAD(registration, imageJ)
    
end

