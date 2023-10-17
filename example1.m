
clear all

cur_dir=pwd;
addpath([cur_dir '/3DBP']);
addpath([cur_dir '/Util']);

load StarSize128; % 3D 128x128x128 cube stored at IMSS0
display_data=1; % binary flag for determine to display (set to 1) or not (set to 0)

if display_data==1,
    % display slices of data cube
    [n_isr,n_isc,n_ist] = size(IMSS0);
    for t=1:n_ist,
        figure(1)
        imagesc(squeeze(IMSS0(:,:,t)))
        axis image
        colormap('gray');
        title('Data Cube')
        pause(0.1)
    end %t
end % display_data


decomp=[3 3 4 4];
dsize=[32 32 16 16];
level=4 ; % choose level of decomposition ,

[BP,shear_fe,BP_sizes]=setup_cylindrical_shear(IMSS0,decomp,dsize,level);

[dst]=cylindrical_shear(BP,shear_fe,decomp,level);

[xRec]=rec_cylindrical_shear(BP_sizes,dst,decomp,level);

norm( IMSS0(:)-xRec(:),2)

if display_data==1,
    % display slices of reconstructed data cube
    [r_isr,r_isc,r_ist] = size(xRec);
    for t=1:r_ist,
        figure(2)
        imagesc(squeeze(xRec(:,:,t)))
        axis image
        colormap('gray');
        title('Reconstucted Data Cube')
        pause(0.1)
    end %t
end % display_data
