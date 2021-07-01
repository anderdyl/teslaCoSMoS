% COSMOS_lite_Run.m - Master loop to run COSMOS-lite 
% created by: D. Anderson, Oregon State University
    clear
    
addpath(('/home/server/pi/homes/danderso/COSMOS_lite/'))
addpath(genpath('/home/server/pi/homes/danderso/downloaded_functions'))
addpath(genpath('/home/server/pi/homes/danderso/delft3d/openearth/applications/DelftDashBoard'))
addpath(genpath('/home/server/pi/homes/danderso/delft3d/openearth/applications/delft3d_matlab'))
addpath(genpath('/home/server/pi/homes/danderso/Matlab'))
cd('/home/server/pi/homes/danderso/COSMOS_lite/')

% WHERE EVERYTHING IS DEFINED BY THE USER
%   - model directory
%   - wave parameters
%   - water level
%   - timing
TESLA_cases;

for casenumber = 1:600

COSMOS_lite_Inputs;

% Running Delft3D
%   - creates the necessary directories
%   - creates all input files for D3D
%   -
COSMOS_lite_RunD3D;

cd(project.model_directory);
save('allvars.mat');

disp(['Produced the folder and necessary sub-directories/inputs for case ',num2str(casenumber),''])

end
% Running Xbeach




