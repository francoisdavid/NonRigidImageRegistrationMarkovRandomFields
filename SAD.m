% Function used to calculate the Sum Absolute Difference between two images.
function [sad] = SAD(I,J)
% Initialize to zero.
sad = 0 ;
    % Iterate through each pixels of the image, in all of the dicom used, the size was 512 but it could be changed accordingly.
    for i = 1:512
        for j = 1:512
            % Add the difference to the total sad variable.
            a = double(I(i,j));
            b = double(J(i,j));
            sad = sad + abs(a - b);
        end
    end
end


