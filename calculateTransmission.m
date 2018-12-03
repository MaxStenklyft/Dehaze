function trans = calculateTransmission(img, atmosphere, omega, patchSize)
    [xSize, ySize, ~] = size(img);

    atm = repmat(reshape(atmosphere, [1, 1, 3]), xSize, ySize);

    [dc,~] = calcDarkChannel(img ./ atm, patchSize);

    trans = 1 - omega * dc;
end