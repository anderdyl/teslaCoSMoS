% COSMOS_lite_RunXB.m
    % created by: D. Anderson, Oregon State University
    
    
% directories for each XB run...

%%% Running original COSMOS:
load('/home/shusin7/users/danderso/COSMOS_lite/originalCOSMOS/tierII/XBeach/core_files_ex/xbprofile2m_SD_SLR000.mat')
profiles = [1:2]; %[120:4:160]

%%% Running Scripps transects with berm and without berm (added them to the
%%% orignal mat file given by COSMOS
%load('/home/server/pi/homes/danderso/COSMOS_lite/COSMOS_xbtransects.mat')
%profiles = 1216:1217;     


% Making a new directory
mkdir([project.model_directory, filesep, 'xbeach', filesep])


for h = 1:length(profiles)

    if isempty(xbprofile(h).x) == 0
    
    mkdir([project.model_directory, filesep, 'xbeach', filesep, num2str(profiles(h)), filesep])
    cd([project.model_directory, filesep, 'xbeach', filesep, num2str(profiles(h)), filesep])
    
    x = xbprofile(profiles(h)).x(1:end);
    y = xbprofile(profiles(h)).y(1:end);
    z = xbprofile(profiles(h)).z(1:end);
    
    
    p = polyfit(x,y,1);
    yfit = min(y):1:max(y);
    xfit = (yfit - p(2))/p(1);
    theta = abs(180/pi*(-acot(-p(1))-(pi/2)));
    
    
    d = sqrt((x-x(1)).^2 + (y-y(1)).^2);
    newy = 0.*ones(length(d),1);
    
    dlmwrite('x.grd', d, 'delimiter', ' ', 'precision', '%10.4f')
    dlmwrite('y.grd', newy, 'delimiter', ' ', 'precision', '%10.4f')    
%    dlmwrite('x.grd', xbprofile(profiles(h)).x(1:end), 'delimiter', ' ', 'precision', '%10.4f')
%    dlmwrite('y.grd', xbprofile(profiles(h)).y(1:end), 'delimiter', ' ', 'precision', '%10.4f')
    dlmwrite('z.dep', z, 'delimiter', ' ', 'precision', '%6.20f')

    nx = size(xbprofile(profiles(h)).x);
    xori = xbprofile(profiles(h)).x(1);
    yori = xbprofile(profiles(h)).y(1);

%     inst = [3614212.247 484190.910;3614212.138 484259.360;3614509.697 484490.446;...
%     3614503.035 484483.230;3614496.101 484475.842;3614496.140 484475.775;...
%     3614489.315 484468.689;3614488.897 484468.312;3614469.143 484446.836;3614212.247 484190.910];
% 
% dinst = sqrt((inst(:,2)-xori).^2 + (inst(:,1)-yori).^2);
%     

    
    x_origins(h) = xori;
    y_origins(h) = yori;
    
    if profiles(h) == 198
        sendin = 191;
        [water_level] = COSMOS_lite_extract_wl_from_D3D(project,sendin,xori,yori);
    elseif profiles(h) == 407 || profiles(h) == 408
        sendin = 406;
        [water_level] = COSMOS_lite_extract_wl_from_D3D(project,sendin,xori,yori);        
    else 
        sendin = profiles(h);
        [water_level] = COSMOS_lite_extract_wl_from_D3D(project,sendin,xori,yori);
    end
    hist_water_level(h) = water_level;
    x_profile_orig = sp2.location.data(:,1);
    y_profile_orig = sp2.location.data(:,2);
    
    index = find(abs(x_profile_orig-xori) == nanmin(abs(x_profile_orig-xori)));
    hhh = index(1);
    
    if hhh < 10
        copyfile([project.model_directory, filesep, 'delft3d' ,filesep, 'waves00', num2str(hhh), '.sp2'],[project.model_directory, filesep, 'xbeach', filesep, num2str(profiles(h)), filesep, 'waves00', num2str(profiles(h)), '.sp2'])
    elseif hhh < 100 && hhh > 9
        copyfile([project.model_directory, filesep, 'delft3d' ,filesep, 'waves0', num2str(hhh), '.sp2'],[project.model_directory, filesep, 'xbeach', filesep, num2str(profiles(h)), filesep, 'waves0', num2str(profiles(h)), '.sp2'])
    elseif hhh > 99
        copyfile([project.model_directory, filesep, 'delft3d' ,filesep, 'waves', num2str(hhh), '.sp2'],[project.model_directory, filesep, 'xbeach', filesep, num2str(profiles(h)), filesep, 'waves', num2str(profiles(h)), '.sp2'])
    end        
      
    
    fid=fopen('params.txt','wt');
    
    fprintf(fid,'%s\n','------------------------------------------');      
    fprintf(fid,'%s\n','');
    fprintf(fid,'%s\n','Grid input');                                      
    fprintf(fid,'%s\n','');
    fprintf(fid,'%s\n',['nx       = ' num2str(nx(1)-1) '']);                    % number of grid cells in the x
    fprintf(fid,'%s\n','ny       = 0');                                    % number of grid cells in the y
    fprintf(fid,'%s\n','xfile    = x.grd');                                % 
    fprintf(fid,'%s\n','yfile    = y.grd');                                %
%    fprintf(fid,'%s\n',['xori     = ' num2str(xori) '']);                  % x origin
%    fprintf(fid,'%s\n',['yori     = ' num2str(yori) '']);                  % y origin
    fprintf(fid,'%s\n',['xori     = ' num2str(0) '']);                  % x origin
    fprintf(fid,'%s\n',['yori     = ' num2str(0) '']);                  % y origin    
%%%%%%%%%%%%  need to figure out how much this changes for each  %%%%%%%%%%
%%%%%%%         do we have it in the model data from USGS?           %%%%%%
%    fprintf(fid,'%s\n',['alfa     = ' num2str(theta), '']);                              % angle of the computational x axis relative to "east"
%    fprintf(fid,'%s\n','alfa     = 33.4882');                              % angle of the computational x axis relative to "east"
    fprintf(fid,'%s\n','alfa     = 0');                              % angle of the computational x axis relative to "east"

    fprintf(fid,'%s\n',['depfile  = z.dep']);                 % the z file
    fprintf(fid,'%s\n','posdwn    = -1');                                  % positive up (-1) or down (1)?
    fprintf(fid,'%s\n','thetanaut = 0');                                   % cartesian (0) or nautical (1) convention
    fprintf(fid,'%s\n','thetamin  = -90');                                 % lower directional limit wrt computational x axis
    fprintf(fid,'%s\n','thetamax  = 90');                                  % higher directional limit wrt computational x axis
    fprintf(fid,'%s\n','dtheta    = 10');                                  % directional resolution
    fprintf(fid,'%s\n','vardx     = 1');                                   % switch for variable grid spacing
    fprintf(fid,'%s\n','------------------------------------------');      % 
    fprintf(fid,'%s\n','Numerics input');                                  %
    fprintf(fid,'%s\n','CFL      = 0.9');
    fprintf(fid,'%s\n','eps      = 0.01');
    fprintf(fid,'%s\n','------------------------------------------');      %
%%%%%%%%%  are time inputs simpler if stationary? %%%%%%%%%%%%%    
    fprintf(fid,'%s\n','Time input');                                      %
    fprintf(fid,'%s\n','tstart     = 0.');
    fprintf(fid,'%s\n','tstop      = 3600');
    fprintf(fid,'%s\n','taper      = 60');
    fprintf(fid,'%s\n','tintg      = 60');
    fprintf(fid,'%s\n','tintm      = 3600');
    fprintf(fid,'%s\n','tintp      = 60');
    fprintf(fid,'%s\n','------------------------------------------');      % 
    fprintf(fid,'%s\n','General constants');                               %
    fprintf(fid,'%s\n','rho     = 1025');
    fprintf(fid,'%s\n','g       = 9.81');
    fprintf(fid,'%s\n','------------------------------------------');      % 
 %%%%%%%  WHAT ARE WE DOING HERE???? #####   
    fprintf(fid,'%s\n','Boundary condition options');                      %
    fprintf(fid,'%s\n','zs0file  = tide.txt');
    %fprintf(fid,'%s\n',['zs0 = ' num2str(water_level) '']);
    fprintf(fid,'%s\n','tideloc  = 2');
    fprintf(fid,'%s\n','paulrevere = 0');

    %fprintf(fid,'%s\n','instat   = 41');
    fprintf(fid,'%s\n','tidelen   = 2');
    
    
    fprintf(fid,'%s\n','------------------------------------------');      %
    fprintf(fid,'%s\n','Wave calculation options');                        %
    fprintf(fid,'%s\n','break   = 3');
%%%%%%%%%%%%%%% want to use full SWAN spectra here? ###########  
    fprintf(fid,'%s\n','instat   = swan');
    if profiles(h) < 10
        fprintf(fid,'%s\n',['bcfile   = waves00', num2str(profiles(h)) ,'.sp2']);
    elseif profiles(h) < 100 && profiles(h) > 9
        fprintf(fid,'%s\n',['bcfile   = waves0', num2str(profiles(h)) ,'.sp2']);
    elseif profiles(h) > 99
        fprintf(fid,'%s\n',['bcfile   = waves', num2str(profiles(h)) ,'.sp2']);
    end        
    fprintf(fid,'%s\n','------------------------------------------');      %
    fprintf(fid,'%s\n','Flow calculation options');                        % 
    fprintf(fid,'%s\n','order    = 2');
    fprintf(fid,'%s\n','C        = 65');
    fprintf(fid,'%s\n','nuh      = 0.01');
    fprintf(fid,'%s\n','nuhfac   = 1.0');
    fprintf(fid,'%s\n','------------------------------------------');      %
%%%%%%%%%%%%%%%% we want to turn morphology off %%%%%%%%%%
     fprintf(fid,'%s\n','morphology = 0');
     fprintf(fid,'%s\n','sedtrans   = 0');     
%     fprintf(fid,'%s\n','Sediment transport calculation options');        %
%     fprintf(fid,'%s\n','form     = 1');
%     fprintf(fid,'%s\n','D50      = 0.00025');
%     fprintf(fid,'%s\n','lws      = 0');
%     fprintf(fid,'%s\n','turb     = 2');
%     fprintf(fid,'%s\n','ne_layer = sedlayer.dep');
%     fprintf(fid,'%s\n','------------------------------------------');    %
%     fprintf(fid,'%s\n','Morphological calculation options');             %
%     fprintf(fid,'%s\n','morfac     = 10');
%     fprintf(fid,'%s\n','struct     = 1');
%     fprintf(fid,'%s\n','------------------------------------------');    %  
%%%%%%%%%%%%% we don't need all of these variables %%%%%%%%%%%    
    fprintf(fid,'%s\n','Output options');                      % 
    
    fprintf(fid,'%s\n','outputformat = netcdf');
    
    fprintf(fid,'%s\n','nglobalvar = 6');
    fprintf(fid,'%s\n','H');
    fprintf(fid,'%s\n','zs');
    fprintf(fid,'%s\n','zb');
    fprintf(fid,'%s\n','wetz');
    fprintf(fid,'%s\n','u');
    fprintf(fid,'%s\n','v');
    
    fprintf(fid,'%s\n','nmeanvar = 13');
    fprintf(fid,'%s\n','H');
    fprintf(fid,'%s\n','thetamean');
    fprintf(fid,'%s\n','u');
    fprintf(fid,'%s\n','v');
    fprintf(fid,'%s\n','DR');
    fprintf(fid,'%s\n','zs');
    fprintf(fid,'%s\n','zb');
    fprintf(fid,'%s\n','As');
    fprintf(fid,'%s\n','Sk');
    fprintf(fid,'%s\n','hh');
    fprintf(fid,'%s\n','n');
%    fprintf(fid,'%s\n','runup');
    fprintf(fid,'%s\n','sigm');
    fprintf(fid,'%s\n','thet');
%     
%     fprintf(fid,'%s\n','npoints = 10');
% %     fprintf(fid,'%s\n','484191. 3614212.');
% %     fprintf(fid,'%s\n','484259. 3614212 ');
% %     fprintf(fid,'%s\n','484490. 3614510.');
% %     fprintf(fid,'%s\n','484483. 3614503.');
% %     fprintf(fid,'%s\n','484476. 3614496.');
% %     fprintf(fid,'%s\n','484476. 3614496.');
% %     fprintf(fid,'%s\n','484469. 3614489.');
% %     fprintf(fid,'%s\n','484468. 3614489.');
% %     fprintf(fid,'%s\n','484447. 3614469.');
% %     fprintf(fid,'%s\n','484191. 3614212.');
%     fprintf(fid,'%s\n',['',num2str(dinst(1)),' 0.']);
%     fprintf(fid,'%s\n',['',num2str(dinst(2)),' 0 ']);
%     fprintf(fid,'%s\n',['',num2str(dinst(3)),' 0.']);
%     fprintf(fid,'%s\n',['',num2str(dinst(4)),' 0.']);
%     fprintf(fid,'%s\n',['',num2str(dinst(5)),' 0.']);
%     fprintf(fid,'%s\n',['',num2str(dinst(6)),' 0.']);
%     fprintf(fid,'%s\n',['',num2str(dinst(7)),' 0.']);
%     fprintf(fid,'%s\n',['',num2str(dinst(8)),' 0.']);
%     fprintf(fid,'%s\n',['',num2str(dinst(9)),' 0.']);
%     fprintf(fid,'%s\n',['',num2str(dinst(10)),' 0.']);
%     
%     fprintf(fid,'%s\n','npointvar = 16');
%     fprintf(fid,'%s\n','zs');
%     fprintf(fid,'%s\n','zb');
%     fprintf(fid,'%s\n','H');
%     fprintf(fid,'%s\n','As');
%     fprintf(fid,'%s\n','Sk');
%     fprintf(fid,'%s\n','k');
%     fprintf(fid,'%s\n','L1');
%     fprintf(fid,'%s\n','u');
%     fprintf(fid,'%s\n','v');    
%     fprintf(fid,'%s\n','vmag');    
%     fprintf(fid,'%s\n','urms');    
%     fprintf(fid,'%s\n','ua');    
%     fprintf(fid,'%s\n','ue');
%     fprintf(fid,'%s\n','ve');   
%     fprintf(fid,'%s\n','umean');   
%     fprintf(fid,'%s\n','vmean');   
%    
    fprintf(fid,'%s\n','nrugauge = 1');    
    fprintf(fid,'%s\n',['' num2str(0) ' ' num2str(0) '' ]);                    % 
    
 %   fprintf(fid,'%s\n',['' num2str(xori) ' ' num2str(yori) '' ]);                    % 
    
    fclose(fid);
    
    
    fid=fopen('tide.txt','wt');
   %  fprintf(fid,'%s\n','zs');
   % fprintf(fid,'%s\n','zb');   
    fprintf(fid,'%s\n',['0 ' num2str(water_level) ' 0']);
    fprintf(fid,'%s\n',['3600 ' num2str(water_level) ' 0']);
    
    fclose(fid);

    disp(['made new directory for profile ',num2str(profiles(h)),' with x, y, z, params, and sp2 for point ',num2str(hhh),''])

    %system('xbeach-nompi ')


    end
end
