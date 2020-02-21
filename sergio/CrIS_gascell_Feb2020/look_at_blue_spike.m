disp('also look at /home/sergio/SPECTRA/tetHITEMP.m')
disp('also look at /home/sergio/SPECTRA/tetHITEMP.m')
disp('also look at /home/sergio/SPECTRA/tetHITEMP.m')

disp('calcs done for 1 cm length so multiply by something big eg 1000*10 = 1km')

clear all

ii = 1; load ../CrIS_gascell_Jan2020/gascell_1_gid_2_params_hitemp_feb5_2020_ip_4um.mat
        allUMBC(ii,:) = out_array; allLBLRTM(ii,:) = xdlblrtm';
ii = 2; load ../CrIS_gascell_Jan2020/gascell_2_gid_2_params_hitemp_feb5_2020_ip_4um.mat
        allUMBC(ii,:) = out_array; allLBLRTM(ii,:) = xdlblrtm';
ii = 3; load ../CrIS_gascell_Jan2020/gascell_3_gid_2_params_hitemp_feb5_2020_ip_4um.mat
        allUMBC(ii,:) = out_array; allLBLRTM(ii,:) = xdlblrtm';
ii = 4; load ../CrIS_gascell_Jan2020/gascell_4_gid_2_params_hitemp_feb5_2020_ip_4um.mat
        allUMBC(ii,:) = out_array; allLBLRTM(ii,:) = xdlblrtm';

addpath /home/sergio/MATLABCODE
w = xw; 
clear out_array outwave xdglab xdlblrtm xw

mult = 1000*100;
[fc,qcUMBC] = quickconvolve(w,mult*allUMBC,1,2);
[fc,qcLBLRTM] = quickconvolve(w,mult*allLBLRTM,1,2);

figure(1)
plot(fc,exp(-qcUMBC(:,1)),'b',fc,exp(-qcUMBC(:,2)),'g',fc,exp(-qcUMBC(:,3)),'k',fc,exp(-qcUMBC(:,4)),'r','linewidth',2)
  hl = legend('250 K','500 K','750 K','1000 K','location','best');
axis([2380 2420 0 1])
title('UMBC')

figure(2)
plot(fc,exp(-qcLBLRTM(:,1)),'b',fc,exp(-qcLBLRTM(:,2)),'g',fc,exp(-qcLBLRTM(:,3)),'k',fc,exp(-qcLBLRTM(:,4)),'r','linewidth',2)
  hl = legend('250 K','500 K','750 K','1000 K','location','best');
axis([2380 2420 0 1])
title('LBLRTM')

figure(3)
plot(fc,exp(-qcUMBC(:,1)),'bx-',fc,exp(-qcUMBC(:,2)),'gx-',fc,exp(-qcUMBC(:,3)),'kx-',fc,exp(-qcUMBC(:,4)),'rx-',...
     fc,exp(-qcLBLRTM(:,1)),'bo-',fc,exp(-qcLBLRTM(:,2)),'go-',fc,exp(-qcLBLRTM(:,3)),'ko-',fc,exp(-qcLBLRTM(:,4)),'ro-','linewidth',2)
  hl = legend('250 K','500 K','750 K','1000 K','location','best');
axis([2380 2420 0 1])
title('UMBC(+) and LBLRTM(o)')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

disp('ret to see 15 um'); pause
clear all

ii = 1; load ../CrIS_gascell_Jan2020/gascell_1_gid_2_params_hitemp_feb5_2020_ip.mat
        allUMBC(ii,:) = out_array; allLBLRTM(ii,:) = xdlblrtm';
ii = 2; load ../CrIS_gascell_Jan2020/gascell_2_gid_2_params_hitemp_feb5_2020_ip.mat
        allUMBC(ii,:) = out_array; allLBLRTM(ii,:) = xdlblrtm';
ii = 3; load ../CrIS_gascell_Jan2020/gascell_3_gid_2_params_hitemp_feb5_2020_ip.mat
        allUMBC(ii,:) = out_array; allLBLRTM(ii,:) = xdlblrtm';
ii = 4; load ../CrIS_gascell_Jan2020/gascell_4_gid_2_params_hitemp_feb5_2020_ip.mat
        allUMBC(ii,:) = out_array; allLBLRTM(ii,:) = xdlblrtm';

addpath /home/sergio/MATLABCODE
w = xw; 
clear out_array outwave xdglab xdlblrtm xw

mult = 1000*100;
[fc,qcUMBC] = quickconvolve(w,mult*allUMBC,0.5,0.5);
[fc,qcLBLRTM] = quickconvolve(w,mult*allLBLRTM,0.5,0.5);

figure(1)
plot(fc,exp(-qcUMBC(:,1)),'b',fc,exp(-qcUMBC(:,2)),'g',fc,exp(-qcUMBC(:,3)),'k',fc,exp(-qcUMBC(:,4)),'r','linewidth',2)
  hl = legend('250 K','500 K','750 K','1000 K','location','best');
axis([750 800 0 1])
title('UMBC')

figure(2)
plot(fc,exp(-qcLBLRTM(:,1)),'b',fc,exp(-qcLBLRTM(:,2)),'g',fc,exp(-qcLBLRTM(:,3)),'k',fc,exp(-qcLBLRTM(:,4)),'r','linewidth',2)
  hl = legend('250 K','500 K','750 K','1000 K','location','best');
axis([750 800 0 1])
title('LBLRTM')

figure(3)
plot(fc,exp(-qcUMBC(:,1)),'bx-',fc,exp(-qcUMBC(:,2)),'gx-',fc,exp(-qcUMBC(:,3)),'kx-',fc,exp(-qcUMBC(:,4)),'rx-',...
     fc,exp(-qcLBLRTM(:,1)),'bo-',fc,exp(-qcLBLRTM(:,2)),'go-',fc,exp(-qcLBLRTM(:,3)),'ko-',fc,exp(-qcLBLRTM(:,4)),'ro-','linewidth',2)
  hl = legend('250 K','500 K','750 K','1000 K','location','best');
axis([750 800 0 1])
title('UMBC(+) and LBLRTM(o)')

