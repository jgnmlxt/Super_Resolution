function I=get_I(image_series)
    l1=length(image_series);
    l2=length(image_series{1,1});
    len=l1*l2;
   

    I=zeros(len^2,1);
    counter=0;
    for i=1:l1
        for j=1:l1
            counter=counter+1;
            I(1+(counter-1)*l2^2:counter*l2^2,1)=reshape(image_series{i,j}',1,[]);
        end
    end
end