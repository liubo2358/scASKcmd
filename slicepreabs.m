function [SLC_Model_FIT,FIT_accuracy] = slicepreabs(in_X_new,true_labs_new,binary_mod,class_num,slice_vle,SLC_Model_ABS)
if isempty(true_labs_new), accuracy_tag = 'off'; else, accuracy_tag = 'on'; end
Switch_num = size(SLC_Model_ABS,2);

in_X_new_slc_temp = zeros(size(in_X_new,1),size(in_X_new,2));
in_X_new_slc = repmat(in_X_new_slc_temp,[1,1,length(slice_vle)]);
for m = 1:length(slice_vle)
    switch binary_mod
        case '01', in_X_new_slc(:,:,m) = double(in_X_new > slice_vle(m));
        case '10', in_X_new_slc(:,:,m) = double(~(in_X_new > slice_vle(m)));
    end    
end

true_labs_Fit = num2cell(zeros(1,Switch_num));
for n = 1:Switch_num
    slice_ordr = ceil(SLC_Model_ABS{1,n,3}/3);
    true_labs_fit = predict(SLC_Model_ABS{1,n,1},in_X_new_slc(:,:,slice_ordr));
    true_labs_Fit{1,n} = numclass2mat(true_labs_fit,class_num,'row');
end

true_labs_FIT = zeros(size(in_X_new,1),class_num);
for n = 1:Switch_num
    true_labs_FIT = true_labs_FIT + SLC_Model_ABS{1,n,2}.*true_labs_Fit{1,n};
end

[true_labs_FIT_max,SLC_Model_FIT] = max(true_labs_FIT,[],2);
true_labs_FIT_Trust = true_labs_FIT_max./sum(true_labs_FIT,2);
SLC_Model_FIT = [SLC_Model_FIT,true_labs_FIT_Trust];

if strcmp(accuracy_tag,'on')
    true_labs_FIT_Accuracy = sum(SLC_Model_FIT(:,1)==true_labs_new)/length(true_labs_new);
    accuracy_str = ['% the Accuracy of SLC_Model_ABS on Testing Dataset is: ',num2str(true_labs_FIT_Accuracy*100),'%'];
    fprintf(2,['%',accuracy_str,'%','\n']);
    f1 = figure('Color',[1 1 1]);
    plotconfusion(numclass2mat(SLC_Model_FIT(:,1),class_num,'col'),numclass2mat(true_labs_new,class_num,'col'));
    f1a1 = f1.CurrentAxes;
    set(f1,'unit','centimeters','position',[8,2,20,19]);
    title('Confusion Matix of SLC\_Model\_ABS'); retouchcfm(f1,f1a1);
    savefig(f1,[cd,'\figure\figure62_slicepreabs.fig']);
    saveas(f1,[cd,'\figure\figure62_slicepreabs.bmp']);
end

[y,Fs] = audioread('finished.wav'); sound(y,Fs); clear y Fs;

if strcmp(accuracy_tag,'on'), FIT_accuracy = true_labs_FIT_Accuracy; else, FIT_accuracy = 0; end


function M = numclass2mat(N,class_num,direction_tag)
M_pattern = eye(class_num);
switch direction_tag
    case 'col'
        M=[]; for idx = 1:length(N), M = [M,M_pattern(:,N(idx))]; end
    case 'row'
        M=[]; for idx = 1:length(N), M = [M;M_pattern(N(idx),:)]; end
end


function retouchcfm(f1,f1a1) % only work for matlab 2017a
set(findobj(f1,'facecolor',[128,128,128]/256),'facecolor',[149,179,215]/256);
set(findobj(f1,'facecolor',[120,230,180]/255),'facecolor',[149,179,215]/256);
set(findobj(f1,'facecolor',[230,140,140]/255),'facecolor',[218,150,148]/256);
set(findobj(f1,'facecolor',[120,150,230]/255),'facecolor',[155,229,167]/256);

set(findobj(f1a1,'type','text'),'fontsize',11);
set(findobj(f1a1,'color',[0,102,0]/255),'color',[0,0,0]/256);
set(findobj(f1a1,'color',[102,0,0]/255),'color',[0,0,0]/256);

