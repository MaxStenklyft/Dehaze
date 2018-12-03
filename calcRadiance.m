function radiance = calcRadiance(img, trans, atm)

    [x, y, ~] = size(img);

    repAtm = repmat(reshape(atm, [1, 1, 3]), x, y);
    maxTrans = repmat(max(trans, 0.1), [1, 1, 3]);
    radiance = ((img - repAtm) ./ maxTrans) + repAtm;
    
end