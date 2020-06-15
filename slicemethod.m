function [SLC_Model_DISx,istrain,istest] = slicemethod(in_X_SLC,true_labs,slice_tik,slice_bst,K_nb,dist_df,dist_wt,N_fold)
if nargin == 4, K_nb = 1; dist_df = 'correlation'; dist_wt = 'inverse'; N_fold = 5; end
if nargin == 5, dist_df = 'correlation'; dist_wt = 'inverse'; N_fold = 5; end
if nargin == 6, dist_wt = 'inverse'; N_fold = 5; end
if nargin == 7, N_fold = 5; end

slice_num = length(slice_bst);
rng('default');
part = cvpartition(true_labs,'Holdout',0.2);
istrain = training(part);
istest = test(part);

switch dist_df
    case 'correlation',disp('######################## KNN+CORRELATION ########################');
    case 'jaccard',    disp('########################## KNN+JACCARD ##########################');
    case 'cosine',     disp('########################### KNN+COSINE ##########################');
    otherwise,         disp('########################## KNN+NEWDIST ##########################');
end

disp('### Section I:  the classes DISTRIBUTION for training dataset ###');
tabulate(true_labs(istrain))
class_proportion = tabulate(true_labs(istrain));
if min(class_proportion(:,3)) < 0.5, warning('The training dataset is serious imbalance !'); end

disp('### Section II:  the MULTICYCLE of model training is starting ###');

SLC_Model_DISx = num2cell(zeros(slice_num,6));
cycle_num = 1;
h = waitbar(0,['The Progress of ',upper(dist_df(1)),lower(dist_df(2:end))]);
set (h, 'position', [842 72 270 50]); 
for idx = slice_bst
    tic;
    waitbar(cycle_num/slice_num);
    fprintf('Step %d.1: the TRAINING cycle for slc_model_%d is launching ...\n',cycle_num,idx)
        
    in_X = in_X_SLC(:,:,idx);
    slc_Model = fitcknn(in_X(istrain,:),true_labs(istrain),'NumNeighbors',K_nb,'NSMethod','exhaustive','Distance',dist_df,...
        'DistanceWeight',dist_wt,'Standardize',1); 
    slc_Model_cv = crossval(slc_Model,'kfold',N_fold);
    Yfit_ts = predict(slc_Model,in_X(istest,:));
    
    fprintf('Step %d.2: the ACCURACY of slc_model_%d is computing ...\n',cycle_num,idx)
    
    slc_Model_Atr = 1-kfoldLoss(slc_Model_cv);
    slc_Model_Ats = sum(Yfit_ts==true_labs(istest))/part.TestSize;        
    
    fprintf('     the slc_Model_%d training accuracy = %.2f%%\n',idx,slc_Model_Atr*100);
    fprintf('     the slc_Model_%d testing  accuracy = %.2f%%\n',idx,slc_Model_Ats*100);    
    fprintf('Step %d.3: the training TIME for slc_model_%d = %.2f seconds\n',cycle_num,idx,toc);
    
    SLC_Model_DISx{cycle_num,1} = slc_Model;
    SLC_Model_DISx{cycle_num,2} = dist_df;
    SLC_Model_DISx{cycle_num,3} = idx;
    SLC_Model_DISx{cycle_num,4} = slice_tik(idx);
    SLC_Model_DISx{cycle_num,5} = slc_Model_Atr;
    SLC_Model_DISx{cycle_num,6} = slc_Model_Ats;
        
    cycle_num = cycle_num + 1;
        
end
close(h);
disp('### Section III: the MULTICYCLE of model training is over now ###');
disp('####################### TRAINING FINISHED #######################');

