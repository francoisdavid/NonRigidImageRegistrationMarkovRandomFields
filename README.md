# NonRigidImageRegistrationMarkovRandomFields
Algorithm using a MRF for image registration.

## How to use the algorithm.

#### Read the first image. For a Dicom file which will become Image I.

```Matlab
infoI = dicominfo('thorac.dcm');
I=dicomread(infoI); % image that will be transformed.
```

#### Read the second image. For a Dicom file which will become Image J.

```Matlab
infoJ = dicominfo('thorac2.dcm');
J=dicomread(infoJ); % image that will model the transformation.
```

#### Running the algorithm. The variable IT will become the registered image, the 3rd parameter is the number of iterations that will be performed, we recommend between 25 and 30 iterations.
```Matlab
IT = MRF(I,J,30);
```
#### Then, in order to calculate the Sum Absolute Difference between the 2 original images, we run: 
```Matlab
IJSAD = SAD(I,J);
```

#### To calculate the Sum Absolute Difference between the registered image and the target images, we run: 
```Matlab
ITJSAD = SAD(IT,J);
```

#### To plot the 3 different images. The image I, the transformed image and the target image J.
```Matlab
subplot(3,1,1)
imshow(I,[]);
title("Image I");

subplot(3,1,2)
imshow(IT, []) ;
title("Transformed Image");

subplot(3,1,3)
imshow(J,[]);
title("Image J");
```

#### More images used can be found in the bin.zip file.
