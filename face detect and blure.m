%read all the jpg images from the current directory
imagefiles = dir('*.jpg');
%nfiles will store the total no of  jpg images in the folder
nfiles = length(imagefiles);    % Number of files found
%this loop will read the name and the images in the current directory
for ii=1:nfiles
%to read all the images name 
currentfilename = imagefiles(ii).name;
%read all the jpg images trough itss name
currentimage = imread(currentfilename);
%face detection trough this method
faceDetector = vision.CascadeObjectDetector;
%making a rectangle where detect face
bbox=step(faceDetector,currentimage);
for j=1:size(bbox)
xbox=bbox(j,:);
%crop the area where face is save in sub image 
subImage = imcrop(currentimage, xbox);
%convert the cropped image in gray scale it was in rgb
t_image=rgb2gray(subImage);
%rgb have 3 channels and gray scale have one so to make all the chanels gray use the code
subImage(:,:,1)=t_image;
subImage(:,:,2)=t_image;
subImage(:,:,3)=t_image;
%replace the cropped area image with this gray image 
currentimage(xbox(2):xbox(2)+xbox(4),xbox(1):xbox(1)+xbox(3),1:end) = subImage;
%save the name of the images with pic1 pic2 pic3 etc
newname=strcat('pic',num2str(ii));
%save the images with bmp format and also with new name
imwrite(currentimage,strcat(newname,'.bmp'));
%end of inner loop 
end
%end of outer loop
end