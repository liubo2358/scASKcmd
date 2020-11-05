in_X = readtable('data.csv');
in_X = table2array(in_X(:,2:end));
labels = readtable('labels.csv');
labels = table2array(labels(:,2));

class_tag = unique(labels); true_labs = zeros(size(labels));
for idx = 1:numel(class_tag), true_labs = true_labs+idx*strcmp(labels,class_tag{idx}); end

in_Y = in_X(701:801,:);
in_Y_labs = true_labs(701:801,:);
save PanCan_HiSeq_validate.mat in_Y
save PanCan_HiSeq_validate_labels.mat in_Y_labs
in_X = in_X(1:700,:);
true_labs = true_labs(1:700,:);
save PanCan_HiSeq_train.mat in_Y

load('PanCan_HiSeq_train.mat'); in_X = 0.3*in_X;
[in_X_SLC,class_num,slice_tik,binary_mod] = slicematrix(in_X,true_labs,linspace(0,max(max(in_X)),30));
[in_X_SLC_diff,in_X_SLC_SRCIstd,slice_bst,slice_vle] = slicediffer(in_X_SLC,slice_tik,9);
[SLC_Model_DIS1,istrain,istest] = slicemethod(in_X_SLC,true_labs,slice_tik,slice_bst,1,'correlation','inverse',5);
[SLC_Model_DIS2,istrain,istest] = slicemethod(in_X_SLC,true_labs,slice_tik,slice_bst,1,'jaccard','inverse',5);
[SLC_Model_DIS3,istrain,istest] = slicemethod(in_X_SLC,true_labs,slice_tik,slice_bst,1,'cosine','inverse',5);
[SLC_Model_All,SLC_Model_All_SMARwit] = sliceweight(SLC_Model_DIS1,SLC_Model_DIS2,SLC_Model_DIS3);
[SLC_Model_RWS,SLC_Model_All_SMESrws] = sliceswitch(SLC_Model_All,SLC_Model_All_SMARwit,'rws',2);
[SLC_Model_ABS,SLC_Model_All_SMESabs] = sliceswitch(SLC_Model_All,SLC_Model_All_SMARwit,'abs',9);
[SLC_Model_FIT1,FIT1_accuracy] = sliceprerws(in_X(istest,:),true_labs(istest),binary_mod,class_num,slice_vle,SLC_Model_RWS);
[SLC_Model_FIT2,FIT2_accuracy] = slicepreabs(in_X(istest,:),true_labs(istest),binary_mod,class_num,slice_vle,SLC_Model_ABS);

load('PanCan_HiSeq_validate.mat'); in_Y = 0.3*in_Y;
load('PanCan_HiSeq_validate_labels.mat');

[SLC_Model_FIT3,FIT3_accuracy] = sliceprerws(in_Y,[],binary_mod,class_num,slice_vle,SLC_Model_RWS);
FIT3_accuracy = sum(SLC_Model_FIT3(:,1)==in_Y_labs)/length(in_Y_labs);
accuracy_str = ['% the Accuracy of SLC_Model_RWS on Validation Dataset is: ',num2str(FIT3_accuracy*100),'%'];
fprintf(2,['%',accuracy_str,'%','\n']);

[SLC_Model_FIT4,FIT4_accuracy] = slicepreabs(in_Y,[],binary_mod,class_num,slice_vle,SLC_Model_ABS);
FIT4_accuracy = sum(SLC_Model_FIT4(:,1)==in_Y_labs)/length(in_Y_labs);
accuracy_str = ['% the Accuracy of SLC_Model_ABS on Validation Dataset is: ',num2str(FIT4_accuracy*100),'%'];
fprintf(2,['%',accuracy_str,'%','\n']);

