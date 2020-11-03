% Please note that: these codes will run for hours to output the results 
% for 5 baseline methods on 13 real single-cell datasets. 
% Due to the built-in cross validation or random resampling of some algorithms
% (such as Bagged Trees), the running result may be slightly different from figure 6.
disp('####### Results of 5 baseline methods on the Buettner dataset #######');
load('SIMLR\Buettner.mat');
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier11, validationAccuracy11] = trainClassifier11(trainingData);
testingData_fitlabs11 = trainedClassifier11.predictFcn(testingData(:,1:end-1));
testingData_truelabs11 = testingData(:,end);
testingData_accuracy11 = sum(testingData_fitlabs11 == testingData_truelabs11)/sum(istest)
[trainedClassifier12, validationAccuracy12] = trainClassifier12(trainingData);
testingData_fitlabs12 = trainedClassifier12.predictFcn(testingData(:,1:end-1));
testingData_truelabs12 = testingData(:,end);
testingData_accuracy12 = sum(testingData_fitlabs12 == testingData_truelabs12)/sum(istest)
[trainedClassifier13, validationAccuracy13] = trainClassifier13(trainingData);
testingData_fitlabs13 = trainedClassifier13.predictFcn(testingData(:,1:end-1));
testingData_truelabs13 = testingData(:,end);
testingData_accuracy13 = sum(testingData_fitlabs13 == testingData_truelabs13)/sum(istest)
[trainedClassifier14, validationAccuracy14] = trainClassifier14(trainingData);
testingData_fitlabs14 = trainedClassifier14.predictFcn(testingData(:,1:end-1));
testingData_truelabs14 = testingData(:,end);
testingData_accuracy14 = sum(testingData_fitlabs14 == testingData_truelabs14)/sum(istest)
[trainedClassifier15, validationAccuracy15] = trainClassifier15(trainingData); 
testingData_fitlabs15 = trainedClassifier15.predictFcn(testingData(:,1:end-1));
testingData_truelabs15 = testingData(:,end);
testingData_accuracy15 = sum(testingData_fitlabs15 == testingData_truelabs15)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15
toc;

disp('####### Results of 5 baseline methods on the Kolod dataset #######');
load('SIMLR\Kolod.mat');
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier21, validationAccuracy21] = trainClassifier21(trainingData);
testingData_fitlabs21 = trainedClassifier21.predictFcn(testingData(:,1:end-1));
testingData_truelabs21 = testingData(:,end);
testingData_accuracy21 = sum(testingData_fitlabs21 == testingData_truelabs21)/sum(istest)
[trainedClassifier22, validationAccuracy22] = trainClassifier22(trainingData);
testingData_fitlabs22 = trainedClassifier22.predictFcn(testingData(:,1:end-1));
testingData_truelabs22 = testingData(:,end);
testingData_accuracy22 = sum(testingData_fitlabs22 == testingData_truelabs22)/sum(istest)
[trainedClassifier23, validationAccuracy23] = trainClassifier23(trainingData);
testingData_fitlabs23 = trainedClassifier23.predictFcn(testingData(:,1:end-1));
testingData_truelabs23 = testingData(:,end);
testingData_accuracy23 = sum(testingData_fitlabs23 == testingData_truelabs23)/sum(istest)
[trainedClassifier24, validationAccuracy24] = trainClassifier24(trainingData);
testingData_fitlabs24 = trainedClassifier24.predictFcn(testingData(:,1:end-1));
testingData_truelabs24 = testingData(:,end);
testingData_accuracy24 = sum(testingData_fitlabs24 == testingData_truelabs24)/sum(istest)
[trainedClassifier25, validationAccuracy25] = trainClassifier25(trainingData); 
testingData_fitlabs25 = trainedClassifier25.predictFcn(testingData(:,1:end-1));
testingData_truelabs25 = testingData(:,end);
testingData_accuracy25 = sum(testingData_fitlabs25 == testingData_truelabs25)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25
toc;

