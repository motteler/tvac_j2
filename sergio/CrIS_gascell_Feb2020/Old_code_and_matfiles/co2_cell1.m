%% 1 atm = 760 torr

%% ps = p = 45.05 torr, T = 15.00 C 

% matrix   profname       this contains N x 5 matrix : layernum,p,pp,t,x
%                          where column 1 = layer number
%                                column 2 = layer pressure (atm)
%                                column 3 = layer partial pressure (atm)
%                                column 4 = layer temperature (k)
%                                column 5 = layer gas amt (kilomoles/cm2)

% pV = nRT ==> q = (n/V)L = p/RT 

addpath /home/sergio/SPECTRA

%% see /home/sergio/SPECTRA/gascell2ip.m
%% p  = 5.93000000000000e-02
%% ps = 5.93000000000000e-02
%% T = 288.1500;
%% L = 1;

f1 = 605;
f2 = 1105;

[f1 f2]

ipfile = '/home/sergio/MATLABCODE/QUICKTASKS_TELECON/CrIS_gascell_Jan2020/co2_cell1';

cd  /home/sergio/SPECTRA
topts = struct;
topts.mainloop = +1; 
%topts.mainloop = -1; 

tic
for ii = 1 : (f2-f1)/100
  f1x = f1 + (ii-1)*100;
  f2x = f1x + 100;
  ind = (1:40000) + (ii-1)*40000;
  [xoutwave,xout_array] = run8co2(2,f1x,f2x,ipfile,topts);   %% need length(w) <= kmaxlen = 200000
  outwave(ind) = xoutwave;
  out_array(ind) = xout_array;
end
toc

cd  /home/sergio/HITRAN2UMBCLBL/LBLRTM
[xw,xdglab,xdlblrtm] = driver_glab_lblrtm_self_MANYLAY(2,f1,f2,ipfile,-1);
semilogy(outwave,out_array,'b',xw,xdlblrtm,'r')
plot(outwave,out_array./xdlblrtm','r')

cd ~/MATLABCODE/QUICKTASKS_TELECON/CrIS_gascell_Jan2020/
save co2_cell1.mat out_array outwave xw xdglab xdlblrtm 
