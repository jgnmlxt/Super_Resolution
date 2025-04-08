function A=get_A(GT)
    [x,y,z]=size(GT);
    if (~x==y)||(~y==z)
        error("Dimension of GT is wrong; it should have same number of pixels in all dimension.");
    end

    if (~mod(x,4)==0)
        error("GT should have a size of 4n x 4n x 4n");
    end

    A=
end