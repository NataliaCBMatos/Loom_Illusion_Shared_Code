
clear all
clc
close all
%% ALL GENOTYPES Bar plot comparisons
sysConfig = GetSystemConfiguration;

%% Getting Genotypes
stim = 'R5LoomIlluP05P1IncrDecr';
genotype = 'EMPTYDBD_SHTS_MAY23';
%genotype = 'Natalia_SpEmpty_ShtsShts'
datapath0=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LPLC1_ISOD1_JAN23';
datapath1=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LPLC1_SHTS_JAN23';
datapath2=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LPLC2_IsoD1';
datapath3=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LPLC2_++SHR'
datapath4=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LC11_ISOD1'
datapath5=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LC11_++SHR'
datapath6=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LC4_ISOD1'
%genotype = 'Natalia_LC12_IsoD1'
datapath7=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LC4_++SHR'
datapath8=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LC6_ISOD1'
datapath9=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LC6_++SHR'
datapath10=[sysConfig.dataPath,'/',genotype,'/',stim];




genotype = 'DNP06_ISOD1_MAR23'
datapath13=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'DNP06_SHTS_MAR23'
datapath14=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'DNP03_ISOD1_MAR23';
%genotype = 'Natalia_LC12_IsoD1'
datapath15=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'DNP03_SHTS_MAR23';
%genotype = 'Natalia_LC12_ShtsShts'
datapath16=[sysConfig.dataPath,'/',genotype,'/',stim];


stim = 'R5LoomIlluP05P1IncrDecrforT4T5';
genotype = 'OLDSPT4T5_ISOD1_MAY23'
datapath11=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'OLDSPT4T5_SHTS_MAY23'
datapath12=[sysConfig.dataPath,'/',genotype,'/',stim];


%%
%%

out_spEmptyShts = analysisGenotype(datapath0,1)
%
out_LPLC1_IsoD1 = analysisGenotype(datapath1,1)
out_LPLC1_Shts = analysisGenotype(datapath2,1)
%
out_LPLC2_IsoD1 = analysisGenotype(datapath3,1)
out_LPLC2_Shts = analysisGenotype(datapath4,1)

out_LC11_IsoD1 = analysisGenotype(datapath5,1)
out_LC11_Shts = analysisGenotype(datapath6,1)

out_LC4_IsoD1 = analysisGenotype(datapath7,1)
out_LC4_Shts = analysisGenotype(datapath8,1)


out_LC6_IsoD1 = analysisGenotype(datapath9,1)
out_LC6_Shts = analysisGenotype(datapath10,1)

out_T4T5_IsoD1 = analysisGenotype(datapath11,1)
out_T4T5_Shts = analysisGenotype(datapath12,1)





%% Data Analysis
beh = 2;
thre = 0;
init = 2;
final = 4;
name = {'LPLC1', 'LPLC2','LC11','LC4','LC6','T4T5'};
%name = {'LPLC1', 'LPLC2','T4T5'};

figLeg={'5illuloom Side P1 DC1','5illuloom Front P1 DC1',...
    '5illuloom Side P05 DC1','5illuloom Front P05 DC1',...
    '5illuloom Side P1 DC0','5illuloom Front P1 DC0',...
   '5illuloom Side P05 DC0','5illuloom Front P05 DC0'};


idx = 1;

for cond =1:2
    

allGens = {out_spEmptyShts,out_LPLC1_IsoD1,out_LPLC1_Shts,...
    out_LPLC2_IsoD1,...
    out_LPLC2_Shts,...
    out_LC11_IsoD1,out_LC11_Shts,out_LC4_IsoD1,out_LC4_Shts,...
    out_LC6_IsoD1,out_LC6_Shts,out_T4T5_IsoD1,out_T4T5_Shts};
% allGens = {out_spEmptyShts,out_LPLC1_IsoD1,out_LPLC1_Shts,...
%     out_LPLC2_IsoD1,...
%     out_LPLC2_Shts,...
%     out_T4T5_IsoD1,out_T4T5_Shts};


[DataPoints, Meanss, ErrorAllGens] = BarPlotDataPrepCond(allGens,beh,thre,init,final,cond);








% AllGen_MeansStim = [Meanss{1} Meanss{2} Meanss{3};...
%     Meanss{1} Meanss{4} Meanss{5};...
%     Meanss{1} Meanss{6} Meanss{7}];
% 
% 
% AllGen_ErrorsStim = [ErrorAllGens{1} ErrorAllGens{2} ErrorAllGens{3};...
%     ErrorAllGens{1} ErrorAllGens{4} ErrorAllGens{5};...
%     ErrorAllGens{1} ErrorAllGens{6} ErrorAllGens{7}];


AllGen_MeansStim = [Meanss{1} Meanss{2} Meanss{3};...
    Meanss{1} Meanss{4} Meanss{5};...
    Meanss{1} Meanss{6} Meanss{7};...
    Meanss{1} Meanss{8} Meanss{9};...
    Meanss{1} Meanss{10} Meanss{11};...
    Meanss{1} Meanss{12} Meanss{13}];


AllGen_ErrorsStim = [ErrorAllGens{1} ErrorAllGens{2} ErrorAllGens{3};...
    ErrorAllGens{1} ErrorAllGens{4} ErrorAllGens{5};...
    ErrorAllGens{1} ErrorAllGens{6} ErrorAllGens{7};...
    ErrorAllGens{1} ErrorAllGens{8} ErrorAllGens{9};...
    ErrorAllGens{1} ErrorAllGens{10} ErrorAllGens{11};...
    ErrorAllGens{1} ErrorAllGens{12} ErrorAllGens{13}];



[p1,p2]=statisticSig(DataPoints);
pVal{idx}(:,1)=p1;
pVal{idx}(:,2)=p2;



subplot(1,2,idx)
barPlotMultGen(name,AllGen_MeansStim,AllGen_ErrorsStim,DataPoints(2:end),cell2mat(DataPoints(1)),cond,beh,figLeg,0.6,0,pVal{idx})
idx = idx +1;
end



