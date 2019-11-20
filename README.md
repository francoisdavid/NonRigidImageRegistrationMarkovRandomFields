# NonRigidImageRegistrationMarkovRandomFields


To use with the following lines:


It = MRF(I,J,30);


'It' is the image I with the applied transformation. 


To read dicom files: 

infoI = dicominfo('thorac2.dcm');
I=dicomread(infoI); % image that will be transformed.


