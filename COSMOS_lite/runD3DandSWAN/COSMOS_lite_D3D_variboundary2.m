% COSMOS_lite_D3D_variboundary.m - makes 2 files defining boundaries and tide
% components at multiple subsections of the offshore and lateral boundaries
% (extracted from OSU's 
    % created by: D. Anderson, Oregon State University
    
fid=fopen('socal_sd.bnd','wt');

fprintf(fid,'%s\n','North1               Z A     1    46     1    66  0.0000000e+000 north1A      north1B     ');             % North boundary
fprintf(fid,'%s\n','North2               Z A     1    31     1    46  0.0000000e+000 north2A      north2B     ');             % North boundary
fprintf(fid,'%s\n','North3               Z A     1    16     1    31  0.0000000e+000 north3A      north3B     ');             % North boundary
fprintf(fid,'%s\n','North4               Z A     1     2     1    16  0.0000000e+000 north4A      north4B     ');             % North boundary

fprintf(fid,'%s\n','West1                Z A     2     1    26     1  0.0000000e+000 west1A       west1B      ');             % West boundary
fprintf(fid,'%s\n','West2                Z A    26     1    51     1  0.0000000e+000 west2A       west2B      ');             % West boundary
fprintf(fid,'%s\n','West3                Z A    51     1    76     1  0.0000000e+000 west3A       west3B      ');             % West boundary
fprintf(fid,'%s\n','West4                Z A    76     1   101     1  0.0000000e+000 west4A       west4B      ');             % West boundary
fprintf(fid,'%s\n','West5                Z A   101     1   126     1  0.0000000e+000 west5A       west5B      ');             % West boundary
fprintf(fid,'%s\n','West6                Z A   126     1   151     1  0.0000000e+000 west6A       west6B      ');             % West boundary
fprintf(fid,'%s\n','West7                Z A   151     1   176     1  0.0000000e+000 west7A       west7B      ');             % West boundary
fprintf(fid,'%s\n','West8                Z A   176     1   201     1  0.0000000e+000 west8A       west8B      ');             % West boundary
fprintf(fid,'%s\n','West9                Z A   201     1   225     1  0.0000000e+000 west9A       west9B      ');             % West boundary
fprintf(fid,'%s\n','West10               Z A   226     1   251     1  0.0000000e+000 west10A      west10B     ');             % West boundary
fprintf(fid,'%s\n','West11               Z A   251     1   276     1  0.0000000e+000 west11A      west11B     ');             % West boundary
fprintf(fid,'%s\n','West12               Z A   276     1   301     1  0.0000000e+000 west12A      west12B     ');             % West boundary
fprintf(fid,'%s\n','West13               Z A   301     1   325     1  0.0000000e+000 west13A      west13B     ');   
fprintf(fid,'%s\n','West10               Z A   326     1   351     1  0.0000000e+000 west14A      west14B     ');             % West boundary
fprintf(fid,'%s\n','West11               Z A   351     1   376     1  0.0000000e+000 west15A      west15B     ');             % West boundary
fprintf(fid,'%s\n','West12               Z A   376     1   301     1  0.0000000e+000 west16A      west16B     ');             % West boundary
fprintf(fid,'%s\n','West13               Z A   401     1   432     1  0.0000000e+000 west17A      west17B     ');   


fprintf(fid,'%s\n','South1               Z A   433     2   433    16  0.0000000e+000 south1A      south1B     ');             % South boundary
fprintf(fid,'%s\n','South2               Z A   433    16   433    31  0.0000000e+000 south2A      south2B     ');             % South boundary
fprintf(fid,'%s\n','South3               Z A   433    31   433    46  0.0000000e+000 south3A      south3B     '); % South boundary
fprintf(fid,'%s\n','South4               Z A   433    46   433    65  0.0000000e+000 south4A      south4B     '); % South boundary

fclose(fid);    
% fid=fopen('socal_sd.bnd','wt');
% fprintf(fid,'%s\n','North1               Z A     1     2     1    66  0.0000000e+000 north1A      north1B     ');             % North boundary
% fprintf(fid,'%s\n','West1                Z A     2     1   432     1  0.0000000e+000 west1A       west1B      ');             % West boundary
% fprintf(fid,'%s\n','South1               Z A   433     2   433    65  0.0000000e+000 south1A      south1B     ');             % South boundary
% fclose(fid);
   
bounds = {'north1A     ';'north1B     ';'north2A     ';'north2B     ';'north3A     ';'north3B     ';...
    'north4A     ';'north4B     ';...
    'west1A      ';'west1B      ';'west2A      ';'west2B      ';'west3A      ';'west3B      ';...
    'west4A      ';'west4B      ';'west5A      ';'west5B      ';'west6A      ';'west6B      ';...
    'west7A      ';'west7B      ';'west8A      ';'west8B      ';'west9A      ';'west9B      ';...
    'west10A     ';'west10B     ';'west11A     ';'west11B     ';'west12A     ';'west12B     ';...
    'west13A     ';'west13B     ';'west14A     ';'west14B     ';'west15A     ';'west15B     ';...
    'west16A     ';'west16B     ';'west17A     ';'west17B     ';...
    'south1A     ';'south1B     ';'south2A     ';'south2B     ';'south3A     ';'south3B     ';'south4A     ';'south4B     '};

% bounds = {'north1A     ';'north1B     ';'north2A     ';'north2B     ';'north3A     ';'north3B     ';...
%     'west1A      ';'west1B      ';'west2A      ';'west2B      ';'west3A      ';'west3B      ';...
%     'west4A      ';'west4B      ';'west5A      ';'west5B      ';'west6A      ';'west6B      ';...
%     'west7A      ';'west7B      ';'west8A      ';'west8B      ';'west9A      ';'west9B      ';...
%     'south1A     ';'south1B     ';'south2A     ';'south2B     ';'south3A     ';'south3B     '};


load('extracted_coeffs_highres.mat')
fid=fopen('socal_sd.bca','wt');

for hh = 1:length(bounds)
    if hh == 1
        qq = 1;
    elseif hh == 2 || hh == 3
        qq = 2;
    elseif hh == 4 || hh == 5
        qq = 3;        
    elseif hh == 6 || hh == 7
        qq = 4;
    elseif hh == 8 || hh == 9
        qq = 5;
    elseif hh == 10 || hh == 11
        qq = 6;
    elseif hh == 12 || hh == 13
        qq = 7;
    elseif hh == 14 || hh == 15
        qq = 8;
    elseif hh == 16 || hh == 17
        qq = 9;
    elseif hh == 18 || hh == 19
        qq = 10;
    elseif hh == 20 || hh == 21
        qq = 11;
    elseif hh == 22 || hh == 23
        qq = 12;
    elseif hh == 24 || hh == 25
        qq = 13;
    elseif hh == 26 || hh == 27
        qq = 14;
    elseif hh == 28 || hh == 29
        qq = 15;
    elseif hh == 30 || hh == 31
        qq = 16;
    elseif hh == 32 || hh == 33
        qq = 17;
    elseif hh == 34 || hh == 35
        qq = 18;
    elseif hh == 36 || hh == 37
        qq = 19;
    elseif hh == 38 || hh == 39
        qq = 20;
    elseif hh == 40 || hh == 41
        qq = 21;
    elseif hh == 42 || hh == 43
        qq = 22;
    elseif hh == 44 || hh == 45
        qq = 23;     
    elseif hh == 46 || hh == 47
        qq = 24;
    elseif hh == 48 || hh == 49
        qq = 25;
    elseif hh == 50 || hh == 51
        qq = 26;   
    elseif hh == 52
        qq = 27;
    end
% M2
M2mag = amp(1,qq); M2phase = Gph(1,qq);
M2 = sprintf('%0.7e\t',M2mag);
M2 = strrep(M2, 'e-0', 'e-0');
M2p = sprintf('%0.7e\t',M2phase);
M2p = strrep(M2p, 'e+0', 'e+0');

% S2
S2mag = amp(2,qq); S2phase = Gph(2,qq);
S2 = sprintf('%0.7e\t',S2mag);
S2 = strrep(S2, 'e-0', 'e-0');
S2p = sprintf('%0.7e\t',S2phase);
S2p = strrep(S2p, 'e+0', 'e+0');

% N2
N2mag = amp(3,qq); N2phase = Gph(3,qq);
N2 = sprintf('%0.7e\t',N2mag);
N2 = strrep(N2, 'e-0', 'e-0');
N2p = sprintf('%0.7e\t',N2phase);
N2p = strrep(N2p, 'e+0', 'e+0');

% K2
K2mag = amp(4,qq); K2phase = Gph(4,qq);
K2 = sprintf('%0.7e\t',K2mag);
K2 = strrep(K2, 'e-0', 'e-0');
K2p = sprintf('%0.7e\t',K2phase);
K2p = strrep(K2p, 'e+0', 'e+0');

% K1
K1mag = amp(5,qq); K1phase = Gph(5,qq);
K1 = sprintf('%0.7e\t',K1mag);
K1 = strrep(K1, 'e-0', 'e-00');
K1p = sprintf('%0.7e\t',K1phase);
K1p = strrep(K1p, 'e+0', 'e+00');

% O1
O1mag = amp(6,qq); O1phase = Gph(6,qq);
O1 = sprintf('%0.7e\t',O1mag);
O1 = strrep(O1, 'e-0', 'e-0');
O1p = sprintf('%0.7e\t',O1phase);
O1p = strrep(O1p, 'e+0', 'e+0');

% P1
P1mag = amp(7,qq); P1phase = Gph(7,qq);
P1 = sprintf('%0.7e\t',P1mag);
P1 = strrep(P1, 'e-0', 'e-0');
P1p = sprintf('%0.7e\t',P1phase);
P1p = strrep(P1p, 'e+0', 'e+0');

% Q1
Q1mag = amp(8,qq); Q1phase = Gph(8,qq);
Q1 = sprintf('%0.7e\t',Q1mag);
Q1 = strrep(Q1, 'e-0', 'e-0');
Q1p = sprintf('%0.7e\t',Q1phase);
Q1p = strrep(Q1p, 'e+0', 'e+0');


fprintf(fid,'%s\n',['', bounds{hh},'']);             
fprintf(fid,'%s\n',['M2         ' M2(1:13) '   ' M2p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['S2         ' S2(1:13) '   ' S2p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['N2         ' N2(1:13) '   ' N2p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['K2         ' K2(1:13) '   ' K2p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['K1         ' K1(1:13) '   ' K1p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['O1         ' O1(1:13) '   ' O1p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['P1         ' P1(1:13) '   ' P1p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['Q1         ' Q1(1:13) '   ' Q1p(1:13) '']);             % name of the boundary

end

fclose(fid);

display('made tide boundary file')