%
% plot LW test legs, uses data from read_ccs
%
% T1 > T2
%

d11 = load('ccs_data_02_11');
dbase = datenum('11 Feb 2020');

% ET2, 320K, cell empty
t1 = hhmmss_to_hour('00:37:52');
t2 = hhmmss_to_hour('00:50:47');
plot_leg(d11, dbase, t1, t2, 'LW ET2', 1);
% saveas(gcf, '02-11_LW_ET2', 'png')

% ET1 360K, cell empty
t1 = hhmmss_to_hour('03:06:40');
t2 = hhmmss_to_hour('03:19:49');
plot_leg(d11, dbase, t1, t2, 'LW ET1', 2);
% saveas(gcf, '02-11_LW_ET1', 'png')

% FT1, 360K, 49.45 Torr, 15.60 C
t1 = hhmmss_to_hour('03:49:49');
t2 = hhmmss_to_hour('04:03:12');
plot_leg(d11, dbase, t1, t2, 'LW FT1', 3);
% subplot(3,1,2); ylim([49.6,49.7])
% saveas(gcf, '02-11_LW_FT1', 'png')

% FT2 320K, 49.42 Torr 15.60 C
t1 = hhmmss_to_hour('06:03:40');
t2 = hhmmss_to_hour('06:16:45');
plot_leg(d11, dbase, t1, t2, 'LW FT2', 4);
% saveas(gcf, '02-11_LW_FT2', 'png')

