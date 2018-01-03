%
% mkSAexel -- build SA matrices for Exelis focal planes
%

%------------------------
% Exelis fall 2013 specs
%------------------------

% side 1 x-y relative, in urad
s1 = [
1    19227    19227  
2        0    18944
3   -19045    19045
4    19204        0
5       0         0
6   -19211        0
7    19176   -19176
8        0   -18942
9   -19409   -19409
];

% side 1 fov 5 offset, in urad
d1 = [-567  294];

% absolute off axis angles, in rad
foax1 = sqrt((s1(:,2) + d1(1)).^2 + (s1(:,3) + d1(2)).^2) ./ 1e6;

% side 2 x-y relative, in urad
s2 = [
1    18953    18953
2        0    18765
3   -18725    18725
4    18560        0
5        0        0
6   -18563        0
7    18655   -18655
8        0   -18764
9   -19015   -19015
];

% side 2 fov 5 offset, in urad
d2 = [-712 117];

% absolute off axis angles, in rad
foax2 = sqrt((s2(:,2) + d2(1)).^2 + (s2(:,3) + d2(2)).^2) ./ 1e6;

% fov radius, in rad
frad = ones(9,1) *  16808 / 2e6;

%------------------------------
% build the SA inverse matrices
%-------------------------------

more off
addpath /asl/packages/ccast/source

% inst_params options
opts = struct;
opts.version = 'jpss1';
opts.resmode = 'hires2';
opts.addguard = 'false';

% use exelis focal plane
opts.frad = frad;
opts.foax = foax1;

% newILS options
opts.wrap = 'psinc n';

% nominal wlaser value
wlaser = 773.1307;

% build the SA inverse matrices
sfile = 'SAinv_exel_Pn_ng_LW.mat';
mkSAinv('LW', wlaser, sfile, opts);

sfile = 'SAinv_exel_Pn_ng_MW.mat';
mkSAinv('MW', wlaser, sfile, opts);

sfile = 'SAinv_exel_Pn_ng_SW.mat';
mkSAinv('SW', wlaser, sfile, opts);
