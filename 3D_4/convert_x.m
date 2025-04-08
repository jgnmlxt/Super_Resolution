function image=convert_x(x)
    [rows,~]=size(x);
    dim=round(rows^(1/3));
    image=zeros(dim,dim,dim);

    for i=1:dim
        image(:,:,i)=reshape(x(1+(i-1)*dim*dim:i*dim*dim),dim,dim)';
    end
end