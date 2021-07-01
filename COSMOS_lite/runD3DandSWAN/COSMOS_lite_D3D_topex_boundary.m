% COSMOS_lite_D3D_boundary.m - makes 2 files defining boundaries and tide
% components at each
    % created by: D. Anderson, Oregon State University
    
fid=fopen('socal_sd.bnd','wt');
fprintf(fid,'%s\n','(1,2)..(1,53)        Z A     1     2     1    66  0.0000000e+000 northa       northa      ');             % North boundary
fprintf(fid,'%s\n','(432,1)..(2,1)       Z A   432     1     2     1  0.0000000e+000 northa       northa      ');             % West boundary
fprintf(fid,'%s\n','(433,2)..(433,53)    Z A   433     2   433    65  0.0000000e+000 northa       northa      ');             % South boundary
fclose(fid);

load('extracted_coeffs.mat')
qq = 8;
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
K1 = strrep(K1, 'e-0', 'e-0');
K1p = sprintf('%0.7e\t',K1phase);
K1p = strrep(K1p, 'e+0', 'e+0');

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

%{
% M2
M2mag = 0.556; M2phase = 143.2;
M2 = sprintf('%0.7e\t',M2mag);
M2 = strrep(M2, 'e-0', 'e-00');
M2p = sprintf('%0.7e\t',M2phase);
M2p = strrep(M2p, 'e+0', 'e+00');

% S2
S2mag = 0.229; S2phase = 140.2;
S2 = sprintf('%0.7e\t',S2mag);
S2 = strrep(S2, 'e-0', 'e-00');
S2p = sprintf('%0.7e\t',S2phase);
S2p = strrep(S2p, 'e+0', 'e+00');

% N2
N2mag = 0.130; N2phase = 123.8;
N2 = sprintf('%0.7e\t',N2mag);
N2 = strrep(N2, 'e-0', 'e-00');
N2p = sprintf('%0.7e\t',N2phase);
N2p = strrep(N2p, 'e+0', 'e+00');

% K1
K1mag = 0.347; K1phase = 208.0;
K1 = sprintf('%0.7e\t',K1mag);
K1 = strrep(K1, 'e-0', 'e-00');
K1p = sprintf('%0.7e\t',K1phase);
K1p = strrep(K1p, 'e+0', 'e+00');

% O1
O1mag = 0.220; O1phase = 192.4;
O1 = sprintf('%0.7e\t',O1mag);
O1 = strrep(O1, 'e-0', 'e-00');
O1p = sprintf('%0.7e\t',O1phase);
O1p = strrep(O1p, 'e+0', 'e+00');

% P1
P1mag = 0.109; P1phase = 290.7;
P1 = sprintf('%0.7e\t',P1mag);
P1 = strrep(P1, 'e-0', 'e-00');
P1p = sprintf('%0.7e\t',P1phase);
P1p = strrep(P1p, 'e+0', 'e+00');

% K2
K2mag = 0.067; K2phase = 144.2;
K2 = sprintf('%0.7e\t',K2mag);
K2 = strrep(K2, 'e-0', 'e-00');
K2p = sprintf('%0.7e\t',K2phase);
K2p = strrep(K2p, 'e+0', 'e+00');

% Q1
Q1mag = 0.041; Q1phase = 239.7;
Q1 = sprintf('%0.7e\t',Q1mag);
Q1 = strrep(Q1, 'e-0', 'e-00');
Q1p = sprintf('%0.7e\t',Q1phase);
Q1p = strrep(Q1p, 'e+0', 'e+00');

% NU2
NU2mag = 0.025; NU2phase = 128.8;
NU2 = sprintf('%0.7e\t',NU2mag);
NU2 = strrep(NU2, 'e-0', 'e-00');
NU2p = sprintf('%0.7e\t',NU2phase);
NU2p = strrep(NU2p, 'e+0', 'e+00');
%}

fid=fopen('socal_sd.bca','wt');
fprintf(fid,'%s\n','northa');             % name of the boundary
% fprintf(fid,'%s\n',['M2        ' M2(1:14) '  ' M2p(1:14) '']);             % M2 
% fprintf(fid,'%s\n',['S2        ' S2(1:14) '  ' S2p(1:14) '']);             % S2
% fprintf(fid,'%s\n',['N2        ' N2(1:14) '  ' N2p(1:14) '']);             % N2
% fprintf(fid,'%s\n',['K1        ' K1(1:14) '  ' K1p(1:14) '']);             % K1
% fprintf(fid,'%s\n',['O1        ' O1(1:14) '  ' O1p(1:14) '']);             % O1
% fprintf(fid,'%s\n',['P1        ' P1(1:14) '  ' P1p(1:14) '']);             % P1
% fprintf(fid,'%s\n',['K2        ' K2(1:14) '  ' K2p(1:14) '']);             % K2
% fprintf(fid,'%s\n',['NU2       ' NU2(1:14) '  ' NU2p(1:14) '']);             % NU2
fprintf(fid,'%s\n',['M2         ' M2(1:13) '   ' M2p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['S2         ' S2(1:13) '   ' S2p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['N2         ' N2(1:13) '   ' N2p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['K2         ' K2(1:13) '   ' K2p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['K1         ' K1(1:13) '   ' K1p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['O1         ' O1(1:13) '   ' O1p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['P1         ' P1(1:13) '   ' P1p(1:13) '']);             % name of the boundary
fprintf(fid,'%s\n',['Q1         ' Q1(1:13) '   ' Q1p(1:13) '']);             % name of the boundary
fclose(fid);

display('made tide boundary file')