function [dataPointsStore,Mean_Store,Error_Store] = BarPlotDataPrepCond(allGens,beh,thre,init,final,ep)
condMax = size(allGens{1}.analysis{1, 1}.respMatPlot,2);
timeX = allGens{1}.analysis{1}.timeX/1000;
timeX = timeX(timeX>0);

dataPointsStore = {};
Mean_Store = {};
Error_Store = {};

for gen = 1:length(allGens)
    flyResp = behRespPerFly(condMax,allGens{gen},beh);
    [allCondAvStop,allCondSEMStop,allFlyStop] = ProbStopperfly(condMax,flyResp,thre);
    
    [DataPoint, NeuType_Mean, NeuType_Error] = MeanPointsAndBar(allCondAvStop,allFlyStop, init, final,timeX, ep);
    dataPointsStore{gen} = DataPoint';
    Mean_Store{gen} =NeuType_Mean;
    Error_Store{gen} = NeuType_Error;
    
    
end

end