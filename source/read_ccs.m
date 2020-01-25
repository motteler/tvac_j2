%
%  read_ccs - read and tabulate selected CCS fields
%
% loop on a day's worth of TVAC CCS files and tabulate HTBB temps,
% gas cell temp, and gas cell pressure.  does an overview plot after
% the tabulation
%

clear all

% get the date
dd = input('2 digit date > ', 's');

% local TVAC data home
p1 = '/asl/gravite/j2cris/readonly/extracted/hourly_archives/J2';

% matlab globbing for test data (set date here)
p2 = 'TEM_Collection/CCS/Collection/2020/01_Jan/%s/*/*.ccs';
p2 = sprintf(p2, dd);

% matlab style directory records
p3 = fullfile(p1, p2);
tdir = dir(p3);
nfile = length(tdir);

% initialize saved values
htbb_temp_a_val = [];
htbb_temp_b_val = [];
inficon_press_val = [];
gas_cell_temp_val = [];

htbb_temp_a_time = [];
htbb_temp_b_time = [];
inficon_press_time = [];
gas_cell_temp_time = [];

% loop on css files
for i = 1 : nfile

  d1 = importdata(fullfile(tdir(i).folder, tdir(i).name));

  for j = 1 : length(d1.data)

    % get tlm_id as a string
    tlm_id = d1.textdata(j+1,1);
    tlm_id = tlm_id{1};

    switch tlm_id
      case '200008'
        htbb_temp_a_val = [htbb_temp_a_val, d1.data(j,2)];
        htbb_temp_a_time = [htbb_temp_a_time, datenum(d1.textdata(j+1,2))];
      case '200009'
        htbb_temp_b_val = [htbb_temp_b_val, d1.data(j,2)];
        htbb_temp_b_time = [htbb_temp_b_time, datenum(d1.textdata(j+1,2))];
      case '200018'
        inficon_press_val = [inficon_press_val, d1.data(j,2)];
        inficon_press_time = [inficon_press_time, datenum(d1.textdata(j+1,2))];
      case '200022'
        gas_cell_temp_val = [gas_cell_temp_val, d1.data(j,2)];
        gas_cell_temp_time = [gas_cell_temp_time, datenum(d1.textdata(j+1,2))];
    end
  end
end

clear d1

% convert to datetime
htbb_temp_a_date = datetime(htbb_temp_a_time, 'ConvertFrom', 'datenum');
htbb_temp_b_date = datetime(htbb_temp_b_time, 'ConvertFrom', 'datenum');
inficon_press_date = datetime(inficon_press_time, 'ConvertFrom', 'datenum');
gas_cell_temp_date = datetime(gas_cell_temp_time, 'ConvertFrom', 'datenum');

figure(1); clf
subplot(3,1,1)
plot(htbb_temp_a_date, htbb_temp_a_val, ...
     htbb_temp_b_date, htbb_temp_b_val, 'linewidth', 2)
ylim([310, 370]);
title('HTBB Temperatures')
% legend('A', 'B', 'location', 'southwest')
  legend('A', 'B', 'location', 'northeast')
ylabel('degrees (K)')
grid on

subplot(3,1,2)
plot(inficon_press_date, inficon_press_val, 'linewidth', 2)
ylim([0, 110]);
title('gas cell pressure')
ylabel('Torr')
grid on

subplot(3,1,3)
plot(gas_cell_temp_date, gas_cell_temp_val)
ylim([14.6, 15.4]);
title('gas cell temperature')
ylabel('degrees (C)')
grid on

saveas(gcf, sprintf('css_summary_%s_jan', dd), 'png')
saveas(gcf, sprintf('css_summary_%s_jan', dd), 'fig')

save(sprintf('read_ccs_%s', dd));

