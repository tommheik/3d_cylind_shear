# 3d_cylind_shear

## 3d Cylindrical Shearlet transform for Matlab

Numerical implementation of the cylindrical shearlet decomposition and reconstruction schemes for 3-dimensional data as described in  
- ["Optimally sparse representations of cartoon-like cylindrical data"](https://www.math.uh.edu/~dlabate/OptimalCylindricalShearlets.pdf),  
Glenn R. Easley, Kanghui Guo, Demetrio Labate & Basanta R. Pahari.  
*The Journal of Geometric Analysis* 31: 8926-8946, (2021).  
[DOI: 10.1007/s12220-020-00493-0](https://doi.org/10.1007/s12220-020-00493-0)

**Please cite the above article if you use these codes in your own projects.**

### Additional literature

Cylindrical shearlets are first introduced in 
- "Smooth projections and the construction of smooth parseval frames of shearlets",  
B. G. Bodmann, D. Labate & B. R. Pahari.  
*Advances in Computational Mathematics*, 45(5):3241–3264, (2019).  
[DOI: 10.1007/s10444-019-09736-3](https://doi.org/10.1007/s10444-019-09736-3)

Extension to 4D described in
- "Efficient representation of spatio-temporal data using cylindrical shearlets",  
T. A. Bubba, G. Easley, T. Heikkilä, D. Labate & J. P. Rodriguez Ayllon.  
*Journal of Computational and Applied Mathematics*, Volume 429, 115206, (2023).  
[DOI: 10.1016/j.cam.2023.115206](https://doi.org/10.1016/j.cam.2023.115206)  
Codes available in [Github](https://github.com/tommheik/4dCylindricalShearlet)


## Credits

- Filter setup, decomposition and reconstruction algorithms by **Glenn Easley**.  
Directional 2d shearlet filters described in:  
"Sparse Directional Image Representations using the Discrete Shearlet Transform", G. Easley, D. Labate & W. Q. Lim. *Applied and Computational Harmonic Analysis*, 25.1: 25-46, (2008).

- Laplacian pyramid decomposition scheme is part of **SurfBox**, the Surfacelet Toolbox for Matlab by **Yue Lu and Minh N. Do**:  
"Multidimensional Directional Filter Banks and Surfacelets", Y. M. Lu & M. N. Do. *IEEE Transactions on Image Processing*, 16(4):918-931, (2007).

- Adjoint algorithm by **Tommi Heikkilä**
