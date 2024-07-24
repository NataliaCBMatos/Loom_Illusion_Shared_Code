function [allCondBeh] = behRespPerFly(condmax,out,beh)

timeX = out.analysis{1}.timeX/1000; % converting ms to s
timeX = timeX(timeX>0);
allFlies = cell(1,size(out.analysis{1, 1}.indFly ,2 ));

allCondBeh = {};

for cond = 1:condmax
    allFlies = cell(1,size(out.analysis{1, 1}.indFly ,2 ));

    allBeh = [];
    for flyNumber = 1:size(out.analysis{1, 1}.indFly ,2 )
        fly = out.analysis{1, 1}.indFly{1,flyNumber}.p8_averagedRois.snipMat;
        allFlies{flyNumber} = fly;
        walkresp = fly{cond,1};
        walkresp = walkresp(31:end,:,:);

        walkresp = walkresp(:,:,beh);
        allBeh = [allBeh,walkresp];
    end
    allCondBeh{cond} =allBeh;
end

end