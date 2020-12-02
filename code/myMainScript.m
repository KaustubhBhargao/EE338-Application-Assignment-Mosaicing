%% Some Standard images
tic;
%% Shanghai
%reading the images
img1 = imread('../data/shanghai-03.png');
img2 = imread('../data/shanghai-04.png');

%Evaluating the parameters (angle and translation coeffs)
[angle, tx, ty] = myParameters(img1(:,:,1), img2(:,:,1));

%Stitcing the images
Stitched_img = myStitch(img1, img2, angle, tx, ty);
figure();imshow(img1);
figure();imshow(img2);
figure();imshow(Stitched_img);

%% Wallpaper
img1 = imread('../data/wallpaper_1.jpg');
img2 = imread('../data/wallpaper_2.jpg');
[angle, tx, ty] = myParameters(img1(:,:,1), img2(:,:,1));
Stitched_img = myStitch(img1, img2, angle, tx, ty);
figure();imshow(img1);
figure();imshow(img2);
figure();imshow(Stitched_img);

%% Some Images taken from my Phone
%% Parking Lot
img1 = imread('../data/b_3.jpg');
img2 = imread('../data/b_4.jpg');
[angle, tx, ty] = myParameters(img1(:,:,1), img2(:,:,1));
Stitched_img = myStitch(img1, img2, angle, tx, ty);
figure();imshow(img1);
figure();imshow(img2);
figure();imshow(Stitched_img);

%% House
img1 = imread('../data/house_small_1.jpg');
img2 = imread('../data/house_small_2.jpg');
[angle, tx, ty] = myParameters(img1(:,:,1), img2(:,:,1));
Stitched_img = myStitch(img1, img2, angle, tx, ty);
figure();imshow(img1);
figure();imshow(img2);
figure();imshow(Stitched_img);
%% Living Room
img1 = imread('../data/tv_small_1.jpg');
img2 = imread('../data/tv_small_2.jpg');
[angle, tx, ty] = myParameters(img1(:,:,1), img2(:,:,1));
Stitched_img = myStitch(img1, img2, angle, tx, ty);
figure();imshow(img1);
figure();imshow(img2);
figure();imshow(Stitched_img);
toc;