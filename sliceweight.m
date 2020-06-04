function [SLC_Model_All,SLC_Model_All_SMARwit] = sliceweight(SLC_Model_DIS1,SLC_Model_DIS2,SLC_Model_DIS3)
SLC_Model_num = nargin;
SLC_Point_num = size(SLC_Model_DIS1,1);
SLC_Model_All = cat(3,SLC_Model_DIS1,SLC_Model_DIS2,SLC_Model_DIS3);
for idx = 1:SLC_Model_num
    DIST_str = SLC_Model_All{1,2,idx}; DIST_STR{idx} = [upper(DIST_str(1)),lower(DIST_str(2:end))];
end
load('colormap.mat','color_red','color_green','color_blue');

figure('Color',[1 1 1]); hold on;
Color_lst = [color_red; color_green; color_blue];
for idx = 1:SLC_Model_num
    plot([SLC_Model_All{:,6,idx}],'-','color',Color_lst(idx,:),'LineWidth',2);
    plot([SLC_Model_All{:,5,idx}],':','color',Color_lst(idx,:),'LineWidth',2);
end
grid on; grid minor; box on; 

for idx = 1:SLC_Model_num
    LEGEND_cellstr{1,idx} = [upper(DIST_STR{idx}),' / TESTING'];
    LEGEND_cellstr{2,idx} = [upper(DIST_STR{idx}),' / TRAINING'];
end
LEGEND_cellstr = LEGEND_cellstr(:)';
legend(LEGEND_cellstr,'Location','southwest','Orientation','vertical','FontSize',10); legend('boxoff');

% xlabel('Slice Points for Data','FontSize',12); ylabel('Accuracy of Models','FontSize',12);
title('Accuracy of Models on Slice Points','FontSize',12);

xlim_minmax = ylim ; set(gca,'xlim',[1-0.25,SLC_Point_num+0.25]);
ylim_minmax = ylim ; set(gca,'ylim',[ylim_minmax(1),ylim_minmax(2)+0.01]);
savefig(gcf,[cd,'\figure\figure41_sliceweight.fig']); saveas(gcf,[cd,'\figure\figure41_sliceweight.bmp']);

SLC_Model_All_SMARwit = zeros(SLC_Model_num,SLC_Point_num);
for n = 1:SLC_Point_num
    for m = 1:SLC_Model_num
        SLC_Model_DIS_Awt{m} = SLC_Model_All{n,5,m}*0.2 + SLC_Model_All{n,6,m}*0.8;
    end
    
    for m = 1:SLC_Model_num
        SLC_Model_DIS_Adf{m} = abs(SLC_Model_All{n,5,m} -  SLC_Model_All{n,6,m});
    end
    SLC_Model_All_AdfSum = sum(cell2mat(SLC_Model_DIS_Adf));
    if SLC_Model_All_AdfSum==0,SLC_Model_All_AdfSum = SLC_Model_All_AdfSum+eps; end
    for m = 1:SLC_Model_num
        if SLC_Model_DIS_Adf{m}/SLC_Model_All_AdfSum < 0.9
            SLC_Model_DIS_AdfNml{m} = SLC_Model_DIS_Adf{m}/SLC_Model_All_AdfSum;
        else SLC_Model_DIS_AdfNml{m} = 0.9;
        end
    end
    
    for m = 1:SLC_Model_num
        SLC_Model_DIS_SMARwit{m} = SLC_Model_DIS_Awt{m}+log10(1-SLC_Model_DIS_AdfNml{m})/100;
    end
    SLC_Model_All_SMARwit(:,n) = cell2mat(SLC_Model_DIS_SMARwit');
    clear SLC_Model_DIS_Awt SLC_Model_DIS_Adf SLC_Model_All_AdfSum SLC_Model_DIS_AdfNml SLC_Model_DIS_SMARwit
 end

figure('Color',[1 1 1]); 
for idx = 1:SLC_Model_num
    subplot(SLC_Model_num,1,idx);
    heatmap([cell2mat(SLC_Model_All(:,5,idx))'; cell2mat(SLC_Model_All(:,6,idx))'; SLC_Model_All_SMARwit(idx,:)]);
    title(['SLC_Model_',DIST_STR{idx}]);
end
savefig(gcf,[cd,'\figure\figure42_sliceweight.fig']);
saveas(gcf,[cd,'\figure\figure42_sliceweight.bmp']);

evalin('base','clearvars in_X_SLC');
evalin('base','clearvars -regexp ^SLC_Model_DIS');

