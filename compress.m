function compressed_image_series=compress(image_series,compressing_factor)
    
    if ~(iscell(image_series) && ~(isempty(image_series)) && ~(isempty(image_series{1,1})) && ismatrix(image_series{1,1}(1))) % Check if it is not a cell of format {[[]]}.
        error("Data is wrong. It should be a cell, with a size of compresing_factor*compressing_factor, and each of elements is an image, or it could be a single image. ");

    elseif ~all((size(image_series)==[compressing_factor,compressing_factor])==1) || ~iscell(image_series) || isempty(image_series) % Check if the cell has a wrong dimension.
        error("The size of image_series is wrong. ")
    end


    for counter_i=1:compressing_factor
        for counter_j=1:compressing_factor

            image=image_series{counter_i,counter_j};
    
            [rows,cols,~]=size(image);
            
            if ~((mod(rows,compressing_factor)==0)&&(mod(cols,compressing_factor)==0))
                error("The size of the image cannot be compressed with such factor.")
            end
        
            compressed_image=zeros(rows/compressing_factor,cols/compressing_factor);
            temp_1=zeros(rows,cols/compressing_factor);
        
            for i=1:cols/compressing_factor
                temp=zeros(rows,1);
                for j=1:compressing_factor
                    temp=temp+image(:,(i-1)*compressing_factor+j);
                end
                temp_1(:,i)=temp;
            end
        
            for i=1:rows/compressing_factor
                temp=zeros(1,cols/compressing_factor);
                for j=1:compressing_factor
                    temp=temp+temp_1((i-1)*compressing_factor+j,:);
                end
                compressed_image(i,:)=temp;
            end
            compressed_image=compressed_image/(compressing_factor^2);
            compressed_image_series{counter_i,counter_j}=compressed_image;
        end

    end
end