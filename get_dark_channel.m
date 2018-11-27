function [dark_channel,dark_img] = get_dark_channel(img, patch_size)
    [imgx,imgy, ~] = size(img);
    dark_channel = zeros(imgx,imgy);
    padded_img = padarray(img, [ceil(patch_size/2) ceil(patch_size/2)],Inf);
    for x=1:imgx
        for y=1:imgy
            patch = padded_img(x : x + (patch_size-1), y : y + (patch_size-1), :);
            
            dark_channel(x,y) = min(patch(:));
            
        end
    end
    
    dark_img = uint8(zeros(imgx,imgy,3));
     for x=1:imgx
        for y=1:imgy
            arr = [dark_channel(x,y) dark_channel(x,y) dark_channel(x,y)];
            dark_img(x,y,:) = arr;
        end
     end    
    imshow(dark_img);
    
end
