%% 1 atm = 760 torr

%% ps = p = 44.65 torr, T = 14.85 C 

% matrix   profname       this contains N x 5 matrix : layernum,p,pp,t,x
%                          where column 1 = layer number
%                                column 2 = layer pressure (atm)
%                                column 3 = layer partial pressure (atm)
%                                column 4 = layer temperature (k)
%                                column 5 = layer gas amt (kilomoles/cm2)

% pV = nRT ==> q = (n/V)L = p/RT 

%% see /home/sergio/SPECTRA/gascell2ip.m
%% p  = 5.875000000000000e-02
%% ps = 5.875000000000000e-02
%% T = 288.0000;
%% L = 1;

ipfile = '/home/sergio/MATLABCODE/QUICKTASKS_TELECON/CrIS_gascell_Jan2020/ch4_cell1';

cd /home/sergio/SPECTRA
[outwave,out_array] = run8(6,1180,1780,ipfile);

cd  /home/sergio/HITRAN2UMBCLBL/LBLRTM
[xw,xdglab,xdlblrtm] = driver_glab_lblrtm_self_MANYLAY(6,1180,1780,ipfile,-1);
semilogy(outwave,out_array,xw,xdlblrtm)

cd ~/MATLABCODE/QUICKTASKS_TELECON/CrIS_gascell_Jan2020/
save ch4_cell1.mat out_array outwave xw xdglab xdlblrtm 