disp('####### Results of 5 baseline methods on the Pollen dataset #######');
load('SIMLR\Pollen.mat');
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier31, validationAccuracy31] = trainClassifier31(trainingData);
testingData_fitlabs31 = trainedClassifier31.predictFcn(testingData(:,1:end-1));
testingData_truelabs31 = testingData(:,end);
testingData_accuracy31 = sum(testingData_fitlabs31 == testingData_truelabs31)/sum(istest)
[trainedClassifier32, validationAccuracy32] = trainClassifier32(trainingData);
testingData_fitlabs32 = trainedClassifier32.predictFcn(testingData(:,1:end-1));
testingData_truelabs32 = testingData(:,end);
testingData_accuracy32 = sum(testingData_fitlabs32 == testingData_truelabs32)/sum(istest)
[trainedClassifier33, validationAccuracy33] = trainClassifier33(trainingData);
testingData_fitlabs33 = trainedClassifier33.predictFcn(testingData(:,1:end-1));
testingData_truelabs33 = testingData(:,end);
testingData_accuracy33 = sum(testingData_fitlabs33 == testingData_truelabs33)/sum(istest)
[trainedClassifier34, validationAccuracy34] = trainClassifier34(trainingData);
testingData_fitlabs34 = trainedClassifier34.predictFcn(testingData(:,1:end-1));
testingData_truelabs34 = testingData(:,end);
testingData_accuracy34 = sum(testingData_fitlabs34 == testingData_truelabs34)/sum(istest)
[trainedClassifier35, validationAccuracy35] = trainClassifier35(trainingData); 
testingData_fitlabs35 = trainedClassifier35.predictFcn(testingData(:,1:end-1));
testingData_truelabs35 = testingData(:,end);
testingData_accuracy35 = sum(testingData_fitlabs35 == testingData_truelabs35)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35
toc;

disp('####### Results of 5 baseline methods on the Usoskin dataset #######');
load('SIMLR\Usoskin.mat');
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier41, validationAccuracy41] = trainClassifier41(trainingData);
testingData_fitlabs41 = trainedClassifier41.predictFcn(testingData(:,1:end-1));
testingData_truelabs41 = testingData(:,end);
testingData_accuracy41 = sum(testingData_fitlabs41 == testingData_truelabs41)/sum(istest)
[trainedClassifier42, validationAccuracy42] = trainClassifier42(trainingData);
testingData_fitlabs42 = trainedClassifier42.predictFcn(testingData(:,1:end-1));
testingData_truelabs42 = testingData(:,end);
testingData_accuracy42 = sum(testingData_fitlabs42 == testingData_truelabs42)/sum(istest)
[trainedClassifier43, validationAccuracy43] = trainClassifier43(trainingData);
testingData_fitlabs43 = trainedClassifier43.predictFcn(testingData(:,1:end-1));
testingData_truelabs43 = testingData(:,end);
testingData_accuracy43 = sum(testingData_fitlabs43 == testingData_truelabs43)/sum(istest)
[trainedClassifier44, validationAccuracy44] = trainClassifier44(trainingData);
testingData_fitlabs44 = trainedClassifier44.predictFcn(testingData(:,1:end-1));
testingData_truelabs44 = testingData(:,end);
testingData_accuracy44 = sum(testingData_fitlabs44 == testingData_truelabs44)/sum(istest)
[trainedClassifier45, validationAccuracy45] = trainClassifier45(trainingData); 
testingData_fitlabs45 = trainedClassifier45.predictFcn(testingData(:,1:end-1));
testingData_truelabs45 = testingData(:,end);
testingData_accuracy45 = sum(testingData_fitlabs45 == testingData_truelabs45)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35...
    testingData_accuracy41 testingData_accuracy42 testingData_accuracy43 testingData_accuracy44 testingData_accuracy45
toc;

