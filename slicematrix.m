function [in_X_SLC,class_num,slice_tik,binary_mod] = slicematrix(in_X,true_labs,slice_mod,binary_mod)
if nargin == 2, slice_mod = 0; binary_mod ='01'; end
if nargin == 3, binary_mod ='01'; end
slice_num = length(slice_mod);
class_num = numel(unique(true_labs));
load('colormap.mat','in_X_Colormap','color_red','color_blue');

evalin('base','clearvars -except in_X true_labs Genes t');
if exist([cd,'\figure'],'dir')==7, disp('All Figures Will be Deleted in matlab\figure'); end
if exist([cd,'\figure'],'dir')==7, delete('figure\*.bmp','figure\*.fig','figure\*.mat'); end
if exist([cd,'\figure'],'dir')==0, mkdir figure; end
disp('New Figures Will be Saved to matlab\figure...');
winopen([cd,'\figure']);

if issparse(in_X), in_X = full(in_X); end
if isa(in_X,'single'), in_X = double(in_X); end
if nnz(isnan(in_X))>0, in_X(isnan(in_X))=0; end
assignin('base','in_X',in_X);
if isrow(true_labs), true_labs = true_labs'; end
if isa(true_labs,'numeric') 
    class_tags = unique(true_labs); true_vles = zeros(size(true_labs));
    for idx = 1:numel(class_tags), true_vles = true_vles+idx*(true_labs==class_tags(idx)); end
    true_labs = true_vles;
end
if isa(true_labs,'cell')
    class_tags = unique(true_labs); true_vles = zeros(size(true_labs));
    for idx = 1:numel(class_tags), true_vles = true_vles+idx*strcmp(true_labs,class_tags{idx}); end
    true_labs = true_vles;
end
assignin('base','true_labs',true_labs);

f1 = figure('Color',[1 1 1]);
imagesc(in_X); f1a1 = f1.CurrentAxes;
% set(f1,'outerposition',get(0,'screensize'));
colormap(f1a1,in_X_Colormap); colorbar;
set(f1a1,'xtick',fix(linspace(0,size(in_X,2),8)));
set(f1a1,'ytick',fix(linspace(0,size(in_X,1),6)));
title(f1a1,'Global View of Data with Scaled Colors','FontSize',12);
savefig(f1,[cd,'\figure\figure11_slicematrix.fig']);
saveas(f1,[cd,'\figure\figure11_slicematrix.bmp']);

f2 = figure('Color',[1 1 1]);
in_X_z = double(in_X~=0); subplot(1,10,1);
f2h1 = histogram(in_X_z,2,'FaceColor',color_blue,'Normalization','probability');
bar_tck = f2h1.BinEdges(1:end-1)+0.5*diff(f2h1.BinEdges);
f2a1 = f2.CurrentAxes;
set(f2a1,'xtick',bar_tck,'xticklabel',{'z','nz'});
ytick2percent(f2a1);

X = f2h1.BinEdges(1); Y=0;
W = f2h1.BinEdges(2)-f2h1.BinEdges(1); H = f2h1.Values(1);
rectangle('position',[X,Y,W,H],'FaceColor',color_red,'LineStyle','none');

in_X_nz = in_X(in_X~=0); subplot(1,10,3:10);
histogram(in_X_nz,slice_num,'FaceColor',color_blue,'Normalization','probability');
% bar_tck = f2h2.BinEdges(1:end-1)+0.5*diff(f2h2.BinEdges);
f2a2 = f2.CurrentAxes;
% set(f2a2,'xtick',bar_tck,'xticklabelrotation',90);
% set(f2,'outerposition',get(0,'screensize'));
ytick2percent(f2a2);

zeroes_rate = 1-nnz(in_X)/numel(in_X);
f2t1 = suptitle(sprintf('Distribution of Data Excluding %2.4f%% Zero Values',zeroes_rate*100));
set(f2t1,'FontSize',12,'FontWeight','normal');
savefig(f2,[cd,'\figure\figure12_slicematrix.fig']);
saveas(f2,[cd,'\figure\figure12_slicematrix.bmp']);

f3 = figure('Color',[1 1 1]);
histogram(true_labs,'FaceColor',color_blue,'Normalization','probability');
f3a1 = f3.CurrentAxes;
set(f3a1,'xtick',1:1:class_num);
% set(f3,'outerposition',get(0,'screensize'));
ytick2percent(f3a1);

hold on; x = [0,class_num+1]; y = [0.005,0.005];
line(x,y,'Color',color_red,'LineStyle','-','LineWidth',1);
f3a1_YTick_new = [f3a1.YTick(1),0.005,f3a1.YTick(2:end)];
f3a1_YTickLabel_new = [cellstr(' ');cellstr('0.50%');f3a1.YTickLabel(2:end)];
set(f3a1,'YTick',f3a1_YTick_new,'YTickLabel',f3a1_YTickLabel_new);

title(f3a1,sprintf('Distribution of Data on %d Classes',class_num),'FontSize',12);
savefig(f3,[cd,'\figure\figure13_slicematrix.fig']);
saveas(f3,[cd,'\figure\figure13_slicematrix.bmp']);

in_X_temp = zeros(size(in_X,1),size(in_X,2));
in_X_SLC = repmat(in_X_temp,[1,1,slice_num]);
for idx = 1:slice_num
    switch binary_mod
        case '01', in_X_temp = double(in_X > slice_mod(idx));
        case '10', in_X_temp = double(~(in_X > slice_mod(idx)));
    end
    in_X_SLC(:,:,idx) = in_X_temp;
end

slice_tik = slice_mod;


function ytick2percent(fxax)
yticks_seq = fxax.YTick; yticks_percent = num2cell(zeros(1,length(yticks_seq)));
for n=1:length(yticks_seq), yticks_percent{n} = sprintf('%2.2f%%',yticks_seq(n)*100); end
set(fxax,'YTickLabel',yticks_percent);

