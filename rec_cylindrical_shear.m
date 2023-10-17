function [xRec]=rec_cylindrical_shear(BP_sizes,dst,decomp,level)
% The function reconstructs the  cylindrical shearlet decompostion of the data set generated
% from setup_cylindrical_decomp.m and cylindrical_shear.m
%  Input:  BP_sizes - cell containing sizes of LP decomp.
%          dst - cylindrical shearlet decomp.
%          level - the levels of shearlet decomp. contained in dst 
%  Output: xRec - reconstructed data cube
%
% Written by Glenn Easley on October 12, 2020.
% Copyright 2020 by Glenn R. Easley. All Rights Reserved.
%

disp('Reconstructing data from its cylindrical shearlet decomposition');

% reverse order of decomp to match 3D LP transform
decomp=fliplr(decomp);

for i=1:level,
    L0(3)= BP_sizes{i}(3);
    sum_temp1=zeros(L0(3),L0(3),L0(3));
    for k=1:2^decomp(i),
        cm=squeeze(dst{i}(:,k,:,:));
        sum_temp1=sum_temp1+cm;
    end %k
    BP0{i}=sum_temp1;
end %i
BP0{level+1}=dst{level+1};
% Reconstruction from coeff.
xRec=DoPyrRec(BP0);