disp('####### Results of 5 baseline methods on the Zeisel dataset #######');
load('SIMLR\Zeisel.mat'); in_X = full(in_X); clear label2;
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier51, validationAccuracy51] = trainClassifier51(trainingData);
testingData_fitlabs51 = trainedClassifier51.predictFcn(testingData(:,1:end-1));
testingData_truelabs51 = testingData(:,end);
testingData_accuracy51 = sum(testingData_fitlabs51 == testingData_truelabs51)/sum(istest)
[trainedClassifier52, validationAccuracy52] = trainClassifier52(trainingData);
testingData_fitlabs52 = trainedClassifier52.predictFcn(testingData(:,1:end-1));
testingData_truelabs52 = testingData(:,end);
testingData_accuracy52 = sum(testingData_fitlabs52 == testingData_truelabs52)/sum(istest)
[trainedClassifier53, validationAccuracy53] = trainClassifier53(trainingData);
testingData_fitlabs53 = trainedClassifier53.predictFcn(testingData(:,1:end-1));
testingData_truelabs53 = testingData(:,end);
testingData_accuracy53 = sum(testingData_fitlabs53 == testingData_truelabs53)/sum(istest)
[trainedClassifier54, validationAccuracy54] = trainClassifier54(trainingData);
testingData_fitlabs54 = trainedClassifier54.predictFcn(testingData(:,1:end-1));
testingData_truelabs54 = testingData(:,end);
testingData_accuracy54 = sum(testingData_fitlabs54 == testingData_truelabs54)/sum(istest)
[trainedClassifier55, validationAccuracy55] = trainClassifier55(trainingData); 
testingData_fitlabs55 = trainedClassifier55.predictFcn(testingData(:,1:end-1));
testingData_truelabs55 = testingData(:,end);
testingData_accuracy55 = sum(testingData_fitlabs55 == testingData_truelabs55)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35...
    testingData_accuracy41 testingData_accuracy42 testingData_accuracy43 testingData_accuracy44 testingData_accuracy45...
    testingData_accuracy51 testingData_accuracy52 testingData_accuracy53 testingData_accuracy54 testingData_accuracy55
toc;

disp('####### Results of 5 baseline methods on the Buettner* dataset #######');
load('MPSSC\Data_Buettner.mat');
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier61, validationAccuracy61] = trainClassifier61(trainingData);
testingData_fitlabs61 = trainedClassifier61.predictFcn(testingData(:,1:end-1));
testingData_truelabs61 = testingData(:,end);
testingData_accuracy61 = sum(testingData_fitlabs61 == testingData_truelabs61)/sum(istest)
[trainedClassifier62, validationAccuracy62] = trainClassifier62(trainingData);
testingData_fitlabs62 = trainedClassifier62.predictFcn(testingData(:,1:end-1));
testingData_truelabs62 = testingData(:,end);
testingData_accuracy62 = sum(testingData_fitlabs62 == testingData_truelabs62)/sum(istest)
[trainedClassifier63, validationAccuracy63] = trainClassifier63(trainingData);
testingData_fitlabs63 = trainedClassifier63.predictFcn(testingData(:,1:end-1));
testingData_truelabs63 = testingData(:,end);
testingData_accuracy63 = sum(testingData_fitlabs63 == testingData_truelabs63)/sum(istest)
[trainedClassifier64, validationAccuracy64] = trainClassifier64(trainingData);
testingData_fitlabs64 = trainedClassifier64.predictFcn(testingData(:,1:end-1));
testingData_truelabs64 = testingData(:,end);
testingData_accuracy64 = sum(testingData_fitlabs64 == testingData_truelabs64)/sum(istest)
[trainedClassifier65, validationAccuracy65] = trainClassifier65(trainingData); 
testingData_fitlabs65 = trainedClassifier65.predictFcn(testingData(:,1:end-1));
testingData_truelabs65 = testingData(:,end);
testingData_accuracy65 = sum(testingData_fitlabs65 == testingData_truelabs65)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35...
    testingData_accuracy41 testingData_accuracy42 testingData_accuracy43 testingData_accuracy44 testingData_accuracy45...
    testingData_accuracy51 testingData_accuracy52 testingData_accuracy53 testingData_accuracy54 testingData_accuracy55...
    testingData_accuracy61 testingData_accuracy62 testingData_accuracy63 testingData_accuracy64 testingData_accuracy65
toc;

