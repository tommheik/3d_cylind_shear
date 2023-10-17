function [M] = ifft_cyl(X)
% The function computes the iFFT of the 3D dataset X along
% the x-y axis. It is used in the function conv_cyl.
%
% Input: X - 3D data
% Output: M - iFFT of X along x-y axis
%
% Written by Glenn Easley on February  15, 2020.
% Copyright 2020 by Glenn R. Easley. All Rights Reserved.
%

M =(ifft(( (ifft((X),[],1))),[],2));

end

