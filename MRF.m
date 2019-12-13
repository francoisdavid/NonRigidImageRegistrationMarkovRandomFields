function registration=MRF(imageI, imageJ,maxIteration)
I = imageI;
[~,imageI] = imregdemons(imageI,imageJ,[500 400 200],'AccumulatedFieldSmoothing',1.3);
  
%GCO_LoadLib();
%L = gco_matlab('gco_create_general',int32(512*512),int32(100));

%infoI = dicominfo('thorac2.dcm');
%I=dicomread(infoI); % image that will be transformed.
imageI=double(imageI);

%info = dicominfo('thorac.dcm');
%J = dicomread(info); % image that will be static. 
imageJ = double(imageJ);

% Initialize the labeling. 
L = initialiseLabelSpace(25,5);

% Transformation matrix of 2D vectors. 
T = zeros(512, 512 ,2 );
iteration = 1;

energyGraph = [];

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
            
            %Store energy in an array
            energyGraph = [energyGraph, currentEnergy]
            
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

