function [score ,ty, tx]=myPeak(img_rot,img1)
[x,y]=size(img_rot);   

%Take 2D Fast Fourier Transform of the input images
DFT1 = fftshift(fft2(img1));  
DFT2_rot = fftshift(fft2(img_rot));        

%Calculate the phase correlation
PC=(DFT1.*conj(DFT2_rot))./(abs(DFT1.*conj(DFT2_rot)));

%Take invere Fast Fourier Transform and find the peak
pc = abs(ifftshift(ifft2(PC)));
score = max(max(pc));
x = floor(x/2)+1;
y = floor(y/2)+1;

%Return the displacement of the peak from the central pixel
[ty, tx] = find(pc==score);
ty = x - ty; %This will be the Y transaltion coordinate
tx = y - tx; %This will be the Y transaltion coordinate
end