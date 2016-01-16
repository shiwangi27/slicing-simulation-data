%% This file generates the slices of images from the cube 
% Given a 1-D vector, the task is to first get points that belong to 
% say X-Z plane. After an image is sliced, to view the grayscales in this
% image.

%%Slicing the cube along the Y-axis 
size_x = 193;
size_y = 194;
size_z = 193;
sizeTotal=size_x*size_y*size_z;

path = 'file_path';
fileNames = {['S00.raw'], ['S11.raw'], ['S22.raw'], ['S01.raw'], ['S02.raw'], ['S12.raw']};
%fileNames = {['divergence.raw']};
data_size = [size_x size_y size_z];

% Read the binary files into 1-D array
data = read_binary(path, fileNames, data_size, 'single');


% 
% %small code for reading divergence
% data=zeros(sizeTotal,1);
% fid=fopen('E:/TensorData/2/divergence.raw','r','l');
% temp=fread(fid,sizeTotal,'single');
% data(:,1)=temp;
% 


%Slicing along X-Z direction
size_xz=size_x*size_z;
i=1;
j=1;
k=1;
index=1;

% slice image 1 data structure
slice=zeros(size_z,size_x);

%looping over 'j' images in y direction, such that 
%rows = points along x direction 
%columns = points along z direction

%Initialize matrix to store full training data
training_inputs=zeros(194,size_xz); 

for j=1:194 
    for i = 1:193 
        for k = 1:193 
            slice(i,k)=data(index,1); 
            %slice1(:,2)= k; 
            index=index+1; 
        end 
    end 
    %Converts matrix into grayscale, range[0,1] 
    slice_gray=mat2gray(slice); 
    
    % Save 194 such images in data file. The format used is 'tiff' 
    %save_image(slice_gray,j); 
    
    %Reshape each image
    reshaped_slice = reshape(slice_gray,1,193*193); 
    %Populate each reshaped image into training_inputs
    for cols=1:size_xz 
        training_inputs(j,cols) = reshaped_slice(cols);
    end
     %vectorize_data(slice_gray,training_inputs,size_xz,j); 
end

%Save the training_inputs as csv
csvwrite('training_inputs.csv',training_inputs);

%imshow(slice1_gray); 