disp('####### Results of 5 baseline methods on the Deng dataset #######');
load('MPSSC\Data_Deng.mat');
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier71, validationAccuracy71] = trainClassifier71(trainingData);
testingData_fitlabs71 = trainedClassifier71.predictFcn(testingData(:,1:end-1));
testingData_truelabs71 = testingData(:,end);
testingData_accuracy71 = sum(testingData_fitlabs71 == testingData_truelabs71)/sum(istest)
[trainedClassifier72, validationAccuracy72] = trainClassifier72(trainingData);
testingData_fitlabs72 = trainedClassifier72.predictFcn(testingData(:,1:end-1));
testingData_truelabs72 = testingData(:,end);
testingData_accuracy72 = sum(testingData_fitlabs72 == testingData_truelabs72)/sum(istest)
[trainedClassifier73, validationAccuracy73] = trainClassifier73(trainingData);
testingData_fitlabs73 = trainedClassifier73.predictFcn(testingData(:,1:end-1));
testingData_truelabs73 = testingData(:,end);
testingData_accuracy73 = sum(testingData_fitlabs73 == testingData_truelabs73)/sum(istest)
[trainedClassifier74, validationAccuracy74] = trainClassifier74(trainingData);
testingData_fitlabs74 = trainedClassifier74.predictFcn(testingData(:,1:end-1));
testingData_truelabs74 = testingData(:,end);
testingData_accuracy74 = sum(testingData_fitlabs74 == testingData_truelabs74)/sum(istest)
[trainedClassifier75, validationAccuracy75] = trainClassifier75(trainingData); 
testingData_fitlabs75 = trainedClassifier75.predictFcn(testingData(:,1:end-1));
testingData_truelabs75 = testingData(:,end);
testingData_accuracy75 = sum(testingData_fitlabs75 == testingData_truelabs75)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35...
    testingData_accuracy41 testingData_accuracy42 testingData_accuracy43 testingData_accuracy44 testingData_accuracy45...
    testingData_accuracy51 testingData_accuracy52 testingData_accuracy53 testingData_accuracy54 testingData_accuracy55...
    testingData_accuracy61 testingData_accuracy62 testingData_accuracy63 testingData_accuracy64 testingData_accuracy65...
    testingData_accuracy71 testingData_accuracy72 testingData_accuracy73 testingData_accuracy74 testingData_accuracy75
toc;

disp('####### Results of 5 baseline methods on the Ginhoux dataset #######');
load('MPSSC\Data_Ginhoux.mat');
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier81, validationAccuracy81] = trainClassifier81(trainingData);
testingData_fitlabs81 = trainedClassifier81.predictFcn(testingData(:,1:end-1));
testingData_truelabs81 = testingData(:,end);
testingData_accuracy81 = sum(testingData_fitlabs81 == testingData_truelabs81)/sum(istest)
[trainedClassifier82, validationAccuracy82] = trainClassifier82(trainingData);
testingData_fitlabs82 = trainedClassifier82.predictFcn(testingData(:,1:end-1));
testingData_truelabs82 = testingData(:,end);
testingData_accuracy82 = sum(testingData_fitlabs82 == testingData_truelabs82)/sum(istest)
[trainedClassifier83, validationAccuracy83] = trainClassifier83(trainingData);
testingData_fitlabs83 = trainedClassifier83.predictFcn(testingData(:,1:end-1));
testingData_truelabs83 = testingData(:,end);
testingData_accuracy83 = sum(testingData_fitlabs83 == testingData_truelabs83)/sum(istest)
[trainedClassifier84, validationAccuracy84] = trainClassifier84(trainingData);
testingData_fitlabs84 = trainedClassifier84.predictFcn(testingData(:,1:end-1));
testingData_truelabs84 = testingData(:,end);
testingData_accuracy84 = sum(testingData_fitlabs84 == testingData_truelabs84)/sum(istest)
[trainedClassifier85, validationAccuracy85] = trainClassifier85(trainingData); 
testingData_fitlabs85 = trainedClassifier85.predictFcn(testingData(:,1:end-1));
testingData_truelabs85 = testingData(:,end);
testingData_accuracy85 = sum(testingData_fitlabs85 == testingData_truelabs85)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35...
    testingData_accuracy41 testingData_accuracy42 testingData_accuracy43 testingData_accuracy44 testingData_accuracy45...
    testingData_accuracy51 testingData_accuracy52 testingData_accuracy53 testingData_accuracy54 testingData_accuracy55...
    testingData_accuracy61 testingData_accuracy62 testingData_accuracy63 testingData_accuracy64 testingData_accuracy65...
    testingData_accuracy71 testingData_accuracy72 testingData_accuracy73 testingData_accuracy74 testingData_accuracy75...
    testingData_accuracy81 testingData_accuracy82 testingData_accuracy83 testingData_accuracy84 testingData_accuracy85
toc;

