%
% plot LW test legs, uses data from read_ccs
%

d12 = load('read_ccs_12');
d13 = load('read_ccs_13');

% 12 Jan LW -------------------
dbase = datenum('12 Jan 2020');

% ET1, 360K, cell empty
t1 = hhmmss_to_hour('19:03:46');
t2 = hhmmss_to_hour('19:16:49');
plot_leg(d12, dbase, t1, t2, 'LW ET1', 1);
saveas(gcf, '01-12_LW_ET1', 'png')

% ET2 320K, cell empty, HTBB drifty
t1 = hhmmss_to_hour('20:35:42');
t2 = hhmmss_to_hour('20:49:05');
plot_leg(d12, dbase, t1, t2, 'LW ET2', 2);
saveas(gcf, '01-12_LW_ET2', 'png')

% FT2, 320, 48.33 torr, 16.55C
t1 = hhmmss_to_hour('21:23:43');
t2 = hhmmss_to_hour('21:36:43');
plot_leg(d12, dbase, t1, t2, 'LW FT2', 3);
subplot(3,1,2); ylim([48.2, 48.4])
saveas(gcf, '01-12_LW_FT2', 'png')

% 13 Jan LW ------------------
dbase = datenum('13 Jan 2020');

% FT1 360K, 48.39K, 16.75C, HTBB drifty
t1 = hhmmss_to_hour('00:10:51');
t2 = hhmmss_to_hour('00:24:30');
plot_leg(d13, dbase, t1, t2, 'LW FT1', 4);
saveas(gcf, '01-12_LW_FT1', 'png')

