GT=phantom3d(48);
%% 
a=[1 2 3;4 5 6;7 8 9];
b=zeros(3,3,3);
b(:,:,1)=a;
b(:,:,2)=a;
b(:,:,3)=a;

output=compress(b);