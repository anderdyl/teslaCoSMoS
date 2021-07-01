% COSMOS_lite_D3D_MDFfiles.m - makes MDF for each domain in D3D
    % created by: D. Anderson, Oregon State University
    
    
mdfnames = [{'socal_sd'};{'diego_outer'};{'diego_bay'};{'impbeach'};...
    {'mssnbay'};{'nasni'};{'sdb_hi'};{'sweet'};{'tj'}];

for h = 1:length(mdfnames)
    
    model.name = char(mdfnames(h));
    
    model.grd1 = ['' char(mdfnames(h)) '.grd'];
    model.enc1 = ['' char(mdfnames(h)) '.enc'];
    model.dep1 = ['' char(mdfnames(h)) '.dep'];
    
    model.bnd = ['' char(mdfnames(h)) '.bnd'];
    model.bct = ['' char(mdfnames(h)) '.bct'];
    model.sta = ['' char(mdfnames(h)) '.obs'];
    
    % Reference time
    model.ref_year = project.ref_year;
    model.ref_month = project.ref_month;
    model.ref_day = project.ref_day;
    
    model.itdate=D3DTimeString(datenum(model.ref_year,model.ref_month,model.ref_day),'itdatemdf');
    
    % Start time
    model.start_year = project.start_year;
    model.start_month = project.start_month;
    model.start_day = project.start_day;
    model.start_hour = project.start_hour;
    
    model.tlength_days = project.num_days;
    model.tlength_hours = model.tlength_days*24; % #days*hours/day
    model.tlength_mins = model.tlength_hours*60;
    model.timeStep = inputs.timeStep;
    
    model.store_time_start = (datenum(model.start_year,model.start_month,model.start_day,model.start_hour,0,0)-datenum(model.ref_year,model.ref_month,model.ref_day))*1440;
    model.store_time_end = (datenum(model.start_year,model.start_month,model.start_day+model.tlength_days,model.start_hour,0,0)-datenum(model.ref_year,model.ref_month,model.ref_day))*1440;
    model.store_time_interval = inputs.store_time_interval;
    
    model.comm_time_start = (datenum(model.start_year,model.start_month,model.start_day,model.start_hour,0,0)-datenum(model.ref_year,model.ref_month,model.ref_day))*1440;
    model.comm_time_end = (datenum(model.start_year,model.start_month,model.start_day+model.tlength_days,model.start_hour,0,0)-datenum(model.ref_year,model.ref_month,model.ref_day))*1440;
    model.comm_time_interval = inputs.wave_comm_interval;
    
    model.print_time_start = (datenum(model.start_year,model.start_month,model.start_day,model.start_hour,0,0)-datenum(model.ref_year,model.ref_month,model.ref_day))*1440;
    model.print_time_end = (datenum(model.start_year,model.start_month,model.start_day+model.tlength_days,model.start_hour,0,0)-datenum(model.ref_year,model.ref_month,model.ref_day))*1440;
    model.print_time_interval = inputs.print_interval;
    
    model.flrst = 0;
   
    
    % Formatting constants
    % Model start time
    model.tstart = sprintf('%0.7e\t',(datenum(model.start_year,model.start_month,model.start_day,model.start_hour,0,0)-datenum(model.ref_year,model.ref_month,model.ref_day))*1440);
    model.tstart = strrep(model.tstart, 'e+0', 'e+00');
    % model stop time
    model.tstop = sprintf('%0.7e\t',(datenum(model.start_year,model.start_month,model.start_day+model.tlength_days,model.start_hour,0,0)-datenum(model.ref_year,model.ref_month,model.ref_day))*1440);
    model.tstop = strrep(model.tstop, 'e+0', 'e+00');
    model.dt=num2str(model.timeStep);
    % initial water level
    model.zeta0 = sprintf('%0.7e\t',inputs.start_wl);
    model.zeta0 = strrep(model.zeta0, 'e+0', 'e+00');
    % gravity
    model.grav = sprintf('%0.7e\t',9.81);
    model.grav = strrep(model.grav, 'e+0', 'e+00');
    % water density
    model.dens = sprintf('%0.7e\t',1029);
    model.dens = strrep(model.dens, 'e+0', 'e+00');
    % water temperature
    model.wtemp = sprintf('%0.7e\t',15);
    model.wtemp = strrep(model.wtemp, 'e+0', 'e+00');
    % salinity
    model.salin = sprintf('%0.7e\t',31);
    model.salin = strrep(model.salin, 'e+0', 'e+00');
    % % wind stress
    % wstr = sprintf('%e\t',[0 0 0 0 0 0]);
    % wstr = strrep(wstr, 'e+0', 'e+00');
    % air density
    model.aden = sprintf('%0.7e\t',1);
    model.aden = strrep(model.aden, 'e+0', 'e+00');
    % Parameter spiral motion?
    model.betac = sprintf('%0.7e\t',0.5);
    model.betac = strrep(model.betac, 'e-0', 'e-00');
    % uniform bottom roughness in u
    model.ccofu = sprintf('%0.7e\t',65);
    model.ccofu = strrep(model.ccofu, 'e+0', 'e+00');
    % uniform bottom roughness in v
    model.ccofv = sprintf('%0.7e\t',65);
    model.ccofv = strrep(model.ccofv, 'e+0', 'e+00');
    % ozmidov length scale
    model.ozmi = sprintf('%0.7e\t',0);
    model.ozmi = strrep(model.ozmi, 'e+0', 'e+00');
    % uniform horizontal eddy viscosity
    model.vicouv = sprintf('%0.7e\t',1);
    model.vicouv = strrep(model.vicouv, 'e+0', 'e+00');
    % uniform horizontal eddy diffusivity
    model.dicouv = sprintf('%0.7e\t',10);
    model.dicouv = strrep(model.dicouv, 'e+0', 'e+00');
    % depth threshold for considering dry/wet
    model.dryflc = sprintf('%0.7e\t',.1);
    model.dryflc = strrep(model.dryflc, 'e-0', 'e-00');
    % marginal depth in shallow areas
    model.dco = sprintf('%0.7e\t',-999.0);
    model.dco = strrep(model.dco, 'e+0', 'e+00');
    % time interval to smooth the hydrodynamic boundary conditions
    model.tlfsmo = sprintf('%0.7e\t',60);
    model.tlfsmo = strrep(model.tlfsmo, 'e+0', 'e+00');
    % relaxation parameter for qh relation (0 = no relaxation)
    model.thetqh = sprintf('%0.7e\t',0);
    model.thetqh = strrep(model.thetqh, 'e+0', 'e+00');
    
    %%%%%%%%%%% OUTPUTS %%%%%%%%%%%%%%%%%
    % time to start storing
    model.ststart = sprintf('%0.7e\t',model.store_time_start);
    model.ststart = strrep(model.ststart, 'e+0', 'e+00');
    % time to end storing
    model.stend = sprintf('%0.7e\t',model.store_time_end);
    model.stend = strrep(model.stend, 'e+0', 'e+00');
    model.stinterval = num2str(model.store_time_interval);
    
    model.flmap = ['',model.ststart(1:14),' ',model.stinterval,'  ',model.stend(1:14),''];
