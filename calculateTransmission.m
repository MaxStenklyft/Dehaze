function trans = calculateTransmission(img, atmosphere, omega, patch_size)
[xsize, ysize, ~] = size(img);

atm = repmat(reshape(atmosphere, [1, 1, 3]), xsize, ysize);

[dc,~] = get_dark_channel( image ./ atm, patch_size);

trans = 1 - omega * dc;
end