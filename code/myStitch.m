function out = myStitch(img1, img2, angle, tx, ty)

	[ x1 ,y1 ,~ ] = size(img1);
    img2_rot = imrotate(img2, angle);
    [ x2 ,y2 ,z ] = size(img2_rot);
    p = max((x1 - x2)/2 - ty + 1, 1);
    q = round(p + ty + (x2 - x1)/2);
    r = max((y1 - y2)/2 - tx + 1, 1);
    s = round(r + tx + (y2-y1)/2);
    p = round(p);
    r = round(r);
    
    out = zeros(max(x2 + p - 1, q + x1 - 1), max(r + y2 - 1, s + y1 - 1), z);
    out(p:(x2+p-1), r:(r+y2-1), : ) = img2_rot;
    out(q:(q+x1-1), s:(s+y1-1), :) = img1;
    out = uint8(out);
end
