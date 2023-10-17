function [BP,shear_fe,BP_sizes]=setup_cylindrical_shear(IMSS0,decomp,dsize,level)
% The function sets up the cylinder decompostion  of the data set IMSS0
% using decompitions decomp with sizes dsize up to level specified.
%  Input: IMSS0 - 3D data 
%         decomp - set of exponents of 2 that determing shearing filters
%         dsize - set of dyatic lengths determing the sizes of the shearling filters 
%         level - the levels of shearlet decomp. contained in dst 
%
%  Output: BP - the Laplacian decomp 
%          shear_fe - 3D cylinder shearing filters 
%          BP_sizes - cell containing sizes of LP decomp.
%
% Written by Glenn Easley on October 12, 2020.
% Copyright 2020 by Glenn R. Easley. All Rights Reserved.
%

% bandpass filter data
BP=DoPyrDec(IMSS0,level);


shear_fe=cell(1,level); % declare cell array containing shearing filters

% reverse order of decomp and dsize to match 3D LP transform
decomp=fliplr(decomp);dsize=fliplr(dsize);

for i=1:level,
     BP_sizes{i}=size(BP{i});
     L0(3)= BP_sizes{i}(3);
    shear_f{i}=shearing_filters_Myer(dsize(i),decomp(i)).*sqrt(dsize(i));
    %%%%%%%%%%%%%%%
    % replicate the shearing filter to be of the same z-dimension as BP{i}
    %%%%%%%%%%%%%%%
    for k=1:2^decomp(i),
        for ss0=1:L0(3)
            shear_fe{i}(:,:,ss0,k)=shear_f{i}(:,:,k);
        end
    end
    %%%%%%%%%%%%%%%
end


