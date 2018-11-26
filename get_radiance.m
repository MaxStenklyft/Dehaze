function radiance = get_radiance(img, trans, atm)

    [x, y, ~] = size(img);

    rep_atm = repmat(reshape(atm, [1, 1, 3]), x, y);
    max_trans = repmat(max(trans, 0.1), [1, 1, 3]);
    radiance = ((img - rep_atm) ./ max_trans) + rep_atm;

end