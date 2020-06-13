
addpath /home/motteler/matlab/export_fig

clear all
close all
textfont = 11;
axisfont = 11;;

dlist = {'harvest_02-05', 'harvest_02-11', ...
         '02-11_mn_s1_CO2', '02-05_mn_s2_CO2', ...
         '02-11_mn_s1_CH4', '02-12_mn_s1_CO'}

for j = 1 : length(dlist)
  flist =  dir(fullfile(dlist{j}, '*.fig'));
  for i = 1 : length(flist)
    [~,ftmp] = fileparts(flist(i).name);
    ffig = fullfile(flist(i).folder, [ftmp,'.fig']);
    fpdf = fullfile(flist(i).folder, [ftmp,'.pdf']);
    open(ffig)
    set(gcf, 'Units','pixels', 'Position', [200, 650, 560, 420])
    set(findall(gcf,'type','axes'), 'fontsize', axisfont)
    set(findall(gcf,'type','text'), 'fontSize', textfont)
    export_fig(fpdf, '-transparent') 
    pause(2)
    close all
  end
end

