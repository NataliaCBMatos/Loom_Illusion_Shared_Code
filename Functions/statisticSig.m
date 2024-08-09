




function [p1,p2]=statisticSig(X)
idx=1;

for i=2:2:length(X)-1
p1(idx) = ranksum(X{1, 1}  ,X{1, i+1} );
p2(idx) = ranksum(X{1, i}  ,X{1, i+1} );
idx=idx+1;
end

end