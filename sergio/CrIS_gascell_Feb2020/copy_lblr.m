%
% copy out lblrtm from Sergio's second gas set
%

clear all
load gascell_1_gid_2_params_cris_feb17_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CO2_49p65_Torr_15p70_C fr absc

load gascell_2_gid_2_params_cris_feb17_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CO2_49p43_Torr_15p60_C fr absc

load gascell_3_gid_6_params_cris_feb17_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CH4_50p00_Torr_15p63_C fr absc

load gascell_4_gid_5_params_cris_feb17_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CO_50p06_Torr_15p57_C fr absc

