% Add the computed transfromation to the transformation T calculated in the MRF function if the energy has decreased.
function T = UpdateTransformation(T, x)
    T = T + x ; 
end