disp('####### Results of 5 baseline methods on the Pollen* dataset #######');
load('MPSSC\Data_Pollen.mat');
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier91, validationAccuracy91] = trainClassifier91(trainingData);
testingData_fitlabs91 = trainedClassifier91.predictFcn(testingData(:,1:end-1));
testingData_truelabs91 = testingData(:,end);
testingData_accuracy91 = sum(testingData_fitlabs91 == testingData_truelabs91)/sum(istest)
[trainedClassifier92, validationAccuracy92] = trainClassifier92(trainingData);
testingData_fitlabs92 = trainedClassifier92.predictFcn(testingData(:,1:end-1));
testingData_truelabs92 = testingData(:,end);
testingData_accuracy92 = sum(testingData_fitlabs92 == testingData_truelabs92)/sum(istest)
[trainedClassifier93, validationAccuracy93] = trainClassifier93(trainingData);
testingData_fitlabs93 = trainedClassifier93.predictFcn(testingData(:,1:end-1));
testingData_truelabs93 = testingData(:,end);
testingData_accuracy93 = sum(testingData_fitlabs93 == testingData_truelabs93)/sum(istest)
[trainedClassifier94, validationAccuracy94] = trainClassifier94(trainingData);
testingData_fitlabs94 = trainedClassifier94.predictFcn(testingData(:,1:end-1));
testingData_truelabs94 = testingData(:,end);
testingData_accuracy94 = sum(testingData_fitlabs94 == testingData_truelabs94)/sum(istest)
[trainedClassifier95, validationAccuracy95] = trainClassifier95(trainingData); 
testingData_fitlabs95 = trainedClassifier95.predictFcn(testingData(:,1:end-1));
testingData_truelabs95 = testingData(:,end);
testingData_accuracy95 = sum(testingData_fitlabs95 == testingData_truelabs95)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35...
    testingData_accuracy41 testingData_accuracy42 testingData_accuracy43 testingData_accuracy44 testingData_accuracy45...
    testingData_accuracy51 testingData_accuracy52 testingData_accuracy53 testingData_accuracy54 testingData_accuracy55...
    testingData_accuracy61 testingData_accuracy62 testingData_accuracy63 testingData_accuracy64 testingData_accuracy65...
    testingData_accuracy71 testingData_accuracy72 testingData_accuracy73 testingData_accuracy74 testingData_accuracy75...
    testingData_accuracy81 testingData_accuracy82 testingData_accuracy83 testingData_accuracy84 testingData_accuracy85...
    testingData_accuracy91 testingData_accuracy92 testingData_accuracy93 testingData_accuracy94 testingData_accuracy95
toc;

disp('####### Results of 5 baseline methods on the Tasic dataset #######');
load('MPSSC\Data_Tasic.mat'); true_labs = true_labs-double(true_labs>25);
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier101, validationAccuracy101] = trainClassifier101(trainingData);
testingData_fitlabs101 = trainedClassifier101.predictFcn(testingData(:,1:end-1));
testingData_truelabs101 = testingData(:,end);
testingData_accuracy101 = sum(testingData_fitlabs101 == testingData_truelabs101)/sum(istest)
[trainedClassifier102, validationAccuracy102] = trainClassifier102(trainingData);
testingData_fitlabs102 = trainedClassifier102.predictFcn(testingData(:,1:end-1));
testingData_truelabs102 = testingData(:,end);
testingData_accuracy102 = sum(testingData_fitlabs102 == testingData_truelabs102)/sum(istest)
[trainedClassifier103, validationAccuracy103] = trainClassifier103(trainingData);
testingData_fitlabs103 = trainedClassifier103.predictFcn(testingData(:,1:end-1));
testingData_truelabs103 = testingData(:,end);
testingData_accuracy103 = sum(testingData_fitlabs103 == testingData_truelabs103)/sum(istest)
[trainedClassifier104, validationAccuracy104] = trainClassifier104(trainingData);
testingData_fitlabs104 = trainedClassifier104.predictFcn(testingData(:,1:end-1));
testingData_truelabs104 = testingData(:,end);
testingData_accuracy104 = sum(testingData_fitlabs104 == testingData_truelabs104)/sum(istest)
[trainedClassifier105, validationAccuracy105] = trainClassifier105(trainingData); 
testingData_fitlabs105 = trainedClassifier105.predictFcn(testingData(:,1:end-1));
testingData_truelabs105 = testingData(:,end);
testingData_accuracy105 = sum(testingData_fitlabs105 == testingData_truelabs105)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35...
    testingData_accuracy41 testingData_accuracy42 testingData_accuracy43 testingData_accuracy44 testingData_accuracy45...
    testingData_accuracy51 testingData_accuracy52 testingData_accuracy53 testingData_accuracy54 testingData_accuracy55...
    testingData_accuracy61 testingData_accuracy62 testingData_accuracy63 testingData_accuracy64 testingData_accuracy65...
    testingData_accuracy71 testingData_accuracy72 testingData_accuracy73 testingData_accuracy74 testingData_accuracy75...
    testingData_accuracy81 testingData_accuracy82 testingData_accuracy83 testingData_accuracy84 testingData_accuracy85...
    testingData_accuracy91 testingData_accuracy92 testingData_accuracy93 testingData_accuracy94 testingData_accuracy95...
    testingData_accuracy101 testingData_accuracy102 testingData_accuracy103 testingData_accuracy104 testingData_accuracy105
