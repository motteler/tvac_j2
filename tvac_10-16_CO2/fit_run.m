%
% fit_run -- set up params, call fit_tran, plot results
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

band = 'LW';                     % set the band
wlaser = 774.0839;               % metrology laser
sdir = 0;                        % sweep direction

% search grid
  wgrid = -0.005 : 0.0001 : 0.010;  
% wgrid =    0   : 0.0001 : 0.015;  % for UW test
waxis = wlaser + wgrid;

% run name for plots
pname = 'CO2 16 Oct 2014 MN S1';

%---------------------
% params for fit_tran
%---------------------

opt = struct;
opt.user_res = 'hires';
opt.inst_res = 'hires2';
opt.sfile = '../inst_data/SAinv_umbc2_HR2_LW.mat';
opt.afile = 'run8_402t_CO2';     % tabulated absorptions
opt.abswt = 1;                   % absorption scale factor
% opt.qv1 = 650; opt.qv2 = 760;  % full fitting interval 
  opt.qv1 = 672; opt.qv2 = 712;  % easier CO2 subinterval

%--------------------
% get interferograms
%--------------------

% test data files
test_dir = '/asl/data/cris/test/2014-10-16_CO2';
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
igm.ET2 = igm.ET2(:, :, 67:396);
igm.ET1 = igm.ET1(:, :, 18:347);
igm.FT2 = igm.FT2(:, :, 18:347);
igm.FT1 = igm.FT1(:, :, 18:347);

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

plot(waxis, drms)
xlabel('wavelength, nm')
ylabel('rms fitting error')
title(sprintf('%s D%d, residual as a function of wlaser', pname, sdir));
legend(fovnames, 'location', 'north')
grid on; zoom on

% saveas(gcf, 'CO2_wlaser_fit', 'png')
% export_fig('CO2_wlaser_fit_s1.pdf', '-m2', '-transparent')

% ------------------
% plot obs and calc
% ------------------

figure(2); clf
set(gcf, 'DefaultAxesColorOrder', fovcolors);

plot(vobs4, tobs5, vobs4, tcal4, 'k-.');
axis([qv1, qv2, 0.4, 1.1])
xlabel('wavenumber')
ylabel('transmittance')
title(sprintf('%s D%d, obs and calc transmittance', pname, sdir));
legend(fovnames, 'location', 'southeast')
grid on; zoom on

% saveas(gcf, 'CO2_obs_and_calc', 'png')
% export_fig('CO2_obs_and_calc_s1.pdf', '-m2', '-transparent')

% --------------------
% plot obs minus calc
% --------------------

figure(3); clf
set(gcf, 'DefaultAxesColorOrder', fovcolors);

plot(vobs4, tobs5 - tcal4);
axis([qv1, qv2, -.02, .02])
xlabel('wavenumber')
ylabel('transmittance difference')
title(sprintf('%s D%d, obs minus calc', pname, sdir));
legend(fovnames, 'location', 'northeast')
grid on; zoom on


