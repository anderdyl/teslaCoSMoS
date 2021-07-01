% COSMOS_lite_Inputs.m - creating the mat file that controls conditions
% used by Delft3D as input to Delft3D
    % created by: D. Anderson, Oregon State University
    
project.name = ['Case',num2str(casenumber),''];

project.model_directory = ['/home/server/pi/homes/danderso/COSMOS_lite/MDA_of_TESLA/',project.name,'/'];

project.clean_directory = '/home/server/pi/homes/danderso/COSMOS_lite/clean_flow_wave_models2/';

project.num_days = 3;

project.ref_year = 2018;
project.ref_month = 1;
project.ref_day = 1;

project.start_year = 2018;
project.start_month = 1;
project.start_day = 1;
project.start_hour = 0;

% Time resolution
inputs.timeStep = 0.06;
inputs.wave_comm_interval = 60;
inputs.store_time_interval = 60;
inputs.print_interval = 60;

% Map printing automatically occurs at end of simulation
% WAVES
inputs.wave_height_north = TESLA_design(casenumber,5);
inputs.wave_period_north = TESLA_design(casenumber,6);
inputs.wave_dir_north = TESLA_design(casenumber,7);

inputs.wave_height_south = TESLA_design(casenumber,8);
inputs.wave_period_south = TESLA_design(casenumber,9);
inputs.wave_dir_south = TESLA_design(casenumber,10);

inputs.wave_height_local = TESLA_design(casenumber,11);
inputs.wave_period_local = TESLA_design(casenumber,12);
inputs.wave_dir_local = TESLA_design(casenumber,13);

% WINDS
wind_speed_calc = sqrt(TESLA_design(casenumber,3).^2 + TESLA_design(casenumber,4).^2);
dir = atan2d(TESLA_design(casenumber,4),TESLA_design(casenumber,3));
wind_dir_calc = pol2compass(dir)+180;
if wind_dir_calc > 360
    wind_dir_calc = wind_dir_calc - 360;
end

inputs.wndspd = wind_speed_calc;
inputs.wnddir = wind_dir_calc;


inputs.xspd = TESLA_design(casenumber,3);
inputs.yspd = TESLA_design(casenumber,4);
% PRESSURE
%inputs.ap = 100534;
inputs.ap = TESLA_design(casenumber,2);

% SEASONAL + MMSLA
inverse_barometer = (101300-inputs.ap)/10000;
inputs.wl = TESLA_design(casenumber,1);



display('created input mat file')