toc;

disp('####### Results of 5 baseline methods on the Ting dataset #######');
load('MPSSC\Data_Ting.mat'); true_labs = true_labs';
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier111, validationAccuracy111] = trainClassifier111(trainingData);
testingData_fitlabs111 = trainedClassifier111.predictFcn(testingData(:,1:end-1));
testingData_truelabs111 = testingData(:,end);
testingData_accuracy111 = sum(testingData_fitlabs111 == testingData_truelabs111)/sum(istest)
[trainedClassifier112, validationAccuracy112] = trainClassifier112(trainingData);
testingData_fitlabs112 = trainedClassifier112.predictFcn(testingData(:,1:end-1));
testingData_truelabs112 = testingData(:,end);
testingData_accuracy112 = sum(testingData_fitlabs112 == testingData_truelabs112)/sum(istest)
[trainedClassifier113, validationAccuracy113] = trainClassifier113(trainingData);
testingData_fitlabs113 = trainedClassifier113.predictFcn(testingData(:,1:end-1));
testingData_truelabs113 = testingData(:,end);
testingData_accuracy113 = sum(testingData_fitlabs113 == testingData_truelabs113)/sum(istest)
[trainedClassifier114, validationAccuracy114] = trainClassifier114(trainingData);
testingData_fitlabs114 = trainedClassifier114.predictFcn(testingData(:,1:end-1));
testingData_truelabs114 = testingData(:,end);
testingData_accuracy114 = sum(testingData_fitlabs114 == testingData_truelabs114)/sum(istest)
[trainedClassifier115, validationAccuracy115] = trainClassifier115(trainingData); 
testingData_fitlabs115 = trainedClassifier115.predictFcn(testingData(:,1:end-1));
testingData_truelabs115 = testingData(:,end);
testingData_accuracy115 = sum(testingData_fitlabs115 == testingData_truelabs115)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35...
    testingData_accuracy41 testingData_accuracy42 testingData_accuracy43 testingData_accuracy44 testingData_accuracy45...
    testingData_accuracy51 testingData_accuracy52 testingData_accuracy53 testingData_accuracy54 testingData_accuracy55...
    testingData_accuracy61 testingData_accuracy62 testingData_accuracy63 testingData_accuracy64 testingData_accuracy65...
    testingData_accuracy71 testingData_accuracy72 testingData_accuracy73 testingData_accuracy74 testingData_accuracy75...
    testingData_accuracy81 testingData_accuracy82 testingData_accuracy83 testingData_accuracy84 testingData_accuracy85...
    testingData_accuracy91 testingData_accuracy92 testingData_accuracy93 testingData_accuracy94 testingData_accuracy95...
    testingData_accuracy101 testingData_accuracy102 testingData_accuracy103 testingData_accuracy104 testingData_accuracy105...
    testingData_accuracy111 testingData_accuracy112 testingData_accuracy113 testingData_accuracy114 testingData_accuracy115
toc;

