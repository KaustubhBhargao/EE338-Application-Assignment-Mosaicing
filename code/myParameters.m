function [angle, tx, ty] = myParameters(img1, img2)

% score_mtrx = zeros(1, 359);
% for d = -179:1:179
%     img_rot = imrotate(img2, d, 'bilinear', 'crop');
%     [score_mtrx(d + 180), ~, ~] = myPeak(img_rot, img1);
%     fprintf('Tesing for angle %d \n', d);
% end
% 
% [~,angle] = max(score_mtrx);
% angle = angle - 180;

score_mtrx = zeros(1, 181);
for d = -90:1:90
    img_rot = imrotate(img2, d, 'bilinear', 'crop');
    [score_mtrx(d + 91), ~, ~] = myPeak(img_rot, img1);
    fprintf('Tesing for angle %d \n', d);
end

[~,angle] = max(score_mtrx);
angle = angle - 91;

img2_rot = imrotate(img2, angle, 'bilinear', 'crop');
[~, ty, tx] = myPeak(img2_rot, img1);

end

% %This function calculates the Matching scores for POC and Bandlimited POC

% function [theta,tx,ty]=myParameters(img1,img2)
% a=zeros(1,41);
% for k=(-20:20)
%     f=imrotate(img2,k,'bilinear','crop');
%     [a(k+21),~,~]=myPeak(f,img1);
% end
% 
% %Take the image 'f' that has the Maximum POC value with 'img2' to select the rotation
% %normalized image.
% 
% [~,theta]=max(a);
% theta=theta-21;
% f=imrotate(img2,theta,'bilinear','crop');
% 
% 
% % Estimate the Image Displacement between f and g from the peak
% % location 
% 
% [~,ty,tx]=myPeak(f,img1);
% 
% end
