[filename,pathname]=uigetfile ( '*.*' , ' Select grayscale Image');
filewithpath=strcat (pathname, filename) ;
img = imread(filewithpath);
figure
subplot(3, 4, 1);
imshow(img);
title('1. Original');

% Convert the image to grayscale if it's an RGB image
if size(img, 3) == 3
    img = rgb2gray(img);
end
subplot(3, 4, 2);
imshow(img);
title('2. Grayscale image');

% Compute the DCT of the grayscale image
C = dct2(double(img));

subplot(3, 4, 7)
imshow(log(abs(C)), [])
title('DCT Coeffs. before truncation');
colormap(gca, jet(64))
colorbar

for i =1:4
threshold = 10*i; 
C_truncated = C;
C_truncated(abs(C) < threshold) = 0;

subplot(3, 4, i+7)
imshow(log(abs(C_truncated)), [])
title(['DCT After Truncation: Threshold = ', num2str(threshold)]);
colormap(gca, jet(64))
colorbar

img_compressed = uint8(idct2(C_truncated));
img_compressedo=gray2rgb(img_compressed);
imwrite(img, ['Original_Image_', num2str(threshold), '.jpg']);
imwrite(img_compressedo, ['DCT_Compressed_Image_', num2str(threshold), '.jpg']);

subplot(3, 4,i+2)
imshow(img_compressedo)
title(['Compressed Image: Threshold = ', num2str(threshold)]);

originalFileSize = dir(filewithpath).bytes;
compressedFileName = ['DCT_Compressed_Image_', num2str(threshold), '.jpg'];
processedFileSize = dir(fullfile(pathname, compressedFileName)).bytes;
fprintf('Original Image File Size: %d bytes\n', originalFileSize);
fprintf('Processed Image File Size: %d bytes\n', processedFileSize);
end