function image_series=create_shifted_images(GT,compressing_factor)

    if isscalar(GT)
        temp=GT;
        GT=zeros(GT*compressing_factor+(compressing_factor-1),GT*compressing_factor+(compressing_factor-1));
        GT(1:temp*compressing_factor,1:temp*compressing_factor)=phantom("Modified Shepp-Logan",temp*compressing_factor);
    else 
        [rows,cols]=size(GT);
        if ~mod(rows-(compressing_factor-1),compressing_factor)==0 || ~mod(cols-(compressing_factor-1),compressing_factor)
            error("The image does not have redundancy for shifts. ");
        end
    end
    
    image_series=cell(compressing_factor,compressing_factor);
    small_pixel_number=length(GT)-(compressing_factor-1);
    
    for i=1:compressing_factor
        for j=1:compressing_factor
            image_series{i,j}=GT(i:i+small_pixel_number-1,j:j+small_pixel_number-1);
        end
    end
    
end