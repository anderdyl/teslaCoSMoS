% COSMOS_lite_D3D_boundary.m - makes 2 files defining boundaries and tide
% components at each
    % created by: D. Anderson, Oregon State University
    
fid=fopen('socal_sd.bnd','wt');
fprintf(fid,'%s\n','East                 Z T     1     2     1    66  0.0000000e+000');             % North boundary
fprintf(fid,'%s\n','South                Z T   432     1     2     1  0.0000000e+000');             % West boundary
fprintf(fid,'%s\n','West                 Z T   433     2   433    65  0.0000000e+000');             % South boundary
fclose(fid);


A = [5.0594170e-01; %M2
2.0140299e-01; %S2
1.1751628e-01; %N2
5.8325660e-02; %K2
3.3271605e-01; %K1
2.1116130e-01; %O1
1.0370250e-01; %P1
3.8112129e-02]; %Q1

T = [12.4206012; %M2
12.00; %S2
12.65834751; %N2
11.96723606; %K2
23.93447213; %K1
25.81933871; %O1
24.06588766; %P1
26.868350]; %Q1

T_days = T./24;
ttime = [0:1/(24*10):3];%project.num_days];%[datenum(2018,1,1,0,0,0):1/48:datenum(2018,1,28,0,0,0)]-datenum(1899,12,31,12,0,0);

T_minutes = T.*60;
mtime = [0:30:3*24*60];%(project.num_days*24*60)];
% total phase at our sampling time = randomly sampled phase
% phases = 360.*rand(1,8);

% which is the total = (2pi/T)t+phi
% if t = 3 then,
%M2phi = MDA_2(1,14) - ((2*pi)/T_days(1))*day*(180/pi);

day = 3;
M2phi = TESLA_design(casenumber,14) - ((2*pi)/T_days(1))*day*(180/pi);
S2phi = TESLA_design(casenumber,15) - ((2*pi)/T_days(2))*day*(180/pi);
N2phi = TESLA_design(casenumber,16) - ((2*pi)/T_days(3))*day*(180/pi);
K2phi = TESLA_design(casenumber,17) - ((2*pi)/T_days(4))*day*(180/pi);
K1phi = TESLA_design(casenumber,18) - ((2*pi)/T_days(5))*day*(180/pi);
O1phi = TESLA_design(casenumber,19) - ((2*pi)/T_days(6))*day*(180/pi);
P1phi = TESLA_design(casenumber,20) - ((2*pi)/T_days(7))*day*(180/pi);
Q1phi = TESLA_design(casenumber,21) - ((2*pi)/T_days(8))*day*(180/pi);

M2 = A(1).*cos((mtime.*2.*pi/T_minutes(1)) + M2phi*pi/180);
S2 = A(2).*cos((mtime.*2.*pi/T_minutes(2)) + S2phi*pi/180);
N2 = A(3).*cos((mtime.*2.*pi/T_minutes(3)) + N2phi*pi/180);
K2 = A(4).*cos((mtime.*2.*pi/T_minutes(4)) + K2phi*pi/180);
K1 = A(5).*cos((mtime.*2.*pi/T_minutes(5)) + K1phi*pi/180);
O1 = A(6).*cos((mtime.*2.*pi/T_minutes(6)) + O1phi*pi/180);
P1 = A(7).*cos((mtime.*2.*pi/T_minutes(7)) + P1phi*pi/180);
Q1 = A(8).*cos((mtime.*2.*pi/T_minutes(8)) + Q1phi*pi/180);

tsum = sum([M2;S2;N2;K2;K1;O1;P1;Q1])+inputs.wl;



bounds = [{'East'},{'South'},{'West'}];
fid=fopen('socal_sd.bct','wt');

for hh = 1:length(bounds);

fprintf(fid,'%s\n',['table-name          ''Boundary Section : ',num2str(hh),'''']);
fprintf(fid,'%s\n',['contents            ''uniform''']);
fprintf(fid,'%s\n',['location            ''',bounds{hh},'''']);
fprintf(fid,'%s\n',['time-function       ''non-equidistant''']);
fprintf(fid,'%s\n',['reference-time       20180101']);
fprintf(fid,'%s\n',['time-unit           ''minutes''']);
fprintf(fid,'%s\n',['interpolation       ''linear''']);
fprintf(fid,'%s\n',['parameter           ''time'' unit ''[min]''']);
fprintf(fid,'%s\n',['parameter           ''Water elevation (Z)  End A uniform'' unit ''[m]''']);
fprintf(fid,'%s\n',['parameter           ''Water elevation (Z)  End B uniform'' unit ''[m]''']);
fprintf(fid,'%s\n',['records-in-table     ',num2str(length(tsum)),'']);

    for qq = 1:length(tsum)
        fprintf(fid,'%15.2f %13.5e %13.5e\n',[mtime(qq) tsum(qq) tsum(qq)]);
    end
end
    

fclose(fid);


display('made tide boundary file')