%    model.flmap = ['',model.stend(1:14),' ',num2str(0),'  ',model.stend(1:14),''];
    
    model.hisinterval = num2str(model.store_time_interval);
    
    model.flhis = ['',model.ststart(1:14),' ',model.hisinterval,'  ',model.stend(1:14),''];
    % time to start communicating
    model.comstart = sprintf('%0.7e\t',model.comm_time_start);
    model.comstart = strrep(model.comstart, 'e+0', 'e+00');
    % time to end communicating
    model.comend = sprintf('%0.7e\t',model.comm_time_end);
    model.comend = strrep(model.comend, 'e+0', 'e+00');
    model.cominterval = num2str(model.comm_time_interval);
    model.flpp = ['',model.comstart(1:14),' ',model.cominterval,'  ',model.comend(1:14),''];
    
    % time to start printing
    model.prtstart = sprintf('%0.7e\t',model.print_time_start);
    model.prtstart = strrep(model.prtstart, 'e+0', 'e+00');
    % time to end printing
    model.prtend = sprintf('%0.7e\t',model.print_time_end);
    model.prtend = strrep(model.prtend, 'e+0', 'e+00');
    model.prtinterval = num2str(model.print_time_interval);
    model.prhis = ['',model.prtstart(1:14),' ',model.prtinterval,'  ',model.prtend(1:14),''];    
    
    make_dd_MDFfile([modeldir, filesep, 'delft3d',filesep],model,h);
    
      display(['made flow file for ', char(mdfnames(h)), ' domain']);

    
    
end
