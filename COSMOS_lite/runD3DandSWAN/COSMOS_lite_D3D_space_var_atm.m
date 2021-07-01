
wndnames = [{'socal_sd'};{'diego_outer'};{'diego_bay'};{'impbeach'};...
    {'mssnbay'};{'nasni'};{'sdb_hi'};{'sweet'};{'tj'}];

atm = inputs.ap;
reftime = datenum(project.ref_year,project.ref_month,project.ref_day);

for h = 1:length(wndnames)
    
% X WIND FILE
fname = char(wndnames(h));
ncols = 2;
nrows = 2;
vsn='1.03';
gridunit = 'm';
xll = 405500;
yll = 3540900;
dx = 100000;
dy = 120000;
quantity='air_pressure';
unit='Pa';
ext='amp';
fmt='%7.0f';

val = [atm atm; atm atm];

fid=fopen([fname '.' ext],'wt');
fprintf(fid,'%s\n','### START OF HEADER');
fprintf(fid,'%s\n','### All text on a line behind the first # is parsed as commentary');
fprintf(fid,'%s\n','### Additional commments');
fprintf(fid,'%s\n',['FileVersion      =    ' vsn '                                               # Version of meteo input file, to check if the newest file format is used']);
fprintf(fid,'%s\n','filetype         =    meteo_on_equidistant_grid                          # Type of meteo input file: meteo_on_flow_grid, meteo_on_equidistant_grid, meteo_on_curvilinear_grid or meteo_on_spiderweb_grid');
fprintf(fid,'%s\n','NODATA_value     =    -999                                               # Value used for undefined or missing data');
fprintf(fid,'%s\n',['n_cols           =    ' num2str(ncols) '                                                # Number of columns used for wind datafield']);
fprintf(fid,'%s\n',['n_rows           =    ' num2str(nrows) '                                                # Number of rows used for wind datafield']);
fprintf(fid,'%s\n',['grid_unit        =    ' gridunit]);
fprintf(fid,'%s\n',['x_llcorner       =   ' num2str(xll)]);
fprintf(fid,'%s\n',['y_llcorner       =   ' num2str(yll)]);
fprintf(fid,'%s\n',['dx               =   ' num2str(dx)]);
fprintf(fid,'%s\n',['dy               =   ' num2str(dy)]);
fprintf(fid,'%s\n','n_quantity       =    1                                                  # Number of quantities prescribed in the file');
fprintf(fid,'%s\n',['quantity1        =    ' quantity '                                             # Name of quantity1']);
fprintf(fid,'%s\n',['unit1            =    ' unit '                                              # Unit of quantity1']);
fprintf(fid,'%s\n','### END OF HEADER');

fmt=[repmat(fmt,1,ncols) '\n'];
fmt=repmat(fmt,1,nrows);

tim = 0;
fprintf(fid,'%s\n',['TIME             =   ' num2str(tim,'%10.2f') '   minutes since ' datestr(reftime,'yyyy-mm-dd HH:MM:SS') ' +00:00']);
fprintf(fid,fmt,val);
for qq = 1:project.num_days+2
  dt = 1440*qq;
fprintf(fid,'%s\n',['TIME             =   ' num2str(dt,'%10.2f') '   minutes since ' datestr(reftime,'yyyy-mm-dd HH:MM:SS') ' +00:00']);
fprintf(fid,fmt,val);
end
fclose(fid);
end
disp('Made atmospheric pressure files for each domain')

