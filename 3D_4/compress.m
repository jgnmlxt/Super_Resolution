function output=compress(given)
    [x,y,z]=size(given);
    output=zeros(x*y*z,1);
    for i=1:z
        compressed=reshape(given(:,:,i)',[],1);
        output(1+(i-1)*x*y:i*x*y)=compressed;
    end
end