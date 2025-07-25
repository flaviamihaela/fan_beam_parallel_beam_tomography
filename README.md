# Fan-Beam and Parallel-Beam Tomography in MATLAB

## Overview
This project demonstrates the simulation and reconstruction of tomographic images using both fan-beam and parallel-beam geometries. The script generates a synthetic phantom image (two circles of different intensities), computes its fan-beam projections (sinogram), converts these to parallel-beam projections, and reconstructs the original image using inverse Radon transform. This workflow is fundamental in computed tomography (CT) and medical imaging, illustrating how raw projection data can be used to recover internal structures.

### Key Concepts
- **Phantom Generation:** Creation of a synthetic image (phantom) with known shapes and intensities for testing reconstruction algorithms.
- **Fan-Beam Projection:** Simulates the data acquisition geometry used in many CT scanners, where X-rays fan out from a point source.
- **Sinogram:** A 2D representation of projection data as a function of angle and detector position.
- **Fan-to-Parallel Conversion:** Converts fan-beam data to parallel-beam geometry, which is often required for certain reconstruction algorithms.
- **Inverse Radon Transform:** Mathematical method to reconstruct the original image from its projections.

## Key Features
- Generates a 600x600 pixel phantom with two circles of different intensities.
- Computes and visualizes fan-beam sinograms.
- Converts fan-beam data to parallel-beam geometry.
- Reconstructs the image using the inverse Radon transform.
- Visualizes all intermediate and final results.

## Dependencies
- **MATLAB** (R2020b and later)
- Image Processing Toolbox (for `fanbeam`, `iradon`, etc.)

## Run
1. Open `Coursework.m` in MATLAB.
2. Ensure the Image Processing Toolbox is installed.
3. Click **Run** or type `Coursework` in the MATLAB command window.

## Usage (Parameter Tuning)
You can experiment with the following parameters in the script:
- **Phantom Size and Shape:**
  - Change the size of the phantom or the properties of the circles (center, radius, intensity) in the first section.
- **Fan-Beam Parameters:**
  - `fanbeam(phant, 426, ...)`:
    - `426`: Number of sensors (detectors). Increase for higher resolution sinograms.
    - `'FanSensorSpacing', 1.08`: Adjusts the angular spacing between sensors.
    - `'FanRotationIncrement', 1`: Change the angular step between projections.
- **Fan-to-Parallel Conversion:**
  - `'ParallelSensorSpacing', 10`: Controls the spacing of parallel detectors.
  - `'ParallelRotationIncrement', 1.08`: Adjusts the angular increment for parallel projections.
- **Reconstruction:**
  - `iradon(Precovered, 1.08, out_size)`: The second parameter is the angular increment. Match this to your projection data for best results.

## Output
- **Phantom Image:** Shows the original synthetic object.
- **Fan-Beam Sinogram:** Visualizes the raw projection data.
- **Parallel-Beam Sinogram:** Shows the converted data.
- **Reconstructed Image:** Displays the result of the inverse Radon transform.

