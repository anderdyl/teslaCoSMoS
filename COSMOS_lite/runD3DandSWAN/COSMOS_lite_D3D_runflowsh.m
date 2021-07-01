% COSMOS_lite_D3D_runflowsh.m - writes the shell script to run D3D

fid=fopen('run_flow2d3d.sh','wt');

fprintf(fid,'%s\n','#!/bin/bash');
fprintf(fid,'%s\n','    #');
fprintf(fid,'%s\n','    # This script is an example for running Delft3D-FLOW');
fprintf(fid,'%s\n','    # Adapt and use it for your own purpose');
fprintf(fid,'%s\n','    #');
fprintf(fid,'%s\n','    # adri.mourits@deltares.nl');
fprintf(fid,'%s\n','    # 27 Dec 2010');
fprintf(fid,'%s\n','    # ');
fprintf(fid,'%s\n','    #');
fprintf(fid,'%s\n','    # This script starts a single-domain Delft3D-FLOW computation on Linux');
fprintf(fid,'%s\n','    #');
fprintf(fid,'%s\n','    #');
fprintf(fid,'%s\n','    # Set the config file here');
fprintf(fid,'%s\n','    # ');
fprintf(fid,'%s\n','argfile=config_d_hydro.xml');
fprintf(fid,'%s\n','mdwfile=socal_sd.mdw');
fprintf(fid,'%s\n','');
fprintf(fid,'%s\n','');
fprintf(fid,'%s\n','');
fprintf(fid,'%s\n','    #');
fprintf(fid,'%s\n','    # Set the directory containing delftflow.exe here');
fprintf(fid,'%s\n','    #');
fprintf(fid,'%s\n','export ARCH=lnx64');
fprintf(fid,'%s\n','export D3D_HOME=/usr/local/src/delft3d/bin');
fprintf(fid,'%s\n','flowexedir=$D3D_HOME/$ARCH/flow2d3d/bin');
fprintf(fid,'%s\n','waveexedir=$D3D_HOME/$ARCH/wave/bin');
fprintf(fid,'%s\n','swanexedir=$D3D_HOME/$ARCH/swan/bin');
fprintf(fid,'%s\n','swanbatdir=$D3D_HOME/$ARCH/swan/scripts');

fprintf(fid,'%s\n',' ');
fprintf(fid,'%s\n','    #');
fprintf(fid,'%s\n','    # No adaptions needed below');
fprintf(fid,'%s\n','    #');
fprintf(fid,'%s\n','');
fprintf(fid,'%s\n','    # Set some (environment) parameters');
fprintf(fid,'%s\n','');
fprintf(fid,'%s\n','    # Run');
fprintf(fid,'%s\n','export LD_LIBRARY_PATH=$flowexedir:$LD_LIBRARY_PATH ');
fprintf(fid,'%s\n','$flowexedir/d_hydro.exe $argfile &');
fprintf(fid,'%s\n','');
fprintf(fid,'%s\n','export LD_LIBRARY_PATH=$swanbatdir:$swanexedir:$waveexedir:$LD_LIBRARY_PATH ');
fprintf(fid,'%s\n','export PATH=$swanbatdir:$PATH');
fprintf(fid,'%s\n','$waveexedir/wave.exe $mdwfile 1');


fclose(fid);

display('made D3D shell script')
