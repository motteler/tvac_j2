%
% plot LW test legs, uses data from read_ccs
%

d5 = load('ccs_data_02_05');
dbase = datenum('5 Feb 2020');

% ET1, 360K, cell empty
t1 = hhmmss_to_hour('02:22:17');
t2 = hhmmss_to_hour('02:35:16');
plot_leg(d5, dbase, t1, t2, 'LW ET1', 1);
% saveas(gcf, '02-05_LW_ET1', 'png')

% ET2 320K, cell empty, HTBB drifty
t1 = hhmmss_to_hour('04:24:43');
t2 = hhmmss_to_hour('04:38:52');
plot_leg(d5, dbase, t1, t2, 'LW ET2', 2);
% saveas(gcf, '02-05_LW_ET2', 'png')

% FT2, 320K, 49.65 Torr, low at start, 15.65C
t1 = hhmmss_to_hour('04:58:24');
t2 = hhmmss_to_hour('05:11:39');
plot_leg(d5, dbase, t1, t2, 'LW FT2', 3);
subplot(3,1,2); ylim([49.6,49.7])
% saveas(gcf, '02-05_LW_FT2', 'png')

% FT1 360K, 49.65 Torr 15.75C, HTBB slightly drifty
t1 = hhmmss_to_hour('07:04:39');
t2 = hhmmss_to_hour('07:17:28');
plot_leg(d5, dbase, t1, t2, 'LW FT1', 4);
% saveas(gcf, '02-05_LW_FT1', 'png')

