%
% plot MW test legs, uses data from read_ccs
%
% T1 > T2
%

addpath ../source
d11 = load('ccs_data_02_11');
dbase = datenum('11 Feb 2020');

% ET2, 320K, cell empty
t1 = hhmmss_to_hour('13:10:13');
t2 = hhmmss_to_hour('13:23:19');
plot_leg(d11, dbase, t1, t2, 'MW ET2', 1);
subplot(3,1,1); ylim([319.2, 320.2])
saveas(gcf, '02-11_MW_ET2', 'fig')

% ET1 360K, cell empty
t1 = hhmmss_to_hour('15:23:55');
t2 = hhmmss_to_hour('15:38:26');
plot_leg(d11, dbase, t1, t2, 'MW ET1', 2);
subplot(3,1,1); ylim([359.2, 360.2])
saveas(gcf, '02-11_MW_ET1', 'fig')

% FT1, 360K, 50.01 Torr, 15.65 C
t1 = hhmmss_to_hour('16:12:04');
t2 = hhmmss_to_hour('16:26:32');
plot_leg(d11, dbase, t1, t2, 'MW FT1', 3);
subplot(3,1,1); ylim([359.2, 360.2])
saveas(gcf, '02-11_MW_FT1', 'fig')

% FT2 320K, 50.00 Torr 15.60 C
t1 = hhmmss_to_hour('18:46:59');
t2 = hhmmss_to_hour('19:00:20');
plot_leg(d11, dbase, t1, t2, 'MW FT2', 4);
subplot(3,1,1); ylim([319.2, 320.2])
saveas(gcf, '02-11_MW_FT2', 'fig')

