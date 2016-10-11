% Preallocate the 256-by-256-by-1-by-20 image array.
%X = repmat(uint8(0), [368 448 1 64]);
% srcFiles = dir('C:\Users\Elitebook\Desktop\3DT2\Image*');
% for i = 1 : length(srcFiles)
%   filename = strcat('C:\Users\Elitebook\Desktop\3DT2\',srcFiles(i).name);
%   %X(:,:,1,i) = dicomread(filename);
%  % X(:,:,1,i) = mat2gray(X(:,:,1,i));
%   X = dicomread(filename);
%   X= mat2gray(X);
%   %figure, imshow(X);
%  
% end
 %figure, imshow(X(:,:,1,i),[]);
 srcFiles = dir('C:\Users\Elitebook\Desktop\3DT2\Image*'); 
X=cell(1,length(srcFiles));
for i = 1 : length(srcFiles)
  filename = strcat('C:\Users\Elitebook\Desktop\3DT2\',srcFiles(i).name);
  I = dicomread(filename);
  I=mat2gray(I);
  X{1,i}=I;
 
end
%h=X;
 m=zeros(size(I));
%m=zeros(368,448);
%c=size (X);
%m=uint8(m);
for i=100:268
    for j=124:324
        m(i,j)=1;
    end
end
for i = 1 : length(srcFiles)
   % X(:,:,1,i)=X(:,:,1,i).*m;
   X{1,i}=X{1,i}.*m;
end
figure, imshow(X{1,25});
%figure, imshow(X(:,:,1,25),[]);
%%X1=imadjust(X(:,:,1,i),[0.5 0.8],[]);
%figure, h=histogram(X);
%h1=imgaussfilt(X(:,:,1,5),[2,1]);
%figure, imshow(h1);
%%figure, montage(X,[])


        