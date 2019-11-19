function registration=MRF(imageI, imageJ,maxIteration)

%[width,height,bands]=size(imageI);
%image=imstack2vectors(imageI);

moving = imhistmatch(imageI,imageJ);
[D,movingReg] = imregdemons(imageI,imageJ,[500 400 200],'AccumulatedFieldSmoothing',1.3);
    
%GCO_LoadLib();
%L = gco_matlab('gco_create_general',int32(512*512),int32(100));

infoI = dicominfo('thorac2.dcm');
I=dicomread(infoI); % image that will be transformed.
imageI=double(movingReg);

info = dicominfo('thorac.dcm');
J = dicomread(info); % image that will be static. 
imageJ = double(J);

% Initialize the labeling. (For dicom files, it needs to have the 
L = initialiseLabelSpace(200,5);

% Transformation matrix of 2D vectors. 
T = zeros(512, 512 ,2 );

    iteration = 1;
    % Calculate the current energy of the field.
    currentEnergy = EnergyOfField(imageI, imageJ, T);
    while(iteration  < maxIteration)
        x = ComputeLabeling(imageI, imageJ, T, L);
      
        energyNow = EnergyOfField(imageI, imageJ, UpdateTransformation(T,x))
        if(currentEnergy > energyNow)
             T = UpdateTransformation(T,x);
             L = RefineLabelSpace(L, 0.9);
             currentEnergy = energyNow
        end
        iteration = iteration + 1
    end
    registration =  imwarp(imageI, T);
end