%
% plot SW test legs, uses data from read_ccs
%

d13 = load('read_ccs_13');
dbase = datenum('13 Jan 2020');

% ET2, 320K, cell empty
t1 = hhmmss_to_hour('14:01:07');
t2 = hhmmss_to_hour('14:14:16');
plot_leg(d13, dbase, t1, t2, 'SW ET2', 1);

% ET1, 335K, cell empty, HTBB drifty
t1 = hhmmss_to_hour('16:31:24');
t2 = hhmmss_to_hour('16:44:33');
plot_leg(d13, dbase, t1, t2, 'SW ET1', 2);

% FT1, 335K, 49.58 torr, 17.15C, pressure low at start, spikes
t1 = hhmmss_to_hour('17:22:01');
t2 = hhmmss_to_hour('17:34:45');
plot_leg(d13, dbase, t1, t2, 'SW FT1', 3);
subplot(3,1,2); ylim([49.5,49.7])

% FT2, 320K, 49.58 torr, 17.15C, pressure spikes
t1 = hhmmss_to_hour('19:16:53');
t2 = hhmmss_to_hour('19:30:08');
plot_leg(d13, dbase, t1, t2, 'SW FT2', 4);
subplot(3,1,2); ylim([49.5,49.7])

