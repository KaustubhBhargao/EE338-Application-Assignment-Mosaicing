function stitched_img = myStitch(img1,img2,theta,tx,ty)

	[ x1 ,y1 ,~ ] = size(img1);
    f=imrotate(img2,theta);
    [ x2 ,y2 ,z ] = size(f);
%     [ x2 ,y2 ] = size(f);
    p=max((x1-x2)/2-ty+1,1);
    q=round(p+ty+(x2-x1)/2);
    r=max((y1-y2)/2-tx+1,1);
    s=round(r+tx+(y2-y1)/2);
    p=round(p);
    r=round(r);
    
    stitched_img=zeros(max(x2+p-1,q+x1-1),max(r+y2-1,s+y1-1),z);
%     stitched_img=zeros(max(x2+p-1,q+x1-1),max(r+y2-1,s+y1-1));
    stitched_img(p:x2+p-1,r:r+y2-1,: )=f;
    stitched_img(q:q+x1-1,s:s+y1-1,:)=img1;
    stitched_img = uint8(stitched_img);
end