function [sad] = SAD(I,J)

sad = 0 ;

    for i = 1:512
        for j = 1:512
            a = double(I(i,j));
            b = double(J(i,j));
            sad = sad + abs(a - b);
        end
    end
end


