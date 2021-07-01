% COSMOS_lite_RunD3D.m
    % created by: D. Anderson, Oregon State University
    

% directories
% All of the grd, enc, dep, obs files we need are in a clean folder
cleandir = project.clean_directory;%'C:\Users\anderdyl\Documents\Research\COSMOS\clean_flow_wave_models\';
modeldir = project.model_directory;%'Y:\COSMOS\test\test_dd_flow_wave\';

% lets copy the clean directory to a newly made model directory
mkdir([modeldir, filesep, 'delft3d', filesep])
copyfile(cleandir,[modeldir, filesep, 'delft3d', filesep])

cd([modeldir, filesep, 'delft3d']);

display('copied clean directory')
% Writing mdf inputs and copying all grids, enc, deps to new directory
%   - using default parameter values
% Writing offshore boundaries with tide components
%COSMOS_lite_D3D_variboundary;
COSMOS_lite_D3D_random_seaBoundary;
%COSMOS_lite_D3D_topex_boundary;
inputs.start_wl = tsum(1)+inverse_barometer;   

COSMOS_lite_D3D_MDFfiles;

% Writing wave files
%   - using default parameter values
COSMOS_lite_D3D_MDWfiles;

% Writing a wave spectrum;
COSMOS_lite_D3D_write_wave_spectra_input;

% Writing file designating which boundaries communicate with each other
COSMOS_lite_D3D_ddcoms;

% Writing wind files (constant winds);
%COSMOS_lite_D3D_wind;
COSMOS_lite_D3D_space_var_wind;

% Writing atmospheric pressure file (constant)
COSMOS_lite_D3D_space_var_atm;



% Writing config_d_hydro.xml file
COSMOS_lite_D3D_xml;

% Writing shell script file
COSMOS_lite_D3D_runflowsh;




system('chmod 775 run_flow2d3d.sh');
%system('./run_flow2d3d.sh')
% system([modelir, filesep, 'delft3d', filesep,

