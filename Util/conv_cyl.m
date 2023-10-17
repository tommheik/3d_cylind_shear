function H=conv_cyl(F,G)
% The function computes the 2D convolution of the 3D datasets F and G along
% the x-y axis. 
%
% Input:  F,G - 3D data
% Output: H - convolution of F and G along x-y axis
%
% Written by Glenn Easley on February  15, 2020.
% Copyright 2020 by Glenn R. Easley. All Rights Reserved.
%

% pad G and F only in two dimensions
Fz=size(F);
sizef=[ Fz(1) Fz(2)];
Gz=size(G);
sizeg=[ Gz(1) Gz(2)];


% the third dimension has to be the same size as F and G
L=Gz(3); 

nsize = sizef + sizeg - 1;  % enough room for no overlap
for i=1:L
    Fn(:,:,i) = exindex(squeeze(F(:,:,i)), 1:nsize(1), 1:nsize(2), {0});
    Gn(:,:,i) = exindex(squeeze(G(:,:,i)), 1:nsize(1), 1:nsize(2), {0});
end

FO=fft_cyl(Gn).*fft_cyl(Fn);
H_extended=ifft_cyl(FO);
% calculate appropriate lengths 
sh1=(sizeg(1)/2);
sh2=(sizeg(2)/2); 
rows=(floor(sh1)+1:(1*sizef(1)+1*sizeg(1)-ceil(sh1)+0));
cols=(floor(sh2)+1:(1*sizef(2)+1*sizeg(2)-ceil(sh2)+0));
% restrict 
for i=1:L
  H(:,:,i)=(H_extended( rows ,cols, i ));
end

