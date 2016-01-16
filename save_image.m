function [] = save_image(slice_gray, slice_num)
%save the images in a file. The format is .tiff 
%The values are gray scale values ranging between [0,1]

path='file_path';
img_name = strcat('slice',num2str(slice_num),'.png');
filename = fullfile(path,img_name); 
%fid=fopen(filename,'w');
imwrite(slice_gray,filename,'WriteMode','png');   

end

