function final_image=create_image(wanted_pixel,compressing_factor,range_start,range_end)
    if range_end<=range_start
        error("range_end is smaller or equal to range_end");
    end
    n_smaller_pixel=wanted_pixel*compressing_factor;
    total_pixel=n_smaller_pixel+2*(compressing_factor-1);
    final_image=rand(1,total_pixel);
    % stretch the image
    final_image=final_image*(range_end-range_start);
    % shift the image
    final_image=final_image+(range_start+range_end)/2-(range_end-range_start)/2;
end