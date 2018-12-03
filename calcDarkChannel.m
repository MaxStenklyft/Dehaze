function [darkChannel, darkImg] = calcDarkChannel(img, patchSize)
    [imgX,imgY, ~] = size(img);
    darkChannel = zeros(imgX,imgY);
    paddedImg = padarray(img, [ceil(patchSize/2) ceil(patchSize/2)], Inf);
    for x=1:imgX
        for y=1:imgY
            patch = paddedImg(x : x + (patchSize - 1), y : y + (patchSize - 1), :);
            
            darkChannel(x, y) = min(patch(:));
            
        end
    end
    
    darkImg = uint8(zeros(imgX, imgY, 3));
     for x=1:imgX
        for y=1:imgY
            arr = [darkChannel(x, y) darkChannel(x, y) darkChannel(x, y)];
            darkImg(x, y, :) = arr;
        end
     end
     
end
