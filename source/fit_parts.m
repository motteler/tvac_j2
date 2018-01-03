%
% fit_parts -- run fit_tran on obs partitions
%

% libs from ccast and airs_decon
addpath /home/motteler/cris/ccast/source
addpath /home/motteler/cris/ccast/motmsc/utils
addpath /home/motteler/cris/airs_decon/test

% set run parameters
band = 'LW';                     % set the band
wlaser = 774.8298;               % reference wlaser
sdir = 0;                        % sweep direction
sfile = 'SRF_exel_S1_LW.mat';    % SRF matrix set
afile = 'abs21.mat';             % tabulated absorptions
abswt = 1.259;                   % absorption scale factor
qv1 = 672; qv2 = 705;            % fitting interval

% cmp_tran opt params
opt = struct;
opt.sfile = sfile;
opt.afile = afile;
opt.abswt = abswt;
opt.qv1   = qv1;
opt.qv2   = qv2;

% get the interferograms
igm_ET1 = read_igm('ET1new', sdir);
igm_ET2 = read_igm('ET2new', sdir);
igm_FT1 = read_igm('FT1new', sdir);
igm_FT2 = read_igm('FT2new', sdir);

% option to take subsets
igm_ET1 = igm_ET1(:, :, 67:396);
igm_ET2 = igm_ET2(:, :, 18:347);
igm_FT1 = igm_FT1(:, :, 18:347);
igm_FT2 = igm_FT2(:, :, 18:347);

% run name
rname = 'CO2_Sep_2013';
pname = strrep(rname, '_', ' ');

% set the search grid
wgrid = -0.02 : 0.0002 : 0.015; 
% wgrid = -0.02 : 0.0005 : 0.015; 
waxis = wlaser + wgrid;
vaxis = 1e7./waxis;
wppm = 1e6* wgrid ./ wlaser;

% set up the obs partitions
wall = [];
igm = struct;
n = 330;     % total number of obs
f = 11;      % number of partitions (must divide n)
s = n / f;

% loop on obs partitions
for i = 1 : f
  j = (i - 1) * s + 1;
  k = j + s -1;

  % test subsets
  igm.ET1 = igm_ET1(:, :, j:k);
  igm.ET2 = igm_ET2(:, :, j:k);
  igm.FT1 = igm_FT1(:, :, j:k);
  igm.FT2 = igm_FT2(:, :, j:k);

  [dr, fmsc] = fit_tran(band, waxis, igm, opt);

  % show residuals
  [tmin, imin] = min(dr);
  wmin = wppm(imin);
  fprintf(1, '%3d', i); fprintf(1, '%7.2f', wmin); fprintf(1, '\n');

  wall = [wall; wmin];
end

