



frq = linspace(0.03,.3,30);

cd('/home/server/pi/homes/danderso/COSMOS_lite/')

deg  = linspace(0,360,36);%[0 30 55 75 90:10:180 195 215 240 270 300 330 360]; %
    jn2a = jonswap2(frq,'Hm0',inputs.wave_height_north,'Tp',inputs.wave_period_north,'pdir',inputs.wave_dir_north,'directions',deg,'ms',6);
    jn(:,:,1) = jn2a;
    
    jn2b = jonswap2(frq,'Hm0',inputs.wave_height_south,'Tp',inputs.wave_period_south,'pdir',inputs.wave_dir_south,'directions',deg,'ms',6);
    jn(:,:,2) = jn2b;
        
    jn2c = jonswap2(frq,'Hm0',inputs.wave_height_local,'Tp',inputs.wave_period_local,'pdir',inputs.wave_dir_local,'directions',deg,'ms',6);
    jn(:,:,3) = jn2c;
 

jn3 = sum(jn,3);

%created = 4*sqrt(trapz(frq,trapz(deg,jn3)));
cd([modeldir, filesep, 'delft3d'])


jn3 = jn3';
% % spec.in
fid = fopen('test_spec.bnd','w');
fprintf(fid,'%s\n','SWAN 1');
fprintf(fid,'%s\n','LONLAT');
fprintf(fid,'\t%d\n',1);
fprintf(fid,'\t%d \t%d\n',[440259 3651993]);
fprintf(fid,'%s\n','AFREQ');
fprintf(fid,'\t%d\n',[length(frq)]);
for hh = 1:length(frq)
    fprintf(fid,'\t%f\n',frq(hh));
end
fprintf(fid,'%s\n','NDIR');
fprintf(fid,'\t%d\n',[length(deg)]);
for hh = 1:length(deg)
    fprintf(fid,'\t%d\n',deg(hh));
end
fprintf(fid,'%s\n','QUANT');
fprintf(fid,'\t%d\n',1);
%fprintf(fid,'%s\n','EnDens');
fprintf(fid,'%s\n','VaDens');

fprintf(fid,'%s\n','m2/Hz/degr');
fprintf(fid,'\t%d\n',0);
fprintf(fid,'%s\n','FACTOR');
fprintf(fid,'\t%d\n',1);
for j = 1:length(frq);
    for i = 1:length(deg);
        fprintf(fid,'%f\t',jn3(j,i));
    end
    fprintf(fid,'\n');
end
fclose(fid);


% % spec.in
fid = fopen('test_spec2.bnd','w');
fprintf(fid,'%s\n','SWAN 1');
fprintf(fid,'%s\n','LONLAT');
fprintf(fid,'\t%d\n',1);
fprintf(fid,'\t%d \t%d\n',[440259 3651993]);
fprintf(fid,'%s\n','AFREQ');
fprintf(fid,'\t%d\n',[length(frq)]);
for hh = 1:length(frq)
    fprintf(fid,'\t%f\n',frq(hh));
end
fprintf(fid,'%s\n','NDIR');
fprintf(fid,'\t%d\n',[length(deg)]);
for hh = 1:length(deg)
    fprintf(fid,'\t%d\n',deg(hh));
end
fprintf(fid,'%s\n','QUANT');
fprintf(fid,'\t%d\n',1);
%fprintf(fid,'%s\n','EnDens');
fprintf(fid,'%s\n','VaDens');

fprintf(fid,'%s\n','m2/Hz/degr');
fprintf(fid,'\t%d\n',0);
fprintf(fid,'%s\n','FACTOR');
fprintf(fid,'\t%d\n',1);
for j = 1:length(frq);
    for i = 1:length(deg);
        fprintf(fid,'%f\t',jn3(j,i));
    end
    fprintf(fid,'\n');
end
fclose(fid);


% % spec.in
fid = fopen('test_spec3.bnd','w');
fprintf(fid,'%s\n','SWAN 1');
fprintf(fid,'%s\n','LONLAT');
fprintf(fid,'\t%d\n',1);
fprintf(fid,'\t%d \t%d\n',[440259 3651993]);
fprintf(fid,'%s\n','AFREQ');
fprintf(fid,'\t%d\n',[length(frq)]);
for hh = 1:length(frq)
    fprintf(fid,'\t%f\n',frq(hh));
end
fprintf(fid,'%s\n','NDIR');
fprintf(fid,'\t%d\n',[length(deg)]);
for hh = 1:length(deg)
    fprintf(fid,'\t%d\n',deg(hh));
end
fprintf(fid,'%s\n','QUANT');
fprintf(fid,'\t%d\n',1);
%fprintf(fid,'%s\n','EnDens');
fprintf(fid,'%s\n','VaDens');

fprintf(fid,'%s\n','m2/Hz/degr');
fprintf(fid,'\t%d\n',0);
fprintf(fid,'%s\n','FACTOR');
fprintf(fid,'\t%d\n',1);
for j = 1:length(frq);
    for i = 1:length(deg);
        fprintf(fid,'%f\t',jn3(j,i));
    end
    fprintf(fid,'\n');
end
fclose(fid);

disp('Made 2d spectra input file by combining 3 jonswaps')


%{
SWANfreq = repmat(frq',1,length(deg));
SWANdirs = repmat(deg,length(frq),1);
%scsz = get( groot, 'Screensize' );
fig2 = figure;
%set(fig2,'position',[scsz(1)+50 scsz(2)+50 scsz(3)-scsz(3)/4 scsz(4)-scsz(4)/4]);
handle2 = contourf(SWANdirs,SWANfreq,jn3,18,'linestyle','none');
%ylim([0.02 0.35])

colormap('jet')
xlabel('Direction (deg from N^{o})','fontsize',12)
ylabel('Frequency (Hz)','fontsize',12)
c = colorbar;
ylabel(c,'Energy (m^{2}/Hz/deg)','fontsize',12)
title('Contour Plot of the Frequency Directional Spectrum for Energy Density')
%}