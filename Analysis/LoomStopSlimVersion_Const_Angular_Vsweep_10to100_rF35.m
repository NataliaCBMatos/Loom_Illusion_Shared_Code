
clear all
clc
close all
%% ALL GENOTYPES Bar plot comparisons
sysConfig = GetSystemConfiguration;

%% Getting Genotypes

stim = 'Const_Angular_Vsweep_10to100_rF35';


genotype = 'EMPTY_SHTS_OCT22';
%genotype = 'Natalia_SpEmpty_ShtsShts'
datapath0=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LPLC1_ISOD1_OCT22';
datapath1=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LPLC1_SHTS_OCT22'
datapath2=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LC16_ISOD1_OCT22'
datapath3=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'Natalia_LC16_ShtsShts'
datapath4=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'T4T5_ISOD1_OCT22'
%genotype = 'Natalia_LC12_IsoD1'
datapath5=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'T4T5_SHTS_OCT22'
%genotype = 'Natalia_LC12_ShtsShts'
datapath6=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LC11_ISOD1_OCT22'
datapath7=[sysConfig.dataPath,'/',genotype,'/',stim];


genotype = 'LC11_SHTS_OCT22'
datapath8=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LPLC2_ISOD1_OCT22'
datapath9=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'Natalia_LPLC2_ShtsShts'
datapath10=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'Natalia_LC17_IsoD1'
datapath11=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'Natalia_LC17_ShtsShts'
datapath12=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'Natalia_LC12_IsoD1';
%genotype = 'Natalia_LC12_IsoD1'
datapath13=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'Natalia_LC12_ShtsShts';
%genotype = 'Natalia_LC12_ShtsShts'
datapath14=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'Natalia_LC4_IsoD1';
datapath15=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'Natalia_LC4_ShtsShts';
datapath16=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'Natalia_LC6_IsoD1';
datapath17=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'Natalia_LC6_ShtsShts';
datapath18=[sysConfig.dataPath,'/',genotype,'/',stim];

%%
%%

out_spEmptyShts = analysisGenotype(datapath0,1)
%
out_LPLC1_IsoD1 = analysisGenotype(datapath1,1)
out_LPLC1_Shts = analysisGenotype(datapath2,1)
%
out_LC16_IsoD1 = analysisGenotype(datapath3,1)
out_LC16_Shts = analysisGenotype(datapath4,1)
out_T4T5_IsoD1 = analysisGenotype(datapath5,1)
out_T4T5_Shts = analysisGenotype(datapath6,1)
out_LC11_IsoD1 = analysisGenotype(datapath7,1)
out_LC11_Shts = analysisGenotype(datapath8,1)

out_LPLC2_IsoD1 = analysisGenotype(datapath9,1)
out_LPLC2_Shts = analysisGenotype(datapath10,1)
out_LC17_IsoD1 = analysisGenotype(datapath11,1)
out_LC17_Shts = analysisGenotype(datapath12,1)
out_LC12_IsoD1 = analysisGenotype(datapath13,1)
out_LC12_Shts = analysisGenotype(datapath14,1)

out_LC6_IsoD1 = analysisGenotype(datapath17,1)
out_LC6_Shts = analysisGenotype(datapath18,1)


%%

stim = 'LoomContractFinal';


genotype = 'LC4_ISOD1';
datapath19=[sysConfig.dataPath,'/',genotype,'/',stim];

genotype = 'LC4_++SHR';
datapath20=[sysConfig.dataPath,'/',genotype,'/',stim];


out_LC4_IsoD1 = analysisGenotype(datapath19,1)
out_LC4_Shts = analysisGenotype(datapath20,1)





%% Data Analysis
beh = 2;
thre = 0;
init = 1;
name = {'LPLC1', 'T4T5', 'LPLC2', 'LC16','LC6', 'LC11', 'LC12', 'LC17','LC4'};

figLeg={'Side vel 10','Front vel 10',	'Side vel 20','	Front vel 20',...
   'Side vel 40','Front vel 40',	'Side vel 60','	Front vel 60',...
   'Side vel 80','Front vel 80',	'Side vel 100','	Front vel 100'};

vel = [10,10,20,20,40,40,60,60,80,80, 100, 100];
finalAll = init + (30./vel);
idx = 1;
idxs = [1,3,2,4];
condLC4 = [4,3,6,5];
initLC4= 2;
finalLC4 =3.5; 
for cond =5:8
final = finalAll(cond);

allGens = {out_spEmptyShts,out_LPLC1_IsoD1,out_LPLC1_Shts,...
    out_T4T5_IsoD1,out_T4T5_Shts,out_LPLC2_IsoD1,...
    out_LPLC2_Shts,out_LC16_IsoD1,out_LC16_Shts,...
    out_LC6_IsoD1,out_LC6_Shts,out_LC11_IsoD1,out_LC11_Shts,out_LC12_IsoD1,out_LC12_Shts,...
    out_LC17_IsoD1,out_LC17_Shts};

allGensLC4 = {out_LC4_IsoD1,out_LC4_Shts};

[DataPoints, Meanss, ErrorAllGens] = BarPlotDataPrepCond(allGens,beh,thre,init,final,cond);
[DataPoints_LC4, Meanss_LC4, ErrorAllGens_LC4] = BarPlotDataPrepCond(allGensLC4,beh,thre,initLC4,finalLC4,condLC4(idx));

DataPoints{18} = DataPoints_LC4{1};
DataPoints{19} = DataPoints_LC4{2};

AllGen_MeansStim = [Meanss{1} Meanss{2} Meanss{3};...
    Meanss{1} Meanss{4} Meanss{5};...
    Meanss{1} Meanss{6} Meanss{7};...
    Meanss{1} Meanss{8} Meanss{9};...
    Meanss{1} Meanss{10} Meanss{11};...
    Meanss{1} Meanss{12} Meanss{13};...
    Meanss{1} Meanss{14} Meanss{15};...
    Meanss{1} Meanss{16} Meanss{17};...
    Meanss{1} Meanss_LC4{1} Meanss_LC4{2}];


AllGen_ErrorsStim = [ErrorAllGens{1} ErrorAllGens{2} ErrorAllGens{3};...
    ErrorAllGens{1} ErrorAllGens{4} ErrorAllGens{5};...
    ErrorAllGens{1} ErrorAllGens{6} ErrorAllGens{7};...
    ErrorAllGens{1} ErrorAllGens{8} ErrorAllGens{9};...
    ErrorAllGens{1} ErrorAllGens{10} ErrorAllGens{11};...
    ErrorAllGens{1} ErrorAllGens{12} ErrorAllGens{13};...
    ErrorAllGens{1} ErrorAllGens{14} ErrorAllGens{15};...
    ErrorAllGens{1} ErrorAllGens{16} ErrorAllGens{17};...
    ErrorAllGens{1} ErrorAllGens_LC4{1} ErrorAllGens_LC4{2}];

subplot(2,2,idxs(idx))
barPlotMultGen(name,AllGen_MeansStim,AllGen_ErrorsStim,DataPoints(2:end),cell2mat(DataPoints(1)),cond,beh,figLeg,0.6)
idx = idx +1;
end
