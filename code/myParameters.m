%This function calculates the Matching scores for POC and Bandlimited POC

function [angle ,tx, ty] = myParameters(img1, img2)
%ith column in score matrix will save the score (Phase correlation maxima)
% of the image rotated by i degrees
score_mtrx = zeros(1,360);
for d = (1:360)
    img2_rot = imrotate(img2, d, 'bilinear', 'crop');
    [score_mtrx(d), ~, ~] = myPeak(img2_rot, img1);
%     fprintf('Testimg for angle %d \n', d);
end

%We will find tha angle which gave the maximum phase correlation value with
%image 1
[~,angle] = max(score_mtrx);
img2_rot = imrotate(img2 ,angle, 'bilinear', 'crop');

%Now find the transalation coordinates by finding the phase correlation 
%between rotated image and original image 
[~,ty,tx] = myPeak(img2_rot, img1);

end
