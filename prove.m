
 srcFiles = dir('C:\Users\Elitebook\Desktop\3DT2\Image*'); 
X=cell(1,length(srcFiles));
for i = 1 : length(srcFiles)
  filename = strcat('C:\Users\Elitebook\Desktop\3DT2\',srcFiles(i).name);
  I = dicomread(filename);
  I=mat2gray(I);
  X{1,i}=I;
 
end
 m=zeros(size(I));
%m=zeros(368,448);
%c=size (X);
%m=uint8(m);

% for i=130:230
%     for j=180:270
%         
%         m(i,j)=1;
%     end
% end
    
% for i = 1 : length(srcFiles)
%    % X(:,:,1,i)=X(:,:,1,i).*m;
%    X{1,i}=X{1,i}.*m;
% end

% for i = 130 : 230
%     for j = 180 : 270
%     if (X{1,25}(i,j)>1)
%         X{1,25}(i,j) = 0; 
%     end
%     end
% end 
for k=1:length(srcFiles)
d(:,:,k)=X{1,k};
end
 d=d*100;
 d=uint8(d);
% load mri D                                     % load data
d = squeeze(d);                                % remove singleton dimension
 %LIMITS =    [xmin xmax ymin ymax zmin zmax]
%limits = [0 400 0 400 1 10];
limits = [NaN NaN NaN NaN NaN 10];
[x, y, z, d] = subvolume(d, limits);           % extract a subset of the volume data

[fo,vo] = isosurface(x,y,z,d,5);               % isosurface for the outside of the volume
[fe,ve,ce] = isocaps(x,y,z,d,5);               % isocaps for the end caps of the volume

figure
p1 = patch('Faces', fo, 'Vertices', vo);       % draw the outside of the volume
p1.FaceColor = 'red';
p1.EdgeColor = 'none';

p2 = patch('Faces', fe, 'Vertices', ve, ...    % draw the end caps of the volume
   'FaceVertexCData', ce);
p2.FaceColor = 'interp';
p2.EdgeColor = 'none';

view(-40,24)
daspect([1 1 0.3])                             % set the axes aspect ratio
colormap(gray(100))
box on