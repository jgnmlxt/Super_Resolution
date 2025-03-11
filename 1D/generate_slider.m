function slider=generate_slider(larger_pixel,compressing_factor)
    slider=zeros(larger_pixel*compressing_factor,larger_pixel*compressing_factor+compressing_factor-1);
    
    for i=1:larger_pixel*compressing_factor
        slider(i,i:i+compressing_factor-1)=1;
    end

end