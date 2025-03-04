function create_shifted_images(GT,compressing_factor)
    image_series={};
    
    
    for i=1:compressing_factor
        for j=1:compressing_factor
            shifted_GT=zeros(size(GT));
            shifted_GT(:,1:end-1)=GT(:,2:end);
        end
    end
    
    
end