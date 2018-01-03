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
band = 'SW';
wlaser = 774.0839;
opt1 = struct; opt1.resmode = 'hires2';
[inst, user] = inst_params(band, wlaser, opt1);

% choose a test data file
mfile = '/asl/data/cris/test/2014-10-15_CO/FT1.mat';
load(mfile);

% choose a sweep direction
sdir = 0;

% read the interferograms
igm = read_igm(band, mfile, sdir);

% option to take subsets
% igm = igm(:, :, 167:496);  % ET2
% igm = igm(:, :, 18:347);   % ET1
% igm = igm(:, :, 18:347);   % FT2
% igm = igm(:, :, 18:347);  % FT1

% translate to count spectra
spec = igm2spec(igm, inst);

% apply phase correction
spec = pcorr2(spec);
if mean(spec(:)) < 0
  spec = -spec;
end

% get test name for plots
[xx, tname] = fileparts(mfile);

% show all obs for one FOV
ifov = 1;
figure(1); clf
plot(inst.freq, squeeze(spec(:, ifov, :)));
title(sprintf('test %s FOV %d all obs', tname, ifov))
xlabel('wavenumber')
ylabel('count')
grid on; zoom on

% show all FOVs at one frequency
ifrq = floor(inst.npts/2);
figure(2); clf
vseq = squeeze(spec(ifrq, :, :));
[m, nobs] = size(vseq);
set(gcf, 'DefaultAxesColorOrder', fovcolors);
plot(1:nobs, vseq)
title(sprintf('test %s, all FOVs at %.2f cm-1', tname, inst.freq(ifrq)))
legend(fovnames,  'location', 'southeast')
xlabel('obs index')
ylabel('count')
grid on; zoom on

