% Please note that: Running these codes will last from minutes to tens of minutes for outputting 
% the results of Quadratic SVM, Bagged Trees and scASK on 13 real single-cell datasets with data perturbation. 
% Due to the built-in cross validation or random resampling of some algorithms (such as Bagged Trees), 
% the running result may be slightly different from figure 7. For results without data perturbation, see figure 6
disp('###### Results of Quadratic SVM, Bagged Trees and scASK on the Tasic dataset with data perturbation ######')
tic;
load('MPSSC\Data_Tasic.mat'); true_labs = true_labs-double(true_labs>25);
warning off; rng('default');

in_X_ratio = in_X;
in_X_ratio(in_X>0) = randperm(sum(sum(in_X>0)))'; 
in_X_zeros = in_X_ratio>0.1*sum(sum(in_X>0)); %randomly replacing the 10% non-zero elements with zeros
in_X = in_X.*in_X_zeros;

[in_X_SLC,class_num,slice_tik,binary_mod] = slicematrix(in_X,true_labs,0:0.1:3);
[in_X_SLC_diff,in_X_SLC_SRCIstd,slice_bst,slice_vle] = slicediffer(in_X_SLC,slice_tik,6);
[SLC_Model_DIS1,istrain,istest] = slicemethod(in_X_SLC,true_labs,slice_tik,slice_bst,1,'correlation','inverse',3);
[SLC_Model_DIS2,istrain,istest] = slicemethod(in_X_SLC,true_labs,slice_tik,slice_bst,1,'jaccard','inverse',3);
[SLC_Model_DIS3,istrain,istest] = slicemethod(in_X_SLC,true_labs,slice_tik,slice_bst,1,'cosine','inverse',3);
[SLC_Model_All,SLC_Model_All_SMARwit] = sliceweight(SLC_Model_DIS1,SLC_Model_DIS2,SLC_Model_DIS3);
[SLC_Model_RWS,SLC_Model_All_SMESrws] = sliceswitch(SLC_Model_All,SLC_Model_All_SMARwit,'rws',2);
[SLC_Model_ABS,SLC_Model_All_SMESabs] = sliceswitch(SLC_Model_All,SLC_Model_All_SMARwit,'abs',9);
[SLC_Model_FIT1,FIT1_accuracy] = sliceprerws(in_X(istest,:),true_labs(istest),binary_mod,class_num,slice_vle,SLC_Model_RWS);
[SLC_Model_FIT2,FIT2_accuracy] = slicepreabs(in_X(istest,:),true_labs(istest),binary_mod,class_num,slice_vle,SLC_Model_ABS);
testingData_accuracy106_rz = max(FIT1_accuracy,FIT2_accuracy);
fprintf(2,['testingData_accuracy106_rz = ',num2str(testingData_accuracy106_rz),'\n']);
close all;

trainingData = [in_X(istrain,:),true_labs(istrain)];
testingData = [in_X(istest,:),true_labs(istest)];
[trainedClassifier102, validationAccuracy102] = trainClassifier102(trainingData);
testingData_fitlabs102 = trainedClassifier102.predictFcn(testingData(:,1:end-1));
testingData_truelabs102 = testingData(:,end);
testingData_accuracy102_rz = sum(testingData_fitlabs102 == testingData_truelabs102)/sum(istest);
fprintf(2,['testingData_accuracy102_rz = ',num2str(testingData_accuracy102_rz),'\n']);

[trainedClassifier105, validationAccuracy105] = trainClassifier105(trainingData);
testingData_fitlabs105 = trainedClassifier105.predictFcn(testingData(:,1:end-1));
testingData_truelabs105 = testingData(:,end);
testingData_accuracy105_rz = sum(testingData_fitlabs105 == testingData_truelabs105)/sum(istest);
fprintf(2,['testingData_accuracy105_rz = ',num2str(testingData_accuracy105_rz),'\n']);
clearvars -except testingData_accuracy102_rz testingData_accuracy105_rz testingData_accuracy106_rz
save figure710.mat testingData_accuracy102_rz testingData_accuracy105_rz testingData_accuracy106_rz
toc;
