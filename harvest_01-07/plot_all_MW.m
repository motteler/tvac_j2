%
% plot MW PFL side 1 CH4 test legs, uses data from read_ccs
%

addpath ../source
d07 = load('read_ccs_07');
dbase = datenum('7 Jan 2020');

% ET1, 360K, cell empty
t1 = hhmmss_to_hour('04:01:24');
t2 = hhmmss_to_hour('04:16:28');
plot_leg(d07, dbase, t1, t2, 'MW ET1', 1);

% ET2, 320K, cell empty
t1 = hhmmss_to_hour('05:56:20');
t2 = hhmmss_to_hour('06:09:31');
plot_leg(d07, dbase, t1, t2, 'MW ET2', 2);

% FT2, 320K, 44.638 torr, 14.85C
t1 = hhmmss_to_hour('10:09:47');
t2 = hhmmss_to_hour('10:23:11');
plot_leg(d07, dbase, t1, t2, 'MW FT2', 3);

% FT1, 360K, 44.652 torr, 14.95C, HTBB drifty
t1 = hhmmss_to_hour('11:49:05');
t2 = hhmmss_to_hour('12:03:59');
plot_leg(d07, dbase, t1, t2, 'MW FT1', 4);

