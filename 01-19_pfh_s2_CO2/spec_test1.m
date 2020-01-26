%
% spec_test1 -- quick look at gas cell count spectra
%
% main test parameters
%   band    - 'LW', 'MW', or 'SW'
%   wlaser  - metrology laser half-wavelength
%   mfile   - mat file, output from the MIT reader
%   sdir    - sweep direction, 0 or 1
%   ifov    - choose a FOV for figure 1
%   ifrq    - frequency index for figure 2
%
% HM, 15 Jan 2014
%
% updated to get met laser from neon
% set test file, band, and optional subsetting below
%

% paths and libs
addpath /asl/packages/ccast/source
addpath /asl/packages/ccast/motmsc/utils
addpath ../source

% select a test data file
mfile = './FT2.mat';
load(mfile);

% get wlaser from eng and neon
opt2 = struct;
opt2.neonWL = 703.44765;
[wlaser, wtime] = metlaser(d1.packet.NeonCal, opt2);

fprintf(1, 'eng neon=%.5f assigned neon=%.5f, wlaser=%.5f\n', ... 
  d1.packet.NeonCal.NeonGasWavelength, opt2.neonWL, wlaser);

% get instrument params
band = 'LW';
opt1 = struct; 
opt1.user_res = 'hires';
opt1.inst_res = 'hires2';
[inst, user] = inst_params(band, wlaser, opt1);

% choose a sweep direction
sdir = 0;

% read the interferograms
igm = read_igm(band, mfile, sdir);

% option to take subsets
% igm = igm(:, :, 30:340);  % ET2
% igm = igm(:, :, 30:340);  % ET1
  igm = igm(:, :, 30:340);  % FT2
% igm = igm(:, :, 20:320);  % FT1

% translate to count spectra
spec = igm2spec(igm, inst);

% use complex magnitude
spec = abs(spec);

% get test name for plots
[~, tname] = fileparts(mfile);

% show all obs for one FOV
figure(1);
ifov = 5;
plot(inst.freq, squeeze(spec(:, ifov, :)), 'b');
title(sprintf('test %s FOV %d all obs', tname, ifov))
xlabel('wavenumber')
ylabel('count')
grid on; zoom on

% show all FOVs at one frequency
figure(2);
set(gcf, 'DefaultAxesColorOrder', fovcolors);
ifrq = floor(inst.npts/2);
vseq = squeeze(spec(ifrq, :, :));
[m, nobs] = size(vseq);
plot(1:nobs, vseq)
title(sprintf('test %s, all FOVs at %.2f cm-1', tname, inst.freq(ifrq)))
legend(fovnames,  'location', 'south')
xlabel('obs index')
ylabel('count')
grid on; zoom on

