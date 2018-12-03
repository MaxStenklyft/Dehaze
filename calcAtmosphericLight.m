function atmosphericLight = calcAtmosphericLight(img, darkChannel)

    [x, y, ~] = size(img);
    numPixels = x * y;
    numSearchPixels = floor(numPixels * 0.01);

    darkVector = reshape(darkChannel, numPixels, 1);
    imgVector = reshape(img, numPixels, 3);

    [~, indicies] = sort(darkVector, 'descend');
    accumulator = zeros(1, 3);

    for i = 1 : numSearchPixels
        accumulator = accumulator + imgVector(indicies(i), :);
    end

    atmosphericLight = accumulator / numSearchPixels;
    
end
    