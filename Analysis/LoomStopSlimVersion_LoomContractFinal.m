
clear all
clc
close all
%% ALL GENOTYPES Bar plot comparisons
sysConfig = GetSystemConfiguration;

%% Getting Genotypes

stim = 'LoomContractFinal';


genotype = 'SPEMPTYDBD_++SHR';
%genotype = 'Natalia_SpEmpty_ShtsShts'
datapath0=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LPLC1_ISOD1';
datapath1=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LPLC1_++SHR_SEP23'
datapath2=[sysConfig.dataPath,'/',genotype,'/',stim];



genotype = 'OLDSPT4T5_ISOD1'
%genotype = 'Natalia_LC12_IsoD1'
datapath5=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'OLDSPT4T5_++SHR'
%genotype = 'Natalia_LC12_ShtsShts'
datapath6=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LC11_ISOD1'
datapath7=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LC11_++SHR'
datapath8=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LPLC2_IsoD1'
datapath9=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LPLC2_++SHR'
datapath10=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LC4_ISOD1';
datapath15=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LC4_++SHR';
datapath16=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LC6_ISOD1';
datapath17=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LC6_++SHR';
datapath18=[sysConfig.dataPath,'/',genotype,'/',stim];

%%
%%

out_spEmptyShts = analysisGenotype(datapath0,1)
%
out_LPLC1_IsoD1 = analysisGenotype(datapath1,1)
out_LPLC1_Shts = analysisGenotype(datapath2,1)
%

out_T4T5_IsoD1 = analysisGenotype(datapath5,1)
out_T4T5_Shts = analysisGenotype(datapath6,1)
out_LC11_IsoD1 = analysisGenotype(datapath7,1)
out_LC11_Shts = analysisGenotype(datapath8,1)

out_LPLC2_IsoD1 = analysisGenotype(datapath9,1)
out_LPLC2_Shts = analysisGenotype(datapath10,1)

out_LC4_IsoD1 = analysisGenotype(datapath15,1)
out_LC4_Shts = analysisGenotype(datapath16,1)


out_LC6_IsoD1 = analysisGenotype(datapath17,1)
out_LC6_Shts = analysisGenotype(datapath18,1)






%% Data Analysis
beh = 2;
thre = 0;

name = {'LPLC1', 'T4T5', 'LPLC2','LC4','LC6', 'LC11'};

init= 2;
figLeg = {'40vFront','40vSide','60vFront','60vSide'};

vel = [40,40,60,60];
finalAll = init + 30./vel;

%condLC4 = [4,3,6,5];
idx = 1;

%final =3.5; l

for cond =5:6
final = finalAll(idx)
allGens = {out_spEmptyShts,out_LPLC1_IsoD1,out_LPLC1_Shts,...
    out_T4T5_IsoD1,out_T4T5_Shts,out_LPLC2_IsoD1,...
    out_LPLC2_Shts,out_LC4_IsoD1,out_LC4_Shts...
    out_LC6_IsoD1,out_LC6_Shts,out_LC11_IsoD1,out_LC11_Shts};


[DataPoints, Meanss, ErrorAllGens] = BarPlotDataPrepCond(allGens,beh,thre,init,final,cond);


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

subplot(2,1,idx)
barPlotMultGen(name,AllGen_MeansStim,AllGen_ErrorsStim,DataPoints(2:end),cell2mat(DataPoints(1)),idx,beh,figLeg,0.7,0)
idx = idx +1;
end