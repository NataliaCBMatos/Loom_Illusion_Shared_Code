function[allCondAvStop,allCondSEMStop,allFlyStop] = ProbStopperfly(condmax,allCondBeh,thrs)
for cond = 1:condmax
respAnalysis = allCondBeh{1,cond};
% InstStopP = [];
for i = 1:size(respAnalysis,2)
   
    stopPoints = respAnalysis(:,i)<= thrs ;
%     instantaneousStopProbability = sum(stopPoints) / size(respAnalysis(i,:),2);
    
    allFlyStop{cond}(:,i) = stopPoints;
end
avStop=mean(allFlyStop{cond},2);
semStop=std(allFlyStop{cond},[],2)/sqrt(size(respAnalysis,2));

allCondAvStop(:,cond) = avStop;
allCondSEMStop(:,cond) = semStop;
end
end