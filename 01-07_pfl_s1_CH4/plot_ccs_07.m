%
% plot scrip for selected data, run after read_css
%

% view as hours from start of the day
dbase = datenum('7 Jan 2020');
htbb_temp_a_time = (htbb_temp_a_time - dbase) * 24;
htbb_temp_b_time = (htbb_temp_b_time - dbase) * 24;
inficon_press_time = (inficon_press_time - dbase) * 24;
gas_cell_temp_time = (gas_cell_temp_time - dbase) * 24; 

figure(1); clf
% t1 = 0; t2 = 24;
% t1 = 4.0; t2 = 4.3;
% t1 = 5.9; t2 = 6.2;
% t1 = 10.1; t2 = 10.4;
  t1 = 11.82; t2 = 12.07;

subplot(3,1,1)
plot(htbb_temp_a_time, htbb_temp_a_val, ...
     htbb_temp_b_time, htbb_temp_b_val, 'linewidth', 2)
% axis([t1,t2,310,370])
% axis([t1,t2,319,321])
  axis([t1,t2,358,361])
title('HTBB Temperatures')
legend('A', 'B', 'location', 'southwest')
ylabel('degrees (K)')
grid on; zoom on

subplot(3,1,2)
plot(inficon_press_time, inficon_press_val, 'linewidth', 2)
% axis([t1,t2,0,110])
  axis([t1,t2,44.5,44.8])
title('gas cell pressure')
ylabel('Torr')
grid on; zoom on

subplot(3,1,3)
plot(gas_cell_temp_time, gas_cell_temp_val)
axis([t1,t2,14.7,15.2])
title('gas cell temperature')
ylabel('degrees (C)')
grid on; zoom on

