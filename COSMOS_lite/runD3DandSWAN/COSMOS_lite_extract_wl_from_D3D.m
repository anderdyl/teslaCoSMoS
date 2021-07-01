function [water_level] = COSMOS_lite_extract_wl_from_D3D(project,h,xori,yori);


%project.model_directory = ['/home/server/pi/homes/danderso/COSMOS_lite/water_level_2daytest_withpt5A0_midjuly/'];

%load('/home/server/pi/homes/danderso/COSMOS_old/models/tierII/XBeach/core_files_ex/xbprofile2m_SD_SLR000.mat')

%nx = size(xbprofile(h).x);
%xori = xbprofile(h).x(1);
%yori = xbprofile(h).y(1);
    
mdfnames = [{'socal_sd'};{'diego_outer'};{'diego_bay'};{'impbeach'};...
    {'mssnbay'};{'nasni'};{'sdb_hi'};{'sweet'};{'tj'}];    


for ff = 1:length(mdfnames)
    
    temp_name = char(mdfnames(ff));

    
    trihfile = [project.model_directory, 'delft3d', filesep, 'trih-' temp_name '.dat'];

    fid = qpfopen(trihfile);

    [fieldnames,dims,nval] = qpread(fid);
    
    TIMES = qpread(fid,1,'water level','times');
    STATIONS = qpread(fid,1,'water level','stations');
    locations = qpread(fid,1,'location observation points','stations');
    
    for qq = 1:length(locations)
        
        temp = str2num(locations{qq});
      
        if temp == h
            disp(['found the water level id number in map ', temp_name ,' cell ' num2str(qq) ,' = ' num2str(h) ' and ' num2str(locations{qq}) ,''])
            
            %FIELDSIZE = qpread(fid,1,FIELD,'size') 
            %SUBFIELDS = qpread(fid,1,'water level','subfields')
            
            T = 1:length(TIMES);
            S = qq;
            

            DATA = qpread(fid,1,'water level','data',T,S);
            
            water_level = DATA.Val(length(TIMES));
            
            disp(['water level was ' num2str(water_level) ,' at (',num2str(xori),',',num2str(yori),')'])
               
            %hist_water_level(h) = water_level;
            %hist_x(h) = xori;
            %hist_y(h) = yori;
            
        end
    end
    
end




