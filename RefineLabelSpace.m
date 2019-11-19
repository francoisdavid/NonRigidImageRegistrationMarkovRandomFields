function L = RefineLabelSpace(Lprev, refinementScalor)
L = Lprev  .* refinementScalor;
L = round(L);