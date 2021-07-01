% TESLA_cases.m
%   Loading all of the output from TESLA that we will use to run COSMOS

% Loading a rather large matrix, with 20 rows for each of the
% variables coming out of TESLA
% 1-4      ntr    atm    v      u       
% 5-7      Hs_N   Tp_N   Dir_N 
% 8-10 ... Hs_S   Tp_S   Dir_S 
% 11-13    Hs_sea Tp_sea Dir_sea
% 14-21   M2 S2 N2 K2 K1 O1 P1 Q1


 load('MDA_1.mat')
 TESLA_design = MDA_1;



