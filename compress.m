function compressed_image=compress(image,compressed_factor)
    [rows,cols,~]=size(image);
    
    if ~((mod(rows,compressed_factor)==0)&&(mod(cols,compressed_factor)==0))
        error("The size of the image cannot be compressed with such factor.")
    end

    compressed_image=zeros(rows/compressed_factor,cols/compressed_factor);
    temp_1=zeros(rows,cols/compressed_factor);

    for i=1:cols/compressed_factor
        temp=zeros(rows,1);
        for j=1:compressed_factor
            temp=temp+image(:,(i-1)*compressed_factor+j);
        end
        temp_1(:,i)=temp;
    end

    for i=1:rows/compressed_factor
        temp=zeros(1,cols/compressed_factor);
        for j=1:compressed_factor
            temp=temp+temp_1((i-1)*compressed_factor+j,:);
        end
        compressed_image(i,:)=temp;
    end
    compressed_image=compressed_image/(compressed_factor^2);
end