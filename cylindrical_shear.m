function [dst]=cylindrical_shear(BP,shear_fe,decomp,level)
% The function computes the cylindrical shearlet decompostion of the data set generated
% from setup_cylindrical_decomp.
%  Input:    LP - BP
%            shear_fe - cylindrical shearing filters
%            decomp - record of directions of decomposition 
%  Output:   dst - cell representing 3D cylinder shearlet decomposition 
%
% Written by Glenn Easley on October 12, 2020.
% Copyright 2020 by Glenn R. Easley. All Rights Reserved.
%

% reverse order of decomp to match 3D LP transform
decomp=fliplr(decomp);


disp('Representing data in a cylindrical shearlet decomposition');
dst = cell(1,level+1);
dst{level+1}=BP{level+1};
for i=1:level,
    for k=1:2^decomp(i),
        dst{i}(:,k,:,:)=real(conv_cyl(BP{i},squeeze(shear_fe{i}(:,:,:,k))));
    end %k
end %i level



