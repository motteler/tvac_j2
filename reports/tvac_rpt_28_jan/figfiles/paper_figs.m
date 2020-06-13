%
% translate fig to pdf files
%

addpath /home/motteler/matlab/export_fig

clear all
close all
textfont = 11;
axisfont = 11;;

% option to select individual figures
flist =  dir('*.fig');
for i = 1 : length(flist)
  [~,fname] = fileparts(flist(i).name);
  fprintf(1, '%2d %s\n', i, fname)
end  
ix = input('fig num, <ret> for all > ');
if ~isempty(ix), flist = flist(ix);, end

% call export_fig for each selected figure
for i = 1 : length(flist)
  [~,fname] = fileparts(flist(i).name);
  open([fname,'.fig'])
  set(gcf, 'Units','pixels', 'Position', [200, 650, 560, 420])
  set(findall(gcf,'type','axes'), 'fontsize', axisfont)
  set(findall(gcf,'type','text'), 'fontSize', textfont)
  export_fig([fname,'.pdf'], '-transparent') 
  pause(2)
  close all
end

