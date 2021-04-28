clear all
close all
clc
img1=imread('aa.jpg');
subplot(2,2,3), imhist(img1);
subplot(2,2,1), imshow(img1);
img2 = histeq(img1);
subplot(2,2,4), imhist(img2);
subplot(2,2,2), imshow(img2);

 