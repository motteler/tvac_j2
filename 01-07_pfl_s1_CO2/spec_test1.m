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

% paths and libs
addpath /asl/packages/ccast/source
addpath /asl/packages/ccast/motmsc/utils
addpath ../source

% get instrument params
band = 'LW';
wlaser = 771.9574;  % from read_wlaser
opt1 = struct; 
opt1.user_res = 'hires';
opt1.inst_res = 'hires2';
[inst, user] = inst_params(band, wlaser, opt1);

% choose a test data file
mfile = './FT1.mat';
load(mfile);

% choose a sweep direction
sdir = 0;

% read the interferograms
igm = read_igm(band, mfile, sdir);

% option to take subsets
% igm = igm(:, :, 187:516);  % ET2
% igm = igm(:, :, 18:347);   % ET1
% igm = igm(:, :, 47:376);   % FT2
% igm = igm(:, :, 18:347);   % FT1

% translate to count spectra
spec = igm2spec(igm, inst);

% use complex magnitude
spec = abs(spec);

% get test name for plots
[xx, tname] = fileparts(mfile);

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

