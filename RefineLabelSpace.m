% Function used to refine the label space, used and called by the MRF main segment.
function L = RefineLabelSpace(Lprev, refinementScalor)
 % Multiply each values in the label space by the refinement scalor that is normally smaller than 1. 
 L = Lprev  .* refinementScalor;
 L = round(L);
