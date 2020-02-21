%
% plot LW test legs, uses data from read_ccs
%

addpath ../source
d5 = load('ccs_data_02_05');
dbase = datenum('5 Feb 2020');

% ET1, 360K, cell empty
t1 = hhmmss_to_hour('02:22:17');
t2 = hhmmss_to_hour('02:35:16');
plot_leg(d5, dbase, t1, t2, 'LW ET1', 1);
subplot(3,1,1); ylim([359.2, 360.2])
saveas(gcf, '02-05_LW_ET1', 'fig')

% ET2 320K, cell empty, HTBB drifty
t1 = hhmmss_to_hour('04:24:43');
t2 = hhmmss_to_hour('04:38:52');
plot_leg(d5, dbase, t1, t2, 'LW ET2', 2);
subplot(3,1,1); ylim([319.2, 320.2])
saveas(gcf, '02-05_LW_ET2', 'fig')

% FT2, 320K, 49.65 Torr, low at start, 15.65C
t1 = hhmmss_to_hour('04:58:24');
t2 = hhmmss_to_hour('05:11:39');
plot_leg(d5, dbase, t1, t2, 'LW FT2', 3);
subplot(3,1,1); ylim([319.2, 320.2])
subplot(3,1,2); ylim([44., 50.0])
saveas(gcf, '02-05_LW_FT2', 'fig')

% FT1 360K, 49.65 Torr 15.75C, HTBB slightly drifty
t1 = hhmmss_to_hour('07:04:39');
t2 = hhmmss_to_hour('07:17:28');
plot_leg(d5, dbase, t1, t2, 'LW FT1', 4);
subplot(3,1,1); ylim([359.2, 360.2])
saveas(gcf, '02-05_LW_FT1', 'fig')

