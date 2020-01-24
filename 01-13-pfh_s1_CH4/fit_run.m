%
% fit_run -- set up params, call fit_tran, plot results
%
% updated to get met laser from neon
% set test dir, band, optional subsetting and gas below
%

%----------------
% paths and libs
%----------------

addpath /asl/packages/ccast/source
addpath /asl/packages/ccast/motmsc/utils
addpath /asl/packages/airs_decon/test
addpath ../source

%------------------
% basic run params
%------------------

band = 'MW';      % set the band
test_dir = '.';   % location of test data
sdir = 0;         % sweep direction

% get wlaser from eng and neon
opt2 = struct;
opt2.neonWL = 703.44765;
load(fullfile(test_dir, 'FT2'));
[wlaser, wtime] = metlaser(d1.packet.NeonCal, opt2);

fprintf(1, 'eng neon=%.5f assigned neon=%.5f, wlaser=%.5f\n', ... 
  d1.packet.NeonCal.NeonGasWavelength, opt2.neonWL, wlaser);

% set the search grid
wgrid = -0.02 : 0.0002 : 0.03; 
waxis = wlaser + wgrid;

% run name for plots
pname = 'CH4, 13 Jan 2020 PFH side 1';

%---------------------
% params for fit_tran
%---------------------

opt = struct; 
opt.user_res = 'hires';
opt.inst_res = 'hires2';
opt.MW_sfile = '../inst_data/SAinv_default_HR2_MW.mat';
opt.qv1   = 1220;           % fitting interval start
opt.qv2   = 1380;           % fitting interval end

% gas file and weight
opt.afile = 'run8_44p64_torr_14p85_C.mat';
opt.abswt = 12.69;

%--------------------
% get interferograms
%--------------------

% test data files
mat_et2 = fullfile(test_dir, 'ET2');
mat_et1 = fullfile(test_dir, 'ET1');
mat_ft2 = fullfile(test_dir, 'FT2');
mat_ft1 = fullfile(test_dir, 'FT1');

% load the interferograms
igm = struct;
igm.ET2 = read_igm(band, mat_et2, sdir);
igm.ET1 = read_igm(band, mat_et1, sdir);
igm.FT2 = read_igm(band, mat_ft2, sdir);
igm.FT1 = read_igm(band, mat_ft1, sdir);

% option to take subsets
igm.ET2 = igm.ET2(:, :, 30:340);  % ET2
igm.ET1 = igm.ET1(:, :, 30:340);  % ET1
igm.FT2 = igm.FT2(:, :, 30:340);  % FT2
igm.FT1 = igm.FT1(:, :, 30:340);  % FT1

%---------------
% call fit_tran
%---------------

[drms, fmsc] = fit_tran(band, waxis, igm, opt);
wa = fmsc.wa;          % "a" weights, for each FOV
wb = fmsc.wb;          % "b" weights, for each FOV
dmin = fmsc.dmin;      % best fit residual
wfov = fmsc.wfov;      % best fit wlaser
vobs4 = fmsc.vobs4;    % interpolated frequency grid
tcal4 = fmsc.tcal4;    % interpolated calc for all FOVS
tobs4 = fmsc.tobs4;    % interpolated best-fit obs
tobs5 = fmsc.tobs5;    % interpolated corrected obs

% print fit_tran residuals and weights
fit_info(band, wlaser, waxis, drms, fmsc)

% values for plots
qv1 = opt.qv1;
qv2 = opt.qv2;

% -----------------------------------
% plot fitting errors by wlaser shift
% -----------------------------------

figure(1); clf;
set(gcf, 'DefaultAxesColorOrder', fovcolors);
plot(waxis, drms, 'linewidth', 2)
% axis([771.95, 772.0, 0.002, 0.018])
xlabel('wavelength, nm')
ylabel('rms fitting error')
title(sprintf('%s, residual as a function of wlaser', pname));
legend(fovnames, 'location', 'north')
grid on; zoom on

% saveas(gcf, 'CH4_wlaser_fit', 'png')
% saveas(gcf, 'CH4_wlaser_fit', 'fig')

% ------------------
% plot obs and calc
% ------------------

figure(2); clf
set(gcf, 'DefaultAxesColorOrder', fovcolors);

plot(vobs4, tobs5, vobs4, tcal4, 'k-.');
axis([qv1, qv2, 0, 1.1])
xlabel('wavenumber')
ylabel('transmittance')
title(sprintf('%s, obs and calc transmittance', pname));
legend(fovnames, 'location', 'southwest')
grid on; zoom on

% saveas(gcf, 'CH4_obs_and_calc', 'png')
% saveas(gcf, 'CH4_obs_and_calc', 'fig')

% --------------------
% plot obs minus calc
% --------------------

figure(3); clf
set(gcf, 'DefaultAxesColorOrder', fovcolors);

plot(vobs4, tobs5 - tcal4);
axis([qv1, qv2, -.02, .02])
xlabel('wavenumber')
ylabel('transmittance difference')
title(sprintf('%s, obs minus calc', pname));
legend(fovnames, 'location', 'southeast')
grid on; zoom on


