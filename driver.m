
function radiance = driver()
    img_list = {'HazyImages/HazyQatar'};
    img = imread([img_list{1}  '.jpg']);
    [xsize, ysize, ~] = size(img);
    %SHOULD ALLOW FOR SETTING OF CONSTANTS
    omega = .95;
    patch_size = 3;
    
    [darkChannel, dark_image] = get_dark_channel(img, patch_size);
    
    atmosphere = get_atmospheric_light(img, darkChannel);
    
    trans = calculateTransmission(img, atmosphere, omega, patch_size);

    %TODO smooth trans
    
    radiance = get_radiance(img, trans, atmosphere);
    
    imshow(radiance);
    
    %{
    img_list = {'HazyLondon', 'HazyQatar', 'wisconsin-state-capitol'};
    patch_list = {5,20,50};
    collage_img = imread('HazyQatar.jpg');
    for i=1:length(patch_list)
        tic;
        img = Dark_Image_Prior('HazyQatar',patch_list{i});
        imwrite(uint8(img), [ 'dark_qatar(' int2str(patch_list{i}) ').png']);
        toc;
    end
    %}

end