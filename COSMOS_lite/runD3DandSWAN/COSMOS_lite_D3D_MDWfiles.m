%% NEED TO MAKE THE SWAN MDW FILE


%%%% CLEAN .grd, .enc, and .dep files should already have been copied to a
%%%% new directory by COSMOS_lite_D3D_MDFfiles.m ....

model.name = 'socal_sd';
model.grd1 = 'socal_sd_swan1.grd';
model.enc1 = 'socal_sd_swan1.enc';
model.dep1 = 'socal_sd_swan1.dep';
model.grd2 = 'socal_sd_swan2.grd';
model.enc2 = 'socal_sd_swan2.enc';
model.dep2 = 'socal_sd_swan2.dep';
model.loc = 'socal_sd.loc';
ref_year = project.ref_year; 
ref_month = project.ref_month; 
ref_day = project.ref_day;
model.itdate=D3DTimeString(datenum(ref_year,ref_month,ref_day),'itdatemdf');
wndspd = inputs.wndspd;
wnddir = inputs.wnddir;
wtrlvl = 0; 
gravity = 9.81;
wtrden = 1025;
north = 90;
mindepth = 0.1;
breakalpha = 1;
breakgamma = 0.73;
mapwriteint = 30;
comwriteint = 30;

% JONSWAP definition
%peakenhance = 3.3;
%gaussspread = .001;
%waveheight = inputs.waveheight;
%waveperiod = inputs.waveperiod;
%direction = inputs.wavedirection;
%dirspread = 4;
% Peak Enhance
%pkenh = sprintf('%0.7e\t',peakenhance);
%pkenh = strrep(pkenh, 'e+0', 'e+00');
% gauss spreading
%gspread = sprintf('%0.7e\t',gaussspread);
%gspread = strrep(gspread, 'e-0', 'e-00');
% wave height
%waveH = sprintf('%0.7e\t',waveheight);
%waveH = strrep(waveH, 'e+0', 'e+00');
% period
%period = sprintf('%0.7e\t',waveperiod);
%period = strrep(period, 'e+0', 'e+00');
% direction
%dirs = sprintf('%0.7e\t',direction);
%dirs = strrep(dirs, 'e+0', 'e+00');
% direction spreading
%dirspred = sprintf('%0.7e\t',dirspread);
%dirspred = strrep(dirspred, 'e+0', 'e+00');

% Wind Speed
windspeed = sprintf('%0.7e\t',wndspd);
windspeed = strrep(windspeed, 'e+0', 'e+00');
% Wind Direction
winddir = sprintf('%0.7e\t',wnddir);
winddir = strrep(winddir, 'e+0', 'e+00');
% Water Level Correction
wtrlvl = sprintf('%0.7e\t',wtrlvl);
wtrlvl = strrep(wtrlvl, 'e+0', 'e+00');
% Gravity
gravty = sprintf('%0.7e\t',gravity);
gravty = strrep(gravty, 'e+0', 'e+00');
% Water Density
rho = sprintf('%0.7e\t',wtrden);
rho = strrep(rho, 'e+0', 'e+00');
% North Direction
nordir = sprintf('%0.7e\t',north);
nordir = strrep(nordir, 'e+0', 'e+00');
% minimum depth
mindep = sprintf('%0.7e\t',mindepth);
mindep = strrep(mindep, 'e-0', 'e-00');
% breaking alpha
balpha = sprintf('%0.7e\t',breakalpha);
balpha = strrep(balpha, 'e+0', 'e+00');
% breaking gamma
bgamma = sprintf('%0.7e\t',breakgamma);
bgamma = strrep(bgamma, 'e-0', 'e-00');
% map write interval
mwrtint = sprintf('%0.7e\t',mapwriteint);
mwrtint = strrep(mwrtint, 'e+0', 'e+00');
% com write interval
cwrtint = sprintf('%0.7e\t',comwriteint);
cwrtint = strrep(cwrtint, 'e+0', 'e+00');


%
fid=fopen([model.name '.mdw'],'wt');

fprintf(fid,'%s\n','[WaveFileInformation]');       
fprintf(fid,'%s\n','   FileVersion          = 02.00');       
fprintf(fid,'%s\n','[General]'); 
fprintf(fid,'%s\n','   ProjectName          = cosmos socal');       
fprintf(fid,'%s\n','   Description          = tierII san diego');       
fprintf(fid,'%s\n','   FlowFile             = socal_sd.mdf');       
fprintf(fid,'%s\n','   OnlyInputVerify      = false');       
fprintf(fid,'%s\n','   SimMode              = stationary');       
fprintf(fid,'%s\n','   DirConvention        = nautical');       
fprintf(fid,'%s\n',['   ReferenceDate        = ' model.itdate '']);       
fprintf(fid,'%s\n',['   WindSpeed            =  ' windspeed(1:14) '']);       
fprintf(fid,'%s\n',['   WindDir              =  ' winddir(1:14) '']);       

