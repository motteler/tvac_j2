%
% plot scrip for selected data, run after read_css
%

% view as hours from start of the day
dbase = datenum('7 Jan 2020');
htbb_temp_a_hour = (htbb_temp_a_time - dbase) * 24;
htbb_temp_b_hour = (htbb_temp_b_time - dbase) * 24;
inficon_press_hour = (inficon_press_time - dbase) * 24;
gas_cell_temp_hour = (gas_cell_temp_time - dbase) * 24; 

% 22:46:22  HTBB A 319K, significant droop, cell empty
% 22:59:49  HTBB B 318.5K
% 
% 23:58:17
% 00:11:17
% 
% 02:21:09
% 02:33:43
% 
% 02:58:03
% 03:11:02

% times above for a 24 hour axis
  t1 = 22 + 47/60;   t2 = 22 + 59/60;
% t1 = 23 + 59/60;   t2 =  0 + 11/60;

% t1 = 0;            t2 =  0 + 11/60;
% t1 =  2 + 22/60;   t2 =  2 + 33/60;
% t1 =  2 + 59/60;   t2 =  3 + 11/60;

figure(2); clf
subplot(3,1,1)
plot(htbb_temp_a_hour, htbb_temp_a_val, ...
     htbb_temp_b_hour, htbb_temp_b_val, 'linewidth', 2)
  axis([t1,t2,310,370])
% axis([t1,t2,319,321])
% axis([t1,t2,358,361])
title('HTBB Temperatures')
legend('A', 'B', 'location', 'southwest')
ylabel('degrees (K)')
grid on; zoom on

subplot(3,1,2)
plot(inficon_press_hour, inficon_press_val, 'linewidth', 2)
  axis([t1,t2,0,110])
% axis([t1,t2,44.9, 45.2])
title('gas cell pressure')
ylabel('Torr')
grid on; zoom on

subplot(3,1,3)
plot(gas_cell_temp_hour, gas_cell_temp_val)
axis([t1,t2,14.7,15.2])
title('gas cell temperature')
ylabel('degrees (C)')
grid on; zoom on

