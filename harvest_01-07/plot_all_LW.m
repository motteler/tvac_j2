%
% plot LW PFL side 1 CO2 test legs, uses data from read_ccs
%

addpath ../source
d07 = load('read_ccs_07');
dbase = datenum('7 Jan 2020');

% ET1, 360K, cell empty
t1 = hhmmss_to_hour('15:02:17');
t2 = hhmmss_to_hour('15:17:34');
plot_leg(d07, dbase, t1, t2, 'LW ET1', 1);

% ET2, 320K, cell empty
t1 = hhmmss_to_hour('16:52:20');
t2 = hhmmss_to_hour('17:05:10');
plot_leg(d07, dbase, t1, t2, 'LW ET2', 2);

% FT2, 320K, 45.045 torr, 15.0C
t1 = hhmmss_to_hour('17:54:44');
t2 = hhmmss_to_hour('18:08:09');
plot_leg(d07, dbase, t1, t2, 'LW FT2', 3);
% subplot(3,1,2); ylim([48.2, 48.4])

% FT1, 360K, 45.045, 15.05C, HTBB drifty
t1 = hhmmss_to_hour('19:43:20');
t2 = hhmmss_to_hour('19:57:50');
plot_leg(d07, dbase, t1, t2, 'LW FT1', 4);

