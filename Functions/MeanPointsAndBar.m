
function [MeanByIndFly,avISOval,avISOvalSTD] = MeanPointsAndBar(allCondAvStopISOD1,allFlyStopISOD1, init, final,timeX, ep)
    start=min(find(timeX>=init));
    finish=min(find(timeX>=final));

    avISOval=mean(allCondAvStopISOD1(start:finish,ep),1);
    avISOvalSTD = stderror(allCondAvStopISOD1(start:finish,ep));
    
    MeanByIndFly=mean(allFlyStopISOD1{1, ep}(start:finish,:),1  );


end