% this command line version of the scASK is developed with Matlab 2017a and compatible with later releases
load ovariancancer.mat; in_X = obs; true_labs = grp; % not scRNA-seq dataset, just for quick demonstration
clearvars -except in_X true_labs; clc; close all; mkdir figure; delete('figure\*.*'); % reset working environment
t = cputime; diary('figure\scask.txt'); fprintf(2,'%% scASK is launching in a manner similar to Batch Processing\n');

[in_X_SLC,class_num,slice_tik,binary_mod] = slicematrix(in_X,true_labs,0:0.01:0.3);
[in_X_SLC_diff,in_X_SLC_SRCIstd,slice_bst,slice_vle] = slicediffer(in_X_SLC,slice_tik,9);
[SLC_Model_DIS1,istrain,istest] = slicemethod(in_X_SLC,true_labs,slice_tik,slice_bst,5,'correlation','inverse',5);
[SLC_Model_DIS2,istrain,istest] = slicemethod(in_X_SLC,true_labs,slice_tik,slice_bst,5,'jaccard','inverse',5);
[SLC_Model_DIS3,istrain,istest] = slicemethod(in_X_SLC,true_labs,slice_tik,slice_bst,5,'cosine','inverse',5);
[SLC_Model_All,SLC_Model_All_SMARwit] = sliceweight(SLC_Model_DIS1,SLC_Model_DIS2,SLC_Model_DIS3);
[SLC_Model_RWS,SLC_Model_All_SMESrws] = sliceswitch(SLC_Model_All,SLC_Model_All_SMARwit,'rws',2);
[SLC_Model_ABS,SLC_Model_All_SMESabs] = sliceswitch(SLC_Model_All,SLC_Model_All_SMARwit,'abs',9);
[SLC_Model_FIT1,FIT1_accuracy] = sliceprerws(in_X(istest,:),true_labs(istest),binary_mod,class_num,slice_vle,SLC_Model_RWS);
[SLC_Model_FIT2,FIT2_accuracy] = slicepreabs(in_X(istest,:),true_labs(istest),binary_mod,class_num,slice_vle,SLC_Model_ABS);

save('figure\scask.mat','slice_tik','slice_vle','SLC_Model_FIT1','FIT1_accuracy','SLC_Model_FIT2','FIT2_accuracy');
total_time = (cputime-t)/60; fprintf(2,'%% the Total Elapsed CPU time is %.2f Mins\n',total_time); diary off; clear t;
fprintf(2,'%% all Statements and Results were saved in scask.txt and scask.mat\n');