disp('####### Results of 5 baseline methods on the Treutlin dataset #######');
load('MPSSC\Data_Treutlin.mat');
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier121, validationAccuracy121] = trainClassifier121(trainingData);
testingData_fitlabs121 = trainedClassifier121.predictFcn(testingData(:,1:end-1));
testingData_truelabs121 = testingData(:,end);
testingData_accuracy121 = sum(testingData_fitlabs121 == testingData_truelabs121)/sum(istest)
[trainedClassifier122, validationAccuracy122] = trainClassifier122(trainingData);
testingData_fitlabs122 = trainedClassifier122.predictFcn(testingData(:,1:end-1));
testingData_truelabs122 = testingData(:,end);
testingData_accuracy122 = sum(testingData_fitlabs122 == testingData_truelabs122)/sum(istest)
[trainedClassifier123, validationAccuracy123] = trainClassifier123(trainingData);
testingData_fitlabs123 = trainedClassifier123.predictFcn(testingData(:,1:end-1));
testingData_truelabs123 = testingData(:,end);
testingData_accuracy123 = sum(testingData_fitlabs123 == testingData_truelabs123)/sum(istest)
[trainedClassifier124, validationAccuracy124] = trainClassifier124(trainingData);
testingData_fitlabs124 = trainedClassifier124.predictFcn(testingData(:,1:end-1));
testingData_truelabs124 = testingData(:,end);
testingData_accuracy124 = sum(testingData_fitlabs124 == testingData_truelabs124)/sum(istest)
[trainedClassifier125, validationAccuracy125] = trainClassifier125(trainingData); 
testingData_fitlabs125 = trainedClassifier125.predictFcn(testingData(:,1:end-1));
testingData_truelabs125 = testingData(:,end);
testingData_accuracy125 = sum(testingData_fitlabs125 == testingData_truelabs125)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35...
    testingData_accuracy41 testingData_accuracy42 testingData_accuracy43 testingData_accuracy44 testingData_accuracy45...
    testingData_accuracy51 testingData_accuracy52 testingData_accuracy53 testingData_accuracy54 testingData_accuracy55...
    testingData_accuracy61 testingData_accuracy62 testingData_accuracy63 testingData_accuracy64 testingData_accuracy65...
    testingData_accuracy71 testingData_accuracy72 testingData_accuracy73 testingData_accuracy74 testingData_accuracy75...
    testingData_accuracy81 testingData_accuracy82 testingData_accuracy83 testingData_accuracy84 testingData_accuracy85...
    testingData_accuracy91 testingData_accuracy92 testingData_accuracy93 testingData_accuracy94 testingData_accuracy95...
    testingData_accuracy101 testingData_accuracy102 testingData_accuracy103 testingData_accuracy104 testingData_accuracy105...
    testingData_accuracy111 testingData_accuracy112 testingData_accuracy113 testingData_accuracy114 testingData_accuracy115...
    testingData_accuracy121 testingData_accuracy122 testingData_accuracy123 testingData_accuracy124 testingData_accuracy125
toc;

