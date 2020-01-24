%
% plot test legs, loads data from read_ccs
%
% 19 Jan 2020, PFH, side 2, LW CO2
%

d19 = load('read_ccs_19');

% 12 Jan LW -------------------
dbase = datenum('19 Jan 2020');

% LW ET1 (360K)
t1 = hhmmss_to_hour('06:20:37');
t2 = hhmmss_to_hour('06:54:28');
plot_leg(d19, dbase, t1, t2, 'LW ET1', 1);

% LW ET2 (320K)
t1 = hhmmss_to_hour('09:09:12');
t2 = hhmmss_to_hour('09:22:33');
plot_leg(d19, dbase, t1, t2, 'LW ET2', 2);

% LW FT2 (320K, 49.77 torr, 17.25 C)
t1 = hhmmss_to_hour('10:09:08');
t2 = hhmmss_to_hour('10:21:57');
plot_leg(d19, dbase, t1, t2, 'LW FT2', 3);

% LW FT1 (360K, 49.74 torr, 17.3 C)
t1 = hhmmss_to_hour('12:35:49');
t2 = hhmmss_to_hour('12:56:26');
plot_leg(d19, dbase, t1, t2, 'LW FT1', 4);

