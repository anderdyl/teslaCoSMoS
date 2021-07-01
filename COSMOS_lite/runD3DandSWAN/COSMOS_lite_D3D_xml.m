% COSMOS_lite_D3D_xml.m - creates the config file needed to run D3D hydro
% in the new model directory specified in the project mat file

fid=fopen('config_d_hydro.xml','wt');


fprintf(fid,'%s\n','<?xml version="1.0" encoding="iso-8859-1"?>');
fprintf(fid,'%s\n','<deltaresHydro xmlns="http://schemas.deltares.nl/deltaresHydro" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://schemas.deltares.nl/deltaresHydro http://content.oss.deltares.nl/schemas/d_hydro-1.00.xsd">');
fprintf(fid,'%s\n','    <documentation>');
fprintf(fid,'%s\n','        File created by    : Deltares, create_config_xml.tcl, Version 1.00');
fprintf(fid,'%s\n','        File creation date : 06 March 2013, 18:09:37');
fprintf(fid,'%s\n','        File version       : 1.00');
fprintf(fid,'%s\n','    </documentation>');
fprintf(fid,'%s\n','    <control>');
fprintf(fid,'%s\n','        <sequence>');
fprintf(fid,'%s\n','            <start>myNameFlow</start>');
fprintf(fid,'%s\n','        </sequence>');
fprintf(fid,'%s\n','    </control>');
fprintf(fid,'%s\n','    <flow2D3D name="myNameFlow">');
fprintf(fid,'%s\n','        <!--library>flow2d3d</library -->');
fprintf(fid,'%s\n','        <library>flow2d3d</library>');
fprintf(fid,'%s\n','        <ddbFile>sd.ddb</ddbFile>');
fprintf(fid,'%s\n','        <!--');
fprintf(fid,'%s\n','            Note: exactly one mdfFile (single domain) or ddbFile (domain decomposition)');
fprintf(fid,'%s\n','            element must be present.');
fprintf(fid,'%s\n','        -->');
fprintf(fid,'%s\n','        <!--');
fprintf(fid,'%s\n','            Options/alternatives:');
fprintf(fid,'%s\n','            1) DomainDecomposition: replace <mdfFile>f34.mdf</mdfFile> with:');
fprintf(fid,'%s\n','                <ddbFile>vlissingen.ddb</ddbFile>');
fprintf(fid,'%s\n','            2) Specification of dll/so to use:');
fprintf(fid,'%s\n','                <library>/opt/delft3d/lnx64/flow2d3d/bin/libflow2d3d.so</library>');
fprintf(fid,'%s\n','            3) Single precision:');
fprintf(fid,'%s\n','                <library>flow2d3d_sp</library>');
fprintf(fid,'%s\n','            4) Documentation:');
fprintf(fid,'%s\n','                <documentation>');
fprintf(fid,'%s\n','                    Basic tutorial testcase.');
fprintf(fid,'%s\n','                </documentation>');
fprintf(fid,'%s\n','            5) More output to screen (silent, error, info, trace. default: error):');
fprintf(fid,'%s\n','                <verbosity>trace</verbosity>');
fprintf(fid,'%s\n','            6) Debugging by attaching to running processes (parallel run):');
fprintf(fid,'%s\n','                <waitFile>debug.txt</waitFile>');
fprintf(fid,'%s\n','            7) Force stack trace to be written (Linux only):');
fprintf(fid,'%s\n','                <crashOnAbort>true</crashOnAbort>');
fprintf(fid,'%s\n','        -->');
fprintf(fid,'%s\n','    </flow2D3D>');
fprintf(fid,'%s\n','    <delftOnline>');
fprintf(fid,'%s\n','        <enabled>true</enabled>');
fprintf(fid,'%s\n','        <urlFile>sd.url</urlFile>');
fprintf(fid,'%s\n','        <waitOnStart>false</waitOnStart>');
fprintf(fid,'%s\n','        <clientControl>true</clientControl>    <!-- client allowed to start, step, stop, terminate -->');
fprintf(fid,'%s\n','        <clientWrite>false</clientWrite>    <!-- client allowed to modify data -->');
fprintf(fid,'%s\n','        <!--');
fprintf(fid,'%s\n','            Options/alternatives:');
fprintf(fid,'%s\n','            1) Change port range:');
fprintf(fid,'%s\n','                <tcpPortRange start="51001" end="51099"/>');
fprintf(fid,'%s\n','            2) More output to screen (silent, error, info, trace. default: error):');
fprintf(fid,'%s\n','                <verbosity>trace</verbosity>');
fprintf(fid,'%s\n','            3) Force stack trace to be written (Linux only):');
fprintf(fid,'%s\n','                <crashOnAbort>true</crashOnAbort>');
fprintf(fid,'%s\n','        -->');
fprintf(fid,'%s\n','    </delftOnline>');
fprintf(fid,'%s\n','</deltaresHydro>');

fclose(fid);

display('made D3D config xml file')