# Super-Resolution Reconstruction Demonstration

## Project Overview
This project implements a **demonstration of super-resolution reconstruction** based on **sub-pixel shifts**. The method enhances image resolution by combining multiple low-resolution images with slight pixel shifts. Currently, the projects generates n*n low pixel Shepp-Logan phantoms with subpixel shifts in both directions, depending on the inputs.

## Usage Instructions

### Steps to Run:
1. Open **`twoD.mlx`** in MATLAB.
2. Set the following parameters:
   - **`larger_pixel_in_FoV`**: Number of pixels on each side before reconstruction.
   - **`compressing_factor`**: Defines how much finer the resolution should be.
   
### Example Configuration:
```matlab
larger_pixel_in_FoV=100;
compressing_factor=3;
```

### This configuration:

It generates 9 images of size 100×100.
Reconstructs a 300×300 super-resolved image.

### Future updates
The project is currently under construction to include additional options: Noise configuration, input image selection, shifting direction control, etc.