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
addpath /asl/packages/ccast/motmsc/time
addpath /asl/packages/airs_decon/test
addpath ../source
addpath ../gas_calcs

%------------------
% basic run params
%------------------

band = 'SW';      % set the band
test_dir = '.';   % location of test data
sdir = 0;         % sweep direction

% get wlaser from eng and neon
opt2 = struct;
  opt2.neonWL = 703.44765;
% opt2.neonWL = 705.175;     % via an ad hoc fit
load(fullfile(test_dir, 'FT2'));
[wlaser, wtime] = metlaser(d1.packet.NeonCal, opt2);

fprintf(1, 'eng neon=%.5f assigned neon=%.5f, wlaser=%.5f\n', ... 
  d1.packet.NeonCal.NeonGasWavelength, opt2.neonWL, wlaser);

% set the search grid
wgrid = -0.01 : .0001 : 0.02;
waxis = wlaser + wgrid;

% run name for plots
pname = 'CO, 12 Feb 2020 MN side 1';

%---------------------
% params for fit_tran
%---------------------

opt = struct; 
opt.user_res = 'hires';
opt.inst_res = 'hires4';
opt.SW_sfile = '../inst_data/SAinv_default_HR4_SW.mat';
opt.qv1   = 2160;           % fitting interval start
opt.qv2   = 2240;           % fitting interval end

% gas file and weight
opt.abswt = 12.69;
opt.afile = 'umbc_CO_50p06_Torr_15p57_C';

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
igm.ET2 = igm.ET2(:, :, 44:341);
igm.ET1 = igm.ET1(:, :, 47:317);
igm.FT2 = igm.FT2(:, :, 31:337);
igm.FT1 = igm.FT1(:, :, 35:332);

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
xlim([round2n(waxis(1), 5), round2n(waxis(end), 5)])
xlabel('wavelength, nm')
ylabel('rms fitting error')
title(sprintf('%s, residual as a function of wlaser', pname));
legend(fovnames, 'location', 'north')
grid on; zoom on

% saveas(gcf, 'CO_wlaser_fit', 'fig')
% saveas(gcf, 'CO_wlaser_fit', 'png')

% ------------------
% plot obs and calc
% ------------------

figure(2); clf
set(gcf, 'DefaultAxesColorOrder', fovcolors);
plot(vobs4, tobs5, vobs4, tcal4, 'k-.');
xlim([qv1, qv2])
xlabel('wavenumber')
ylabel('transmittance')
title(sprintf('%s, obs and calc transmittance', pname));
legend(fovnames, 'location', 'southeast')
grid on; zoom on

% saveas(gcf, 'CO_obs_and_calc', 'fig')
% saveas(gcf, 'CO_obs_and_calc', 'png')

% --------------------
% plot obs minus calc
% --------------------

figure(3); clf
set(gcf, 'DefaultAxesColorOrder', fovcolors);
plot(vobs4, tobs5 - tcal4);
xlim([qv1, qv2])
xlabel('wavenumber')
ylabel('transmittance difference')
title(sprintf('%s, obs minus calc', pname));
legend(fovnames, 'location', 'northwest')
grid on; zoom on


