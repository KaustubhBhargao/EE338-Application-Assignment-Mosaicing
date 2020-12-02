function [score, tx, ty] = myPeak(rotated_img, img1)
[x, y] = size(rotated_img);
x = floor(x/2) + 1;
y = floor(y/2) + 1;
%here we compute the phase correlation value
DFT1 = fftshift(fft2(img1));
DFT2_rot = fftshift(fft2(rotated_img));

%Let PC deone the phase correllation value

PC = (DFT2_rot.*conj(DFT1))./(abs(DFT2_rot.*conj(DFT1))) ;
pc = abs(ifftshift(ifft2(PC)));
% num = DFT1.*conj(DFT2_rot);
% denom = abs(num);
% denom = denom + ~logical(denom);
% PC = num./denom;
% pc = abs(fftshift(ifft2(PC)));

score = max(max(pc));
[tx, ty] = find(pc==score);
tx = tx - x;
ty = ty - y;

end

% function [output,index1,index2]=myPeak(image1,image2)
% 
% [in1,in2]=size(image1);   
% %Take FFT of the input images
% f=fft2(image1);        
% g=fft2(image2);          
% %Calculate the F*G/mod(F*G)
% b=f.*conj(g);           
% mod=abs(b);                   
% w=mod+~logical(mod);
% m=b./(w);
% %Take invere FFT and find the peak
% inverse=abs(fftshift(ifft2(m)));
% output=max(max(inverse));
% x=floor(in1/2)+1;
% y=floor(in2/2)+1;
% %Return the displacement of the peak from the central pixel
% [index1,index2]=find(inverse==output);
% index1=index1-x;
% index2=index2-y;
% end

