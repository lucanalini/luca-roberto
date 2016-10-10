% Preallocate the 256-by-256-by-1-by-20 image array.
X = repmat(uint8(0), [368 448 1 64]);
srcFiles = dir('/Users/Luca/Documents/Matlab/Images of Prostate for MAIA project 1/Patient 373/3D T2/Image*');
for i = 1 : length(srcFiles)
  filename = strcat('/Users/Luca/Documents/Matlab/Images of Prostate for MAIA project 1/Patient 373/3D T2/',srcFiles(i).name);
  X(:,:,1,i) = dicomread(filename);
end
h=X(:,:,1,32);
m=zeros(368,448);
m=uint8(m);
for i=100:268
    for j=124:324
        m(i,j)=1;
    end
end
for i = 1 : length(srcFiles)
    X(:,:,1,i)=X(:,:,1,i).*m;
end
figure, imshow(X(:,:,1,5));
%%X1=imadjust(X(:,:,1,i),[0.5 0.8],[]);
%figure, h=histogram(X);
h1=imgaussfilt(X(:,:,1,5),[2,1]);
figure, imshow(h1);
%%figure, montage(X,[])


        