disp('####### Results of 5 baseline methods on the Zeisel* dataset #######');
load('MPSSC\Data_Zeisel.mat');
warning off; rng('default');
part = cvpartition(true_labs,'Holdout',0.2); 
istrain = training(part); 
istest = test(part); 
trainingData = [in_X(istrain,:),true_labs(istrain)]; 
testingData = [in_X(istest,:),true_labs(istest)];
tic;
[trainedClassifier131, validationAccuracy131] = trainClassifier131(trainingData);
testingData_fitlabs131 = trainedClassifier131.predictFcn(testingData(:,1:end-1));
testingData_truelabs131 = testingData(:,end);
testingData_accuracy131 = sum(testingData_fitlabs131 == testingData_truelabs131)/sum(istest)
[trainedClassifier132, validationAccuracy132] = trainClassifier132(trainingData);
testingData_fitlabs132 = trainedClassifier132.predictFcn(testingData(:,1:end-1));
testingData_truelabs132 = testingData(:,end);
testingData_accuracy132 = sum(testingData_fitlabs132 == testingData_truelabs132)/sum(istest)
[trainedClassifier133, validationAccuracy133] = trainClassifier133(trainingData);
testingData_fitlabs133 = trainedClassifier133.predictFcn(testingData(:,1:end-1));
testingData_truelabs133 = testingData(:,end);
testingData_accuracy133 = sum(testingData_fitlabs133 == testingData_truelabs133)/sum(istest)
[trainedClassifier134, validationAccuracy134] = trainClassifier134(trainingData);
testingData_fitlabs134 = trainedClassifier134.predictFcn(testingData(:,1:end-1));
testingData_truelabs134 = testingData(:,end);
testingData_accuracy134 = sum(testingData_fitlabs134 == testingData_truelabs134)/sum(istest)
[trainedClassifier135, validationAccuracy135] = trainClassifier135(trainingData); 
testingData_fitlabs135 = trainedClassifier135.predictFcn(testingData(:,1:end-1));
testingData_truelabs135 = testingData(:,end);
testingData_accuracy135 = sum(testingData_fitlabs135 == testingData_truelabs135)/sum(istest)
clearvars -except ...
    testingData_accuracy11 testingData_accuracy12 testingData_accuracy13 testingData_accuracy14 testingData_accuracy15...
    testingData_accuracy21 testingData_accuracy22 testingData_accuracy23 testingData_accuracy24 testingData_accuracy25...
    testingData_accuracy31 testingData_accuracy32 testingData_accuracy33 testingData_accuracy34 testingData_accuracy35...
    testingData_accuracy41 testingData_accuracy42 testingData_accuracy43 testingData_accuracy44 testingData_accuracy45...
    testingData_accuracy51 testingData_accuracy52 testingData_accuracy53 testingData_accuracy54 testingData_accuracy55...
    testingData_accuracy61 testingData_accuracy62 testingData_accuracy63 testingData_accuracy64 testingData_accuracy65...
    testingData_accuracy71 testingData_accuracy72 testingData_accuracy73 testingData_accuracy74 testingData_accuracy75...
    testingData_accuracy81 testingData_accuracy82 testingData_accuracy83 testingData_accuracy84 testingData_accuracy85...
    testingData_accuracy91 testingData_accuracy92 testingData_accuracy93 testingData_accuracy94 testingData_accuracy95...
    testingData_accuracy101 testingData_accuracy102 testingData_accuracy103 testingData_accuracy104 testingData_accuracy105...
    testingData_accuracy111 testingData_accuracy112 testingData_accuracy113 testingData_accuracy114 testingData_accuracy115...
    testingData_accuracy121 testingData_accuracy122 testingData_accuracy123 testingData_accuracy124 testingData_accuracy125...
    testingData_accuracy131 testingData_accuracy132 testingData_accuracy133 testingData_accuracy134 testingData_accuracy135
toc;

testingData_accuracy_all=[[testingData_accuracy11;testingData_accuracy12;testingData_accuracy13;testingData_accuracy14;testingData_accuracy15],...
    [testingData_accuracy21;testingData_accuracy22;testingData_accuracy23;testingData_accuracy24;testingData_accuracy25],...
    [testingData_accuracy31;testingData_accuracy32;testingData_accuracy33;testingData_accuracy34;testingData_accuracy35],...
    [testingData_accuracy41;testingData_accuracy42;testingData_accuracy43;testingData_accuracy44;testingData_accuracy45],...
    [testingData_accuracy51;testingData_accuracy52;testingData_accuracy53;testingData_accuracy54;testingData_accuracy55],...
    [testingData_accuracy61;testingData_accuracy62;testingData_accuracy63;testingData_accuracy64;testingData_accuracy65],...
    [testingData_accuracy71;testingData_accuracy72;testingData_accuracy73;testingData_accuracy74;testingData_accuracy75],...
    [testingData_accuracy81;testingData_accuracy82;testingData_accuracy83;testingData_accuracy84;testingData_accuracy85],...
    [testingData_accuracy91;testingData_accuracy92;testingData_accuracy93;testingData_accuracy94;testingData_accuracy95],...
    [testingData_accuracy101;testingData_accuracy102;testingData_accuracy103;testingData_accuracy104;testingData_accuracy105],...
    [testingData_accuracy111;testingData_accuracy112;testingData_accuracy113;testingData_accuracy114;testingData_accuracy115],...
    [testingData_accuracy121;testingData_accuracy122;testingData_accuracy123;testingData_accuracy124;testingData_accuracy125],...
    [testingData_accuracy131;testingData_accuracy132;testingData_accuracy133;testingData_accuracy134;testingData_accuracy135]];
openvar('testingData_accuracy_all');
