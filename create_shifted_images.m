function image_series=create_shifted_images(GT,compressing_factor)
    image_series=cell(1,compressing_factor^2);
    
    for i=1:compressing_factor
        for j=1:compressing_factor
            shifted_GT=zeros(size(GT));
            shifted_GT(1:end-(i-1),1:end-(j-1))=GT(i:end,j:end);
            image_series{(i-1)*compressing_factor+j}=shifted_GT;
        end
    end
    
end