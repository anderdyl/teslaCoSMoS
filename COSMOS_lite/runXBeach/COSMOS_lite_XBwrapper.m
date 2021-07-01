

clear


addpath(genpath('/home/shusin7/users/danderso/delft3d/openearth/applications/DelftDashBoard'))
addpath(genpath('/home/shusin7/users/danderso/delft3d/openearth/applications/delft3d_matlab'))
addpath(genpath('/home/shusin7/users/danderso/delft3d/openearth/general/io_fun'))
addpath('/home/shusin7/users/danderso/COSMOS_lite')

casenumbers = [1:15,17:85,87:600];
% case 16 crashed - should try smaller timestep?
% case 86 crashed - should try smaller timestep?

for ppp = 1:length(casenumbers)
    
    cases = casenumbers(ppp);
    disp(['Now working on case ',num2str(cases),''])
    cd(['/home/shusin7/users/danderso/MDA_of_TESLA/Case',num2str(cases),'/'])
    load('allvars.mat')
    project.model_directory = ['/home/shusin7/users/danderso/MDA_of_TESLA/',project.name,'/'];
    
    COSMOS_lite_PrepareXB
    
    cd(['/home/shusin7/users/danderso/MDA_of_TESLA/Case',num2str(cases),'/'])
    
    COSMOS_lite_RunXB

    clearvars -except cases casenumbers ppp
end

% addpath(genpath('/home/server/pi/homes/danderso/delft3d/openearth/applications/DelftDashBoard'))
% addpath(genpath('/home/server/pi/homes/danderso/delft3d/openearth/applications/delft3d_matlab'))
% addpath(genpath('/home/server/pi/homes/danderso/delft3d/openearth/general/io_fun'))
% addpath('/home/server/pi/homes/danderso/COSMOS_lite')
% 
% casenumbers = 1:600;%551:600;%251:300;
% for ppp = 1:length(casenumbers)
%     
%     cases = casenumbers(ppp);
%     disp(['Now working on case ',num2str(cases),''])
% 
%         
%         
%     cd(['/home/server/pi/homes/danderso/COSMOS_lite/MDA_of_TESLA/Case',num2str(cases),'/'])
%     load('allvars.mat')
%     project.model_directory = ['/home/server/pi/homes/danderso/COSMOS_lite/MDA_of_TESLA/',project.name,'/'];%'Y:\COSMOS\test\test_dd_flow_wave\';
%     COSMOS_lite_PrepareXB
%     cd(['/home/server/pi/homes/danderso/COSMOS_lite/MDA_of_TESLA/Case',num2str(cases),'/'])
%     
%     %    project.model_directory = ['/home/server/pi/homes/danderso/COSMOS_lite/LatinHypercubeEmpiricalPresentDay/',project.name,'/'];%'Y:\COSMOS\test\test_dd_flow_wave\';        
%     %    project.model_directory = ['/home/server/pi/homes/danderso/COSMOS_lite/LatinHypercubeEmpiricalfuture/',project.name,'/'];%'Y:\COSMOS\test\test_dd_flow_wave\';    
%     %    cd(['/home/server/pi/homes/danderso/COSMOS_lite/LatinHypercubeEmpiricalPresentDay/Case',num2str(cases),'/'])    
%     %    cd(['/home/server/pi/homes/danderso/COSMOS_lite/LatinHypercubeEmpiricalfuture/Case',num2str(cases),'/'])
%     COSMOS_lite_RunXB
%     
%     clearvars -except cases casenumbers ppp
% end








