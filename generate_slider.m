function slider=generate_slider(larger_pixel,compressing_factor)
    % Define sizes
    small_pixels=larger_pixel*compressing_factor;
    small_pixels_in_FoV=small_pixels+compressing_factor-1;
    slider=zeros((larger_pixel*compressing_factor)^2,small_pixels_in_FoV^2);
    
    % Generate base
    base=zeros(small_pixels^2,small_pixels_in_FoV^2);
    temp_slider=zeros(small_pixels_in_FoV,small_pixels_in_FoV);
    counter=0;

    % image_index1=images required after image_index1 shift vertically.
    for image_index1=1:compressing_factor
        % images required after image_index2 shift horizontally.
        for image_index2=1:compressing_factor
            counter=counter+1;
            display(counter);
            counter_inside=0;
            % for each large pixel in obtained image
            for i=1:larger_pixel
                for j=1:larger_pixel
                    counter_inside=counter_inside+1;
                    temp=temp_slider;
                    % Generate the generating matrix for each pixels in each images.
                    temp((i-1)*compressing_factor+1+image_index1-1:i*compressing_factor+image_index1-1,(j-1)*compressing_factor+1+image_index2-1:j*compressing_factor+image_index2-1)=1;
                    % Crush the matrix into a 1*n matrix.
                    slider(counter_inside+larger_pixel^2*(counter-1),:)=reshape(temp',1,[]);
                end
            end
            %slider{1+(counter-1)*larger_pixel^2+(larger_pixel+compressing_factor-1)*(counter_inside-1):1+(counter-1)*larger_pixel^2+(larger_pixel+compressing_factor-1)*counter_inside}=temp_slider;
        end
        
    end
end
