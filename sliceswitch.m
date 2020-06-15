function [SLC_Model_MOD,SLC_Model_All_SMESmod] = sliceswitch(SLC_Model_All,SLC_Model_All_SMARwit,Ensemble_mod,Switch_num)
SLC_Model_num = size(SLC_Model_All,3);
slice_num = size(SLC_Model_All_SMARwit,2);
if nargin==3&&strcmp(Ensemble_mod,'rws'), Switch_num = SLC_Model_num-1; end
if nargin==3&&strcmp(Ensemble_mod,'abs'), Switch_num = slice_num; end

switch Ensemble_mod
    case 'rws'
        if Switch_num>SLC_Model_num, Switch_num = SLC_Model_num; end
        
        SMARwit = SLC_Model_All_SMARwit;
        x = []; y = [];
        for n = 1:slice_num
            [wit_best,wit_posi] = sort(SMARwit(:,n),'descend');
            for m = 1:SLC_Model_num
                if m <= Switch_num, SMARwit(wit_posi(m),n) = m;
                else, SMARwit(wit_posi(m),n) = 0; end
            end
            x = [x;wit_posi(1:Switch_num)]; y = [y;repmat(n,Switch_num,1)];
        end
        
        SLC_Model_All_SMESrws = SMARwit;
        clear SMARwit
        
        SLC_Model_RWS = num2cell(zeros(Switch_num,slice_num));
        SLC_Points_USE = num2cell(zeros(Switch_num,slice_num));
        for n = 1:slice_num
            for m = 1:Switch_num
                SLC_Model_RWS{m,n} = SLC_Model_All{y(m+Switch_num*(n-1)),1,x(m+Switch_num*(n-1))};
                SLC_Points_USE{m,n} = sub2ind(size(SLC_Model_All_SMARwit),x(m+Switch_num*(n-1)),y(m+Switch_num*(n-1)));
            end
        end
               
        SLC_Model_RWS_ACY = num2cell(zeros(Switch_num,slice_num));
        for m = 1:Switch_num
            SLC_Model_RWS_ACY(m,:) = num2cell(sum(double(SLC_Model_All_SMESrws == m).*SLC_Model_All_SMARwit));
        end
        
        SLC_Model_RWS = cat(3,SLC_Model_RWS,SLC_Model_RWS_ACY,SLC_Points_USE);
        SLC_Model_MOD = SLC_Model_RWS;
        SLC_Model_All_SMESmod = SLC_Model_All_SMESrws;
        
    case 'abs'
        if Switch_num>slice_num, Switch_num = slice_num; end
        
        SMARwit = SLC_Model_All_SMARwit;
        [wit_best,wit_posi] = sort(SMARwit(:),'descend');
        SMARwit = zeros(SLC_Model_num,slice_num);
        for idx = 1:Switch_num, SMARwit(wit_posi(idx)) = idx; end  
             
        SLC_Model_All_SMESabs = SMARwit;
        clear SMARwit;
        
        SLC_Model_ABS = num2cell(zeros(1,slice_num));
        SLC_Points_USE = num2cell(zeros(1,slice_num));
        for n = 1:slice_num
            [x,y] = ind2sub(size(SLC_Model_All_SMARwit),wit_posi(n));
            SLC_Model_ABS{n} = SLC_Model_All{y,1,x};
            SLC_Points_USE{n} = wit_posi(n);
        end
        
        SLC_Model_ABS = cat(3,SLC_Model_ABS,num2cell(wit_best(1:slice_num)'),SLC_Points_USE);
        SLC_Model_MOD = SLC_Model_ABS(:,1:Switch_num,:);
        SLC_Model_All_SMESmod = SLC_Model_All_SMESabs;        
end

switch Ensemble_mod
    case 'rws'
        f1 = figure('Color',[1 1 1]);
        subplot(2,1,1); heatmap(SLC_Model_All_SMARwit); title('SLC_Model_All_SMARwit');
        subplot(2,1,2); heatmap(SLC_Model_All_SMESrws); colorbar off; title('SLC_Model_RWS');
        savefig(f1,[cd,'\figure\figure51_sliceswitch.fig']);
        saveas(gcf,[cd,'\figure\figure51_sliceswitch.bmp']);
        
    case 'abs'
        f2 = figure('Color',[1 1 1]);
        subplot(2,1,1); heatmap(SLC_Model_All_SMARwit); title('SLC_Model_All_SMARwit');
        subplot(2,1,2); heatmap(SLC_Model_All_SMESabs); colorbar off; title('SLC_Model_ABS');
        savefig(f2,[cd,'\figure\figure52_sliceswitch.fig']);
        saveas(gcf,[cd,'\figure\figure52_sliceswitch.bmp']);
end

