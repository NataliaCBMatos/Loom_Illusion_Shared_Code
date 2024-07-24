function out= analysisGenotype(dataPath,comb)

analysisFiles={'PlotTimeTraces'};

args = {'analysisFile',analysisFiles,...
        'dataPath',dataPath,...
        'combOpp',comb}; % combine left/right symmetric parameters? (defaulted to 1)

% Run the thing
out = RunAnalysis(args{:});
end


