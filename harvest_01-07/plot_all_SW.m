%
% plot SW PFL side 1 CO test legs, uses data from read_ccs
%

addpath ../source
d13 = load('read_ccs_08');
dbase = datenum('8 Jan 2020');

% ET2, 320K, cell empty, HTBB drifty
t1 = hhmmss_to_hour('00:00:00');
t2 = hhmmss_to_hour('00:11:17');
plot_leg(d13, dbase, t1, t2, 'SW ET2', 1);

% ET1, 335K, cell empty, HTBB drifty
t1 = hhmmss_to_hour('02:21:09');
t2 = hhmmss_to_hour('02:33:43');
plot_leg(d13, dbase, t1, t2, 'SW ET1', 2);

% FT1, 335K, 45.91 torr, 14.85C
t1 = hhmmss_to_hour('02:58:03');
t2 = hhmmss_to_hour('03:11:02');
plot_leg(d13, dbase, t1, t2, 'SW FT1', 3);
subplot(3,1,2); ylim([45.9, 45.92]) 

% FT2, 320K, 45.93 torr, 14.85C, HTBB drifty
t1 = hhmmss_to_hour('04:55:57');
t2 = hhmmss_to_hour('05:09:35');
plot_leg(d13, dbase, t1, t2, 'SW FT2', 4);
subplot(3,1,2);  ylim([45.92, 45.94])

