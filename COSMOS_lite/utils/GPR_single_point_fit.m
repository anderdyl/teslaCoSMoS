%clear


%% Water level point or waves offshore of NABC?
waterlevel = 1;

%% Choose which point to emulate by commenting out 
%   La Jolla pier
%model = 'socal_sd';
%point = 1004;
%   san diego gauge;
model = 'nasni';
point = 80;
%   tip of amphibious bayside
%model = 'diego_bay';
%point = 81;
%   northwest of amphibious base
%model = 'diego_bay';
%point = 104;
%   southeast of amphibious base
%model = 'diego_bay';
%point = 108;
%   center bridge
%model = 'diego_bay';
%point = 72;
%   NW bridge channel
%model = 'diego_bay';
%point = 110;
%wavep = 158;

%% Extracting simulations
casenumbers = [1:600];  
load('/home/server/pi/homes/danderso/COSMOS_lite/MDA_1.mat')
design1 = MDA_1(casenumbers,:);

%how many do you want to use in the GPR?
how_many = length(casenumbers);

for qqq = 1:how_many
    disp(['extracted case #',num2str(casenumbers(qqq)),' : ',num2str(qqq),' of ',num2str(length(casenumbers)),' MDA of tesla'])

    if waterlevel == 1
        outdir = ['/home/shusin7/users/danderso/MDA_of_TESLA/Case',num2str(casenumbers(qqq)),'/delft3d/'];
        cd(outdir);
        trihfile = [outdir 'trih-' model '.dat'];
        fid = qpfopen(trihfile);
        [fieldneames,dims,nval] = qpread(fid);
        TIMES = qpread(fid,1,'water level','times');
        STATIONS = qpread(fid,1,'water level','stations');
        T = 1:length(TIMES);
        testing(qqq) = length(TIMES);
        DATA = qpread(fid,1,'water level','data',T,point);
        water_level(qqq) = DATA.Val(end);
    else         
        tab = load(['/home/shusin7/users/danderso/MDA_of_TESLA/Case',num2str(casenumbers(qqq)),'/delft3d/socal_sd.locn1t0000073.tab']);
            
        Xp = tab(:,1);
        Yp = tab(:,2);
        depth = tab(:,3);
        Hs = tab(:,4);
        Dir = tab(:,5);
        Tp = tab(:,6);
        Tm = tab(:,7);
        Dspr = tab(:,8);
        
        waves(qqq) = Hs(160);
        
    end
end

if waterlevel == 1
    design(1:length(casenumbers),22) = water_level;
else
    design(1:length(casenumbers),22) = waves;
end

%%


nht = find(design(:,6) == 0);
design(nht,6) = NaN;
design(nht,6) = nanmin(design(:,6));

nh = find(design(:,7) == 0);
design(nh,7) = NaN;
design(nh,7) = nanmean(design(:,7));

sht = find(design(:,9) == 0);
design(sht,9) = NaN;
design(sht,9) = nanmin(design(:,9));

sh = find(design(:,10) == 0);
design(sh,10) = NaN;
design(sh,10) = nanmean(design(:,10));

loct = find(design(:,12) == 0);
design(loct,12) = NaN;
design(loct,12) = nanmin(design(:,12));

loc = find(design(:,13) == 0);
design(loc,13) = NaN;
design(loc,13) = nanmean(design(:,13));



figure
c = 1;

tbl = table(design(:,1),design(:,2),design(:,3),design(:,4),design(:,5),design(:,6),...
    design(:,7),design(:,8),design(:,9),design(:,10),design(:,11),design(:,12),design(:,13),design(:,14),...
    design(:,15),design(:,16),design(:,17),design(:,18),design(:,19),design(:,20),design(:,21),design(:,22));
tbl.Properties.VariableNames = {'NTR','SLP','U','V','HsN','TpN','DirN','HsS','TpS','DirS'...
    'Hsea','Tsea','Dsea','M2','S2','N2','K2','K1','O1','P1','Q1','wl'};


%gprMdl = fitrgp(tbl,'wl','KernelFunction','ardsquaredexponential','FitMethod','sr','PredictMethod','fic','Standardize',1)
gprMdl = fitrgp(tbl,'wl','BasisFunction','linear','KernelFunction','ardmatern52','Standardize',true);%,'FitMethod','sr','PredictMethod','fic','Sigma',0.03,'Standardize',1,'Optimize','True')

Results = predict(gprMdl,design(:,1:21));
Validation = design(:,22);
%subplot(121)
plot(Validation,Results,'o')
hold on
xlabel('D3D')
ylabel('GPR')



figure
subplot(131)
plot(Validation,resubPredict(gprMdl),'k.')
title(['Loss on Training model: ',num2str(resubLoss(gprMdl)),''])

d=21;
subplot(1,3,[2 3])
sigmaMdist = gprMdl.KernelInformation.KernelParameters(1:end-1,1);
plot((1:d)',log(sigmaMdist),'ko-','linewidth',2);
xlim([0,22])
xticks([1:d])
xticklabels({'NTR','SLP','U','V','Hs_{N}','Tp_{N}','Dir_{N}','Hs_{S}','Tp_{S}','Dir_{S}'...
    'H_{sea}','T_{sea}','D_{sea}','M_{2}','S_{2}','N_{2}','K_{2}','K_{1}','O_{1}','P_{1}','Q_{1}'})
%xlabel('Length scale number');
ylabel('Log of length scale');
title('Relative Parameter Importance for Water Level GPR')
set(gcf,'color','w')




% 
figure

d=21;
sigmaMdist = trainedModel.RegressionGP.KernelInformation.KernelParameters(1:end-1,1);
plot((1:d)',log(sigmaMdist)/2,'ko-','linewidth',2);
xlim([0,22])
xticks([1:d])
xticklabels({'NTR','SLP','U','V','Hs_{N}','Tp_{N}','Dir_{N}','Hs_{S}','Tp_{S}','Dir_{S}'...
    'H_{sea}','T_{sea}','D_{sea}','M_{2}','S_{2}','N_{2}','K_{2}','K_{1}','O_{1}','P_{1}','Q_{1}'})
%xlabel('Length scale number');
ylabel('Log of length scale');
title('Relative Parameter Importance for Water Level GPR')
set(gcf,'color','w')
