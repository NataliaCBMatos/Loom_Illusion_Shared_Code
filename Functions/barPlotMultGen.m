function barPlotMultGen(name,AllGen_MeansStim,AllGen_ErrorsStim,AllDataPointsStim,dataPoints_out_spEmptyShts,ep,beh,figLeg,ylimUp,addPoints,pVal)
%
color = linspecer(3);

b = bar(AllGen_MeansStim, 'grouped','FaceColor','flat');
hold on
% Calculate the number of groups and number of bars in each group
[ngroups,nbars] = size(AllGen_MeansStim);
% Get the x coordinate of the bars
x = nan(nbars, ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end

b(1).FaceColor = [0.5 0.5 0.5];
b(2).FaceColor = [0.25 0.25 0.25];
b(3).FaceColor = color(2,:);

% Plot the errorbars
errorbar(x',AllGen_MeansStim,AllGen_ErrorsStim,'k','linestyle','none','LineWidth',1.5);
% text(x,ylimUp,num2str(pVal))
set(gca,'xticklabel',name)
hold on 

PointPos = x(:);

GenPoints = 1:size(PointPos,1);
removalList = 1:3:size(PointPos,1);
GenPoints(removalList) = [];

if addPoints == 1
for i = 1:length(GenPoints)
scatter(PointPos(GenPoints(i)),AllDataPointsStim{i}, 'ok','MarkerEdgeAlpha',0.5 );
end 


% 
for i = removalList
scatter(PointPos(i),dataPoints_out_spEmptyShts, 'ok','MarkerEdgeAlpha',0.5);
end 

end

ax=gca;
ax.FontSize = 14;
ylim([0 ylimUp]) %-215 90 or -50 to 120


legend('Empty > Shts','Gal4 > IsoD1','Gal4 > Shts')
ylabel('Mean freezing fraction ')
   

if length(figLeg) > 1
title(figLeg{ep},'FontSize',22)
end
hold off

ConfAxis()

end