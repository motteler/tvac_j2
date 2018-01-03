%
% spec_test2 -- quick look at gas cell transmittance
%
% main test parameters
%   band     - 'LW', 'MW', or 'SW'
%   wlaser   - metrology laser half-wavelength
%   sfile    - SRF matrix for the current wlaser range
%   afile    - tabulated absorptions, at 0.0025 cm-1 grid
%   abswt    - scale factor for tabulated absorptions
%   mat_et2  - mat file for cell empty, BB t2
%   mat_et1  - mat file for cell empty, BB t1
%   mat_ft2  - mat file for cell full, BB t2
%   mat_ft1  - mat file for cell full, BB t1
%   sdir     - sweep direction, 0 or 1
%
% HM, 15 Jan 2014
%

% paths and libs
addpath /asl/packages/ccast/source
addpath /asl/packages/ccast/motmsc/utils
addpath /asl/packages/airs_decon/test
addpath ../source

% get instrument params
band = 'SW';
wlaser = 774.0839;
opt1 = struct;
opt1.resmode = 'hires2';
[inst, user] = inst_params(band, wlaser, opt1);

% get SRF matrix for the current wlaser
sfile = '../inst_data/SAinv_exel_HR2_SW.mat';
Smat = getSRFwl(wlaser, sfile);

% take the inverse after interpolation
Sinv = zeros(inst.npts, inst.npts, 9);
for i = 1 : 9
  Sinv(:,:,i) = inv(squeeze(Smat(:,:,i)));
end

% test data files
test_dir = '/asl/data/cris/test/2014-10-15_CO';
mat_et2 = fullfile(test_dir, 'ET2');
mat_et1 = fullfile(test_dir, 'ET1');
mat_ft2 = fullfile(test_dir, 'FT2');
mat_ft1 = fullfile(test_dir, 'FT1');

% choose a sweep direction
sdir = 0;

% get the count spectra
count_ET2 = igm2spec(read_igm(band, mat_et2, sdir), inst);
count_ET1 = igm2spec(read_igm(band, mat_et1, sdir), inst);
count_FT2 = igm2spec(read_igm(band, mat_ft2, sdir), inst);
count_FT1 = igm2spec(read_igm(band, mat_ft1, sdir), inst);

% option to take subsets
count_ET2 = count_ET2(:, :, 167:496);
count_ET1 = count_ET1(:, :, 18:347);
count_FT2 = count_FT2(:, :, 18:347);
count_FT1 = count_FT1(:, :, 18:347);

% take means of the obs
mean_ET2 = mean(count_ET2, 3);
mean_ET1 = mean(count_ET1, 3);
mean_FT2 = mean(count_FT2, 3);
mean_FT1 = mean(count_FT1, 3);

% get the transmittance
tobs = real((mean_FT2 - mean_FT1) ./ (mean_ET2 - mean_ET1));

% apply SA-1
tobs = bandpass(inst.freq, tobs, user.v1, user.v2, user.vr);
for i = 1 : 9
  tobs(:, i) = Sinv(:,:,i) * tobs(:, i);
end
tobs = bandpass(inst.freq, tobs, user.v1, user.v2, user.vr);

% get calc values
abswt = 1.0;
d1 = load('run8_41t_CO');
[tcal, vcal] = kc2inst(inst, user, exp(-d1.absc * abswt), d1.fr);

% check frequency grids
% isclose(inst.freq, vcal)

% plot the results
[tobs2, freq2] = finterp2(tobs, inst.freq, 20);
[tcal2, freq2] = finterp2(tcal, inst.freq, 20);

figure(1); clf
plot(freq2, tobs2, freq2, tcal2, 'k-.');
title('observed and calculated transmittance')
% plot(freq2, tobs2)
% title('observed transmittance')
legend(fovnames, 'location', 'southeast')
grid; zoom on
xlabel('wavenumber')
ylabel('transmittance')
grid on; zoom on
% saveas(gcf, 'spec_test2', 'fig')

