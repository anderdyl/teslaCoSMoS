% COSMOS_lite_D3D_ddcoms.m - making the file for D3D domain decomposition 
    % created by: D. Anderson, Oregon State University
    
% create the ddb file defining the grids to be talking to each other

fid=fopen('sd.ddb','wt');

fprintf(fid,'%s\n','diego_bay.grd      79     1    79    94  diego_outer.grd   225    34   225    65');
fprintf(fid,'%s\n','diego_bay.grd     163    94   163   388  impbeach.grd        1     1     1   295');
fprintf(fid,'%s\n','diego_outer.grd   199    34   225    34  diego_bay.grd       1     1    79     1');
fprintf(fid,'%s\n','diego_outer.grd   225    65   253    65  diego_bay.grd      79    94   163    94');
fprintf(fid,'%s\n','diego_outer.grd   253    65   361    65  impbeach.grd        1     1   325     1');
fprintf(fid,'%s\n','diego_outer.grd    43    34    43   100  mssnbay.grd         1     1     1   199');
fprintf(fid,'%s\n','diego_outer.grd    43    34   130    34  mssnbay.grd         1     1   262     1');
fprintf(fid,'%s\n','diego_outer.grd   130    34   199    34  nasni.grd           1     1   208     1');
fprintf(fid,'%s\n','socal_sd.grd      262    33   262    66  diego_outer.grd     1     1     1   100');
fprintf(fid,'%s\n','socal_sd.grd      262    33   391    33  diego_outer.grd     1     1   388     1');
fprintf(fid,'%s\n','diego_outer.grd   388     1   388   100  socal_sd.grd      391    33   391    66');
fprintf(fid,'%s\n','impbeach.grd      325     1   325   106  diego_outer.grd   361    65   361   100');
fprintf(fid,'%s\n','impbeach.grd      102   105   102   196  sdb_hi.grd          1     1     1   274');
fprintf(fid,'%s\n','impbeach.grd      102   105   169   105  sdb_hi.grd          1     1   202     1');
fprintf(fid,'%s\n','impbeach.grd       19   163    19   295  sweet.grd           1     1     1   397');
fprintf(fid,'%s\n','impbeach.grd       19   163    79   163  sweet.grd           1     1   181     1');
fprintf(fid,'%s\n','impbeach.grd      193    61   193   133  tj.grd              1     1     1   217');
fprintf(fid,'%s\n','impbeach.grd      193    61   297    61  tj.grd              1     1   313     1');
fprintf(fid,'%s\n','impbeach.grd      233   133   233   173  tj.grd            121   217   121   337');
fprintf(fid,'%s\n','mssnbay.grd       262     1   262   307  nasni.grd           1     1     1   307');
fprintf(fid,'%s\n','nasni.grd         208     1   208   325  diego_bay.grd       1     1     1   325');
fprintf(fid,'%s\n','sdb_hi.grd        202     1   202   259  impbeach.grd      169   105   169   191');
fprintf(fid,'%s\n','sdb_hi.grd          1   274    82   274  impbeach.grd      102   196   129   196');
fprintf(fid,'%s\n','sdb_hi.grd         82   259    82   274  impbeach.grd      129   191   129   196');
fprintf(fid,'%s\n','sdb_hi.grd         82   259   202   259  impbeach.grd      129   191   169   191');
fprintf(fid,'%s\n','sweet.grd         181     1   181   154  impbeach.grd       79   163    79   214');
fprintf(fid,'%s\n','tj.grd            313     1   313   337  impbeach.grd      297    61   297   173');
fprintf(fid,'%s\n','tj.grd              1   217   121   217  impbeach.grd      193   133   233   133');
fprintf(fid,'%s\n','tj.grd            121   337   313   337  impbeach.grd      233   173   297   173');

fclose(fid);

display('made boundary communication file')