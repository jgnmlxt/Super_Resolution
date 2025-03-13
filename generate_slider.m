function slider=generate_slider(larger_pixel,compressing_factor)
    % Define sizes
    small_pixels=larger_pixel*compressing_factor;
    slider=cell(small_pixels,small_pixels);
    
    % Generate base
    base=zeros(small_pixels+compressing_factor-1,small_pixels+compressing_factor-1);
    
    for i=1:small_pixels
        disp(i);
        for j=1:small_pixels
            temp=base;
            temp(i:i+compressing_factor-1,j:j+compressing_factor-1)=1;
            slider{i,j}=reshape(temp',1,[]);
        end
    end
end
