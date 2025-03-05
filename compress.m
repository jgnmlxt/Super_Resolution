function compressed_image_series=compress(image_series,compressing_factor)
    
    if class(image_series)=="double"

        image_series={image_series};

    end

    compressed_image_series=cell(1,length(image_series));

    for counter=1:length(image_series)

        image=image_series{counter};

        [rows,cols,~]=size(image);
        
        if ~((mod(rows,compressing_factor)==0)&&(mod(cols,compressing_factor)==0))
            error("The size of the image cannot be compressed with such factor.")
        end

        dbclear if error
    
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
        compressed_image_series{counter}=compressed_image;

    end
end