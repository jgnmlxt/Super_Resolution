function [image_series,GT_]=compress_1D(GT,compressing_factor,l_pixel,shifting_direction)

% Shift the pixels
    n_pixel=l_pixel*compressing_factor;

    % Determine whether the total pixel is enough for shifting.
    % Determine whether the redundancies are symmetrical.
    % Determine if the Fov could be compressed.
    if length(GT)<2*(compressing_factor-1)+n_pixel
        error("Input images does not have enough redundancy in length for shifting.");
    elseif ~mod(length(GT)-n_pixel,2)==0
        error("Input image has different redundancy between directions. ");
    elseif ~mod(n_pixel,compressing_factor)==0
        error("Input image cannot be compressed in such compressing factor. ");
    end

    start_point=(length(GT)-n_pixel)/2+1; % Start point of FoV
    end_point=start_point+n_pixel-1; % End point of FoV
    shifted_image_series=cell(compressing_factor,1);

    % Determin shifting direction.
    if shifting_direction=="l"
        d_shift=-1;
    elseif shifting_direction=="r"
        d_shift=1;
    else
        error("Please set shifting direction to 'l' or 'r'. ");
    end

    for i=1:compressing_factor
        shifted_image_series{i}=GT(start_point-d_shift*(i-1):end_point-d_shift*(i-1));
    end

    GT_=shifted_image_series{1};

% Compress the pixels
    image_series=cell(compressing_factor,1);
    for i=1:compressing_factor
        temp=zeros(1,l_pixel);
        for j=1:l_pixel
            temp(j)=sum(shifted_image_series{i}(1+(j-1)*compressing_factor:compressing_factor*j));
        end
        image_series{i}=temp;
    end


end