function[] = filter_img(s_img)

    [m,n,~] = size(s_img);
    s_img = im2double(s_img);

    %% Forming the filter in the frequency domain 
    D0 = 20; % Cutoff frequency 

    u = 0:(m-1); 
    idx = find(u>m/2); 
    u(idx) = u(idx)-m; 
    v = 0:(n-1); 
    idy = find(v>n/2); 
    v(idy) = v(idy)-n; 

    [V, U] = meshgrid(v, u); 
    D = sqrt(U.^2+V.^2); 
    H = double(D <= D0);

    %% Filtering the image in the frequency domain 

    filtered_freq_img = fft2(s_img(:,:,1)).*H;
    redChannel = real(ifft2(double(filtered_freq_img)));

    filtered_freq_img = fft2(s_img(:,:,2)).*H;
    greenChannel = real(ifft2(double(filtered_freq_img)));

    filtered_freq_img = fft2(s_img(:,:,3)).*H;
    blueChannel = real(ifft2(double(filtered_freq_img)));


    final_filtered = cat(3, redChannel, greenChannel, blueChannel);
    imshow(redChannel);


    imshow(final_filtered, []); 
    %for i=1:r
    %  for j=1:c
    %      if((i-orgr)^2+(j-orgc)^2)^(0.5)<=D0
    %          mf(i,j)=1;
    %      end
    %  end
    %end
end 

