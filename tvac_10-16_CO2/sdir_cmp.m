
fname = fovnames;
fcolor = fovcolors;

d0 = load('sdir0_cmp');
d1 = load('sdir1_cmp');

tdif = d0.tobs5 - d1.tobs5;
vobs = d0.vobs4;
qv1 = d0.qv1;
qv2 = d0.qv2;
yax = 0.004;

figure(4); clf
set(gcf, 'DefaultAxesColorOrder', fcolor);

subplot(2,1,1)
plot(vobs, tdif)
axis([qv1, qv2, -yax, yax])
xlabel('wavenumber')
ylabel('transmittance difference')
title('CO2 sweep d0 minus d1 all FOVs')
legend(fname, 'location', 'southeast')
grid on; zoom on

subplot(2,1,2)
ix = 5;
set(gcf, 'DefaultAxesColorOrder', fcolor(ix,:));
plot(vobs, tdif(:, ix))
axis([qv1, qv2, -yax, yax])
xlabel('wavenumber')
ylabel('transmittance difference')
title('CO2 sweep d0 minus d1 FOV 5')
legend(fname{ix}, 'location', 'southeast')
grid on; zoom on
  saveas(gcf, 'CO2_sweep_diffs_1', 'png');

figure(5); clf
set(gcf, 'DefaultAxesColorOrder', fcolor);

subplot(2,1,1)
ix = [2 4 6 8];
set(gcf, 'DefaultAxesColorOrder', fcolor(ix,:));
plot(vobs, tdif(:, ix))
axis([qv1, qv2, -yax, yax])
xlabel('wavenumber')
ylabel('transmittance difference')
title('CO2 sweep d0 minus d1 side FOVs')
legend(fname{ix}, 'location', 'southeast')
grid on; zoom on

subplot(2,1,2)
ix = [1 3 7 9];
set(gcf, 'DefaultAxesColorOrder', fcolor(ix,:));
plot(vobs, tdif(:, ix))
axis([qv1, qv2, -yax, yax])
xlabel('wavenumber')
ylabel('transmittance difference')
title('CO2 sweep d0 minus d1 corner FOVs')
legend(fname{ix}, 'location', 'southeast')
grid on; zoom on
  saveas(gcf, 'CO2_sweep_diffs_2', 'png');
