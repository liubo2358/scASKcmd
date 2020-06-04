function [in_X_SLC_diff,in_X_SLC_SRCIstd,slice_bst,slice_vle] = slicediffer(in_X_SLC,slice_tik,slice_wnt)
if nargin == 2, slice_wnt = 9; end
slice_wnt = slice_wnt-1;
load('colormap.mat','in_X_Colormap','color_red','color_blue');

slice_num = length(slice_tik);
in_X_SLC_diff_temp = zeros(size(in_X_SLC,1),1);
in_X_SLC_diff = repmat(in_X_SLC_diff_temp,[1,slice_num-1]);
for m = 1:slice_num-1
    in_X_SLC_diff_temp = sum(abs(in_X_SLC(:,:,m+1)-in_X_SLC(:,:,m)),2);   
    in_X_SLC_diff(:,m) = in_X_SLC_diff_temp;
end

f1 = figure('Color',[1 1 1]);
imagesc(in_X_SLC_diff);
f1a1 = f1.CurrentAxes;
colormap(f1a1,in_X_Colormap); colorbar;
set(f1a1,'xtick',1:slice_num-1);
title(f1a1,'Growth Increment with Scaled Colors','FontSize',12);
savefig(f1,[cd,'\figure\figure21_slicediffer.fig']);
saveas(f1,[cd,'\figure\figure21_slicediffer.bmp']);

in_X_SLC_diff_std = std(in_X_SLC_diff);
[in_X_SLC_diff_std_sort,sorted_idx] = sort(in_X_SLC_diff_std,'descend');
selected_idx = sort(sorted_idx(1:slice_wnt));

f2 = figure('Color',[1 1 1]);
plot(in_X_SLC_diff_std,'-ko','LineWidth',0.5,'MarkerFaceColor',color_blue); hold on;
f2a1 = f2.CurrentAxes;
stem(f2a1,sorted_idx(1:slice_wnt),in_X_SLC_diff_std_sort(1:slice_wnt),'filled','Color',color_red,'LineWidth',1);
set(f2a1,'xtick',1:slice_num-1); grid on;
title(f2a1,'Slice Points with More Increment','FontSize',12);
savefig(f2,[cd,'\figure\figure22_slicediffer.fig']);
saveas(f2,[cd,'\figure\figure22_slicediffer.bmp']);

in_X_SLC_SRCIstd = [in_X_SLC_diff_std_sort;sorted_idx;slice_tik(sorted_idx+1)];
slice_bst = [1,selected_idx+1];
fprintf(2,'%% Slice Points Selected: %s\n',strspc2cma(slice_bst));
slice_vle = slice_tik(slice_bst);
fprintf(2,'%% Slice Values Selected: %s\n',strspc2cma(slice_vle));


function output_str = strspc2cma(input_str)
input_str_cell = cellstr(num2str(input_str'));
input_str_cell_strip = strip(input_str_cell)';
input_str_cell_strip_join = strjoin(input_str_cell_strip);
output_str = strrep(input_str_cell_strip_join,' ',', ');

