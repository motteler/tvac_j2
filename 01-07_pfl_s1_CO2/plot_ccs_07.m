%
% plot scrip for selected data, run after read_css
%

% view as hours from start of the day
dbase = datenum('7 Jan 2020');
htbb_temp_a_hour = (htbb_temp_a_time - dbase) * 24;
htbb_temp_b_hour = (htbb_temp_b_time - dbase) * 24;
inficon_press_hour = (inficon_press_time - dbase) * 24;
gas_cell_temp_hour = (gas_cell_temp_time - dbase) * 24; 

% 15:02:17  HTBB A 360.0K, cell empty
% 15:17:34  HTBB B 359.45K
% 
% 16:52:20  HTBB A 320.5K, cell empty
% 17:05:10  HTBB B 319.8K
% 
% 17:54:44  HTBB A 320.5K, cell full
% 18:08:09  HTBB B 319.8K, 45.05 torr, 15C
% 
% 19:43:20  HTBB A 360.0K, drifty, cell full 
% 19:57:50  HTBB B 359.5, 45.05 torr, 15.05C

% times above for a 24 hour axis
% t1 = 15 +  3/60;   t2 = 15 + 17/60;
% t1 = 16 + 53/60;   t2 = 17 +  5/60;
% t1 = 17 + 55/60;   t2 = 18 +  8/60;
  t1 = 19 + 44/60;   t2 = 19 + 57/60;

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

