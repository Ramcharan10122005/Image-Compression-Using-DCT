# Image-Compression-Using-DCT

1)The code provided performs image compression using the Discrete Cosine Transform (DCT) technique.

# Here's a brief explanation of the theory behind the code:

1)Discrete Cosine Transform (DCT): DCT is a widely used transform technique in image compression. It transforms spatial domain information into frequency domain information. DCT converts a signal or image from its spatial domain representation into a frequency domain representation.

2)DCT Coefficients: After applying DCT to the image, it produces a set of coefficients that represent the image's frequency components. These coefficients are usually concentrated in the lower frequency components, which represent the essential features of the image, while higher frequency components contain finer details.

3)Truncation: In image compression, high-frequency DCT coefficients usually contribute less to the overall perceptual quality of the image compared to low-frequency coefficients. Truncating or removing these high-frequency coefficients can significantly reduce the amount of data needed to represent the image while preserving its essential features.

4)Algorithm: The provided code iterates through different threshold values to truncate DCT coefficients. It sets coefficients below each threshold to zero, effectively compressing the image. After each truncation, it reconstructs the image using the inverse DCT (IDCT) and displays both the compressed image and the DCT coefficients.
File Size Comparison: The code also compares the file sizes of the original image and the compressed image at each compression level, demonstrating the reduction in file size achieved through compression.

5)Visualization: The code visualizes the original grayscale image, the grayscale image after conversion (if applicable), the DCT coefficients before truncation, the DCT coefficients after truncation, and the corresponding compressed images at different compression levels.

6)Observation: As the threshold increases, more DCT coefficients are set to zero, resulting in higher compression levels. However, increasing compression leads to loss of image quality, especially in finer details represented by higher-frequency components.
