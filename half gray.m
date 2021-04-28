%HALF GRAY IMAGE
img1=imread('bb.jpg');
img1(:,1:end/2,:)=repmat(rgb2gray(img1(:,1:end/2,:)),1,1,3);
imshow(img1);