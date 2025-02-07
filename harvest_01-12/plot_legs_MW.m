%
% plot MW test legs, uses data from read_ccs
%

d13 = load('read_ccs_13');
dbase = datenum('13 Jan 2020');

% ET1, 360K
t1 = hhmmss_to_hour('07:00:05');
t2 = hhmmss_to_hour('07:12:53');
plot_leg(d13, dbase, t1, t2, 'MW ET1', 1);
saveas(gcf, '01-13_MW_ET1', 'png')

% ET2, 320K
t1 = hhmmss_to_hour('08:24:29');
t2 = hhmmss_to_hour('08:38:24');
plot_leg(d13, dbase, t1, t2, 'MW ET2', 2);
saveas(gcf, '01-13_MW_ET2', 'png')

% FT2, 320K, 48.9 torr, 17.15C
t1 = hhmmss_to_hour('09:01:05');
t2 = hhmmss_to_hour('09:13:55');
plot_leg(d13, dbase, t1, t2, 'MW FT2', 3);
saveas(gcf, '01-13_MW_FT2', 'png')

% FT1, 360K, 48.5 torr, 17.2C, HTBB drifty
t1 = hhmmss_to_hour('10:41:26');
t2 = hhmmss_to_hour('10:55:52');
plot_leg(d13, dbase, t1, t2, 'MW FT1', 4);
saveas(gcf, '01-13_MW_FT1', 'png')

