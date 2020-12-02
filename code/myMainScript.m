tic;
%% Reading Images

img1 = imread('../data/house_1.jpg');
img2 = imread('../data/house_2.jpg');
%imshow(img1);

%% Eavaluating the Rotation and Shift Parameters

[angle, tx, ty] = myParameters(img1(:,:,1), img2(:,:,1));

%% Stitching the images

stitched_img = myStitch(img1, img2, angle, tx, ty);
figure;
imshow(stitched_img), axis image; colorbar; 

toc;

% %% Wallpaper
% tic;
% %reading the images
% img1 = imread('../data/bed_1.jpg');
% img2 = imread('../data/bed_2.jpg');
% 
% % Estimating the rigid transformation between the images
% [theta, tx, ty] = myParameters(img1(:,:,1), img2(:,:,1));
% 
% % Stitching the images using transformation parameters
% out = myStitch(img1,img2,theta,tx,ty);
% figure();imshow(img1);
% figure();imshow(img2);
% figure();imshow(out);
% toc;
