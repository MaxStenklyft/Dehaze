function atmospheric_light = get_atmospheric_light(img, dark_channel)

    [x, y, ~] = size(img);
    num_pixels = x * y;
    num_search_pixels = floor(num_pixels * 0.01);

    dark_vector = reshape(dark_channel, num_pixels, 1);
    img_vector = reshape(img, num_pixels, 3);

    [~, indicies] = sort(dark_vector, 'descend');
    accumulator = zeros(1, 3);

    for i = 1 : num_search_pixels
        accumulator = accumulator + img_vector(indicies(i), :);
    end

    atmospheric_light = accumulator/num_search_pixels;
    
end
    