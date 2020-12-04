tic;
%% Reading Images

img1 = imread('../data/wallpaper_1.jpg');
img2 = imread('../data/wallpaper_2.jpg');


%% Downsampling images 
% Every image had to be downsampled to a different extent 
img1 = imresize(img1, [500,700]);
img2 = imresize(img2, [500,700]);




%% Eavaluating the Rotation and Shift Parameters

[angle, tx, ty] = myParameters(img1(:,:,1), img2(:,:,1));


%% Stitching the images

s_img = myStitch(img1, img2, angle, tx, ty);


%% Displaying the stiched image 
figure;
imshow(s_img), axis image; colorbar; 

%% Filtering the image 
filter_img(s_img)

