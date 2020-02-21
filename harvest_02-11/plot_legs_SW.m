%
% plot SW test legs, uses data from read_ccs
%
% T1 > T2
%

addpath ../source
d12 = load('ccs_data_02_12');
dbase = datenum('12 Feb 2020');

% ET2, 320K, cell empty
t1 = hhmmss_to_hour('00:16:43');
t2 = hhmmss_to_hour('00:30:08');
plot_leg(d12, dbase, t1, t2, 'SW ET2', 1);
subplot(3,1,1); ylim([319.2, 320.2])
saveas(gcf, '02-12_SW_ET2', 'fig')

% ET1, 335K, cell empty, HTBB slight drift
t1 = hhmmss_to_hour('02:40:58');
t2 = hhmmss_to_hour('02:54:31');
plot_leg(d12, dbase, t1, t2, 'SW ET1', 2);
subplot(3,1,1); ylim([334.2, 335.2])
saveas(gcf, '02-12_SW_ET1', 'fig')

% FT1, 335K, 50.06 Torr, 15.60 C
t1 = hhmmss_to_hour('03:19:00');
t2 = hhmmss_to_hour('03:31:50');
plot_leg(d12, dbase, t1, t2, 'SW FT1', 3);
subplot(3,1,1); ylim([334.2, 335.2])
saveas(gcf, '02-12_SW_FT1', 'fig')

% FT2 320K, 50.07 Torr, 15.55 C
t1 = hhmmss_to_hour('04:57:38');
t2 = hhmmss_to_hour('05:11:19');
plot_leg(d12, dbase, t1, t2, 'SW FT2', 4);
subplot(3,1,1); ylim([319.2, 320.2])
saveas(gcf, '02-12_SW_FT2', 'fig')

