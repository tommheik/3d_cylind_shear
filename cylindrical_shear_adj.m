function [adj]=cylindrical_shear_adj(BP_sizes,dst,shear_fe,decomp,level)
% The function computes the cylindrical shearlet adjoint of the data set
%  generated from setup_cylindrical_decomp and cylindrical_shear.
%  Input:    BP_sizes - sizes of the pyramid decomposition arrays
%            dst - cylindrical shearlet transform coefficients
%            shear_fe - cylindrical shearing filters
%            decomp - record of directions of decomposition 
%  Output:   adj - 3D array representing the adjoint
%
% Written by Tommi Heikkilä on November 23, 2020.
%
% Based heavily on the original 3D cylindrical shearlet transform codes by
% Glenn Easley and Demetrio Labate.
%

% reverse order of decomp to match 3D LP transform
decomp=fliplr(decomp);

for i=1:level,
    BP0{i} = zeros(BP_sizes{i});
    for k=1:2^decomp(i),
        % Sum over directions:
        % f_p^j = sum_l SHf_{j,l} * m_{j,l}
        BP0{i} = BP0{i} + real(conv_cyl(squeeze(dst{i}(:,k,:,:)), squeeze(shear_fe{i}(:,:,:,k))));
        % Note that the filters m_{j,l} are NOT actually rotated: the filters
        % are symmetric along the origin so in theory rotation invariant and 
        % for even length arrays this causes shift which breaks the adjoint!
    end %k
end %i level
BP0{level+1}=dst{level+1};
% Pyramid transform adjoint (inverse)
adj=DoPyrRec(BP0);