fprintf(fid,'%s\n','[Constants]');    
fprintf(fid,'%s\n',['   WaterLevelCorrection =  ' wtrlvl(1:14) '']');       
fprintf(fid,'%s\n',['   Gravity              =  ' gravty(1:14) '']');       
fprintf(fid,'%s\n',['   WaterDensity         =  ' rho(1:14) '']');       
fprintf(fid,'%s\n',['   NorthDir             =  ' nordir(1:14) '']');       
fprintf(fid,'%s\n',['   MinimumDepth         =  ' mindep(1:14) '']');       

fprintf(fid,'%s\n','[Processes]');             
fprintf(fid,'%s\n','   GenModePhys          = 3');       
fprintf(fid,'%s\n','   Breaking             = true');       
fprintf(fid,'%s\n',['   BreakAlpha           =  ' balpha(1:14) '']');       
fprintf(fid,'%s\n',['   BreakGamma           =  ' bgamma(1:14) '']');       
fprintf(fid,'%s\n','   Triads               = false');       
fprintf(fid,'%s\n','   TriadsAlpha          =  1.0000000e-001');       
fprintf(fid,'%s\n','   TriadsBeta           =  2.2000000e+000');       
fprintf(fid,'%s\n','   BedFriction          = jonswap');       
fprintf(fid,'%s\n','   BedFricCoef          =  6.7000002e-002');       
fprintf(fid,'%s\n','   Diffraction          = false');       
fprintf(fid,'%s\n','   DiffracCoef          =  2.0000000e-001');       
fprintf(fid,'%s\n','   DiffracSteps         = 5');       
fprintf(fid,'%s\n','   DiffracProp          = true');       
fprintf(fid,'%s\n','   WindGrowth           = true');       
fprintf(fid,'%s\n','   WhiteCapping         = Komen');       
fprintf(fid,'%s\n','   Quadruplets          = true');       
fprintf(fid,'%s\n','   Refraction           = true');       
fprintf(fid,'%s\n','   FreqShift            = true');       
fprintf(fid,'%s\n','   WaveForces           = dissipation 3d');       

fprintf(fid,'%s\n','[Numerics]');   
fprintf(fid,'%s\n','   DirSpaceCDD          =  5.0000000e-001');       
fprintf(fid,'%s\n','   FreqSpaceCSS         =  5.0000000e-001');       
fprintf(fid,'%s\n','   RChHsTm01            =  2.0000000e-002');       
fprintf(fid,'%s\n','   RChMeanHs            =  2.0000000e-002');       
fprintf(fid,'%s\n','   RChMeanTm01          =  2.0000000e-002');       
fprintf(fid,'%s\n','   PercWet              =  9.8000000e+001');       
fprintf(fid,'%s\n','   MaxIter              = 15');       

fprintf(fid,'%s\n','[Output]');             
fprintf(fid,'%s\n','   TestOutputLevel      = 0');       
fprintf(fid,'%s\n','   TraceCalls           = false');       
fprintf(fid,'%s\n','   UseHotFile           = false');       
fprintf(fid,'%s\n',['   MapWriteInterval     =  ' mwrtint '']);       
fprintf(fid,'%s\n','   WriteCOM             = true');       
fprintf(fid,'%s\n',['   COMWriteInterval     =  ' cwrtint '']);       
fprintf(fid,'%s\n',['   LocationFile         = ' model.loc '']);                         % Line 3 Grid input file
fprintf(fid,'%s\n','   WriteTable           = true');       
fprintf(fid,'%s\n','   WriteSpec1D          = false');       
fprintf(fid,'%s\n','   WriteSpec2D          = true');       

fprintf(fid,'%s\n','[Domain]');             
fprintf(fid,'%s\n',['   Grid                 = ' model.grd1 '']);                         % Line 3 Grid input file
fprintf(fid,'%s\n','   FlowBedLevel         = 0');       
fprintf(fid,'%s\n','   FlowWaterLevel       = 1');       
fprintf(fid,'%s\n','   FlowVelocity         = 1');       
fprintf(fid,'%s\n','   FlowWind             = 1');       
fprintf(fid,'%s\n',['   BedLevel             = ' model.dep1 '']);                         % Line 3 Grid input file
fprintf(fid,'%s\n','   DirSpace             = circle');       
fprintf(fid,'%s\n','   NDir                 = 36');       
fprintf(fid,'%s\n','   StartDir             =  0.0000000e+000');       
fprintf(fid,'%s\n','   EndDir               =  0.0000000e+000');       
fprintf(fid,'%s\n','   FreqMin              =  4.1299999e-002');       
fprintf(fid,'%s\n','   FreqMax              =  1.0000000e+000');       
fprintf(fid,'%s\n','   NFreq                = 24');       
fprintf(fid,'%s\n','   Output               = true');       

fprintf(fid,'%s\n','[Domain]');    
fprintf(fid,'%s\n',['   Grid                 = ' model.grd2 '']);                         % Line 3 Grid input file
fprintf(fid,'%s\n','   FlowBedLevel         = 0');       
fprintf(fid,'%s\n','   FlowWaterLevel       = 1');       
fprintf(fid,'%s\n','   FlowVelocity         = 1');       
fprintf(fid,'%s\n','   FlowWind             = 1');       
fprintf(fid,'%s\n',['   BedLevel             = ' model.dep2 '']);                         % Line 3 Grid input file
fprintf(fid,'%s\n','   DirSpace             = circle');       
fprintf(fid,'%s\n','   NDir                 = 36');       
fprintf(fid,'%s\n','   StartDir             =  0.0000000e+000');       
fprintf(fid,'%s\n','   EndDir               =  0.0000000e+000');       
fprintf(fid,'%s\n','   FreqMin              =  4.1299999e-002');       
fprintf(fid,'%s\n','   FreqMax              =  1.0000000e+000');       
fprintf(fid,'%s\n','   NFreq                = 24'); 
fprintf(fid,'%s\n','   NestedInDomain       = 1');       
fprintf(fid,'%s\n','   Output               = true');       

fprintf(fid,'%s\n','[Boundary]');             
fprintf(fid,'%s\n','   Name                 = Boundary West');    
fprintf(fid,'%s\n','   Definition           = orientation');   
fprintf(fid,'%s\n','   Orientation          = west');       
fprintf(fid,'%s\n','   SpectrumSpec         = from file');       
%fprintf(fid,'%s\n','   Cond        = from file');       
fprintf(fid,'%s\n','   Spectrum             = test_spec.bnd');     

fprintf(fid,'%s\n','[Boundary]');             
fprintf(fid,'%s\n','   Name                 = Boundary North');    
fprintf(fid,'%s\n','   Definition           = orientation');   
fprintf(fid,'%s\n','   Orientation          = north');       
fprintf(fid,'%s\n','   SpectrumSpec         = from file');       
%fprintf(fid,'%s\n','   Cond        = from file');       
fprintf(fid,'%s\n','   Spectrum             = test_spec2.bnd');     


fprintf(fid,'%s\n','[Boundary]');             
fprintf(fid,'%s\n','   Name                 = Boundary South');    
fprintf(fid,'%s\n','   Definition           = orientation');   
fprintf(fid,'%s\n','   Orientation          = south');       
fprintf(fid,'%s\n','   SpectrumSpec         = from file');       
%fprintf(fid,'%s\n','   Cond        = from file');       
fprintf(fid,'%s\n','   Spectrum             = test_spec3.bnd'); 




%fprintf(fid,'%s\n','   Name                 = Boundary West');       
%fprintf(fid,'%s\n','   Definition           = orientation');       
%fprintf(fid,'%s\n','   Orientation          = west');       
%fprintf(fid,'%s\n','   SpectrumSpec         = from file');       
%fprintf(fid,'%s\n','   Spectrum             = test_spec.bnd');       

%fprintf(fid,'%s\n','   SpectrumSpec         = parametric');       
%fprintf(fid,'%s\n','   SpShapeType          = jonswap');       
%fprintf(fid,'%s\n','   PeriodType           = peak');       
%fprintf(fid,'%s\n','   DirSpreadType        = power');       
%fprintf(fid,'%s\n',['   PeakEnhanceFac       =  ' pkenh(1:14) '']');       
%fprintf(fid,'%s\n',['   GaussSpread          =  ' gspread(1:14) '']');       
%fprintf(fid,'%s\n',['   WaveHeight           =  ' waveH(1:14) '']');       
%fprintf(fid,'%s\n',['   Period               =  ' period(1:14) '']');       
%fprintf(fid,'%s\n',['   Direction            =  ' dirs(1:14) '']');       
%fprintf(fid,'%s\n',['   DirSpreading         =  ' dirspred(1:14) '']');       


fclose(fid);

display('made wave file')