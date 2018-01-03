
addpath /asl/packages/ccast/source

band = 'LW';
wlaser = 774.0839;
opt1 = struct;
opt1.resmode = 'hires2';
[inst, user] = inst_params(band, wlaser, opt1);

uw1 = load('newdat_co2_mn_side1_fcc_ils2_sweep0.mat');

[t2, v2] = finterp(real(uw1.tz), uw1.vz, inst.dv);
[ix, jx] = seq_match(inst.freq, v2);

% fix garbage after around 950 cm-1
k = 520;
ix = ix(1:k);
jx = jx(1:k);

tobs_uw = ones(inst.npts, 9);
tobs_uw(ix, :) = real(t2(jx, :));
tobs_uw = bandpass(inst.freq, tobs_uw, user.v1, user.v2, 20);

save tobs_uw tobs_uw

figure(1); clf
plot(inst.freq, tobs_uw)

