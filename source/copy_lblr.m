%
% copy out lblrtm from Sergio's first gas set
%

clear all
load gascell_1_gid_2_params_jan27_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CO2_45p05_Torr_15p02_C fr absc
!mv  lblr_CO2_45p05_Torr_15p02_C.mat ../01-07_pfl_s1_CO2

load gascell_2_gid_2_params_jan27_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CO2_48p36_Torr_16p65_C fr absc
!mv  lblr_CO2_48p36_Torr_16p65_C.mat ../01-12_pfh_s1_CO2

load gascell_3_gid_2_params_jan27_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CO2_49p75_Torr_17p27_C fr absc
!mv  lblr_CO2_49p75_Torr_17p27_C.mat ../01-19_pfh_s2_CO2

load gascell_4_gid_6_params_jan27_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CH4_44p64_Torr_14p90_C fr absc
!mv  lblr_CH4_44p64_Torr_14p90_C.mat ../01-07_pfl_s1_CH4

load gascell_5_gid_6_params_jan27_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CH4_48p70_Torr_17p17_C fr absc
!mv  lblr_CH4_48p70_Torr_17p17_C.mat ../01-13_pfh_s1_CH4

load gascell_6_gid_5_params_jan27_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CO_45p92_Torr_14p85_C fr absc
!mv  lblr_CO_45p92_Torr_14p85_C.mat ../01-08_pfl_s1_CO

load gascell_7_gid_5_params_jan27_2020_ip.mat
fr = xw(:); absc = xdlblrtm(:);
save lblr_CO_49p58_Torr_17p15_C fr absc
!mv  lblr_CO_49p58_Torr_17p15_C.mat ../01-13_pfh_s1_CO

