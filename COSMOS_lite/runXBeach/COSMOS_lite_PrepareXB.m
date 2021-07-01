% COSMOS_lite_PrepareXB.m
    % created by: D. Anderson, Oregon State University

    
% change to the directory where the D3D output has been produced    
cd(['',project.model_directory, filesep, 'delft3d' ])
%addpath(genpath('/home/server/pi/homes/danderso/delft3d/openearth/applications/DelftDashBoard'))
%addpath(genpath('/home/server/pi/homes/danderso/delft3d/openearth/applications/delft3d_matlab'))
%addpath(genpath('/home/server/pi/homes/danderso/delft3d/openearth/general/io_fun'))
%addpath(genpath(project.model_directory))
%addpath('/home/server/pi/homes/danderso/COSMOS_lite')
% want this to be a standard file spit out at a single time 
sp2 = COSMOS_lite_xb_swan_read(['',project.model_directory, filesep, 'delft3d' ,filesep, 'socal_sdn1t073.sp2']);
% splitting the 4-D data in sp2 into individual spectra for each profile
sp2new = COSMOS_lite_xb_swan_split(sp2,'location');
% printing a new sp2 file for each xbeach case, numbered by the number of
% the transect
COSMOS_lite_xb_swan_write('waves.sp2',sp2new);

% Ok, we want to create a separate directory for each of these, and add x,
% y, z, files and print inputs


