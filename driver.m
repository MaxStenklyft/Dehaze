
function radiance = driver()
    imgList = {'HazyImages/wisconsin-state-capitol'};
    imgUint8 = imread([imgList{1}  '.jpg']);
    img = im2double(imgUint8);
    [xSize, ySize, ~] = size(img);
    %SHOULD ALLOW FOR SETTING OF CONSTANTS
    omega = .80;
    patchSize = 5;
    
    [darkChannel, darkImage] = calcDarkChannel(img, patchSize);
    
    atmosphere = calcAtmosphericLight(img, darkChannel);
    
    trans = calculateTransmission(img, atmosphere, omega, patchSize);
    
    %TODO smooth trans
    
    radiance = calcRadiance(img, trans, atmosphere);
    imshow(radiance);
    
    %{
    imgList = {'HazyLondon', 'HazyQatar', 'wisconsin-state-capitol'};
    patchList = {5,20,50};
    collageImg = imread('HazyQatar.jpg');
    for i=1:length(patch_list)
        tic;
        img = Dark_Image_Prior('HazyQatar',patch_list{i});
        imwrite(uint8(img), [ 'dark_qatar(' int2str(patch_list{i}) ').png']);
        toc;
    end
    %}

end