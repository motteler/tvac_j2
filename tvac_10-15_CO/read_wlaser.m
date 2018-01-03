
clear all

addpath /asl/packages/ccast/davet

tdir = '/asl/data/cris/test/2014-10-15_CO';

flist = dir(fullfile(tdir, '*T*.mat'));

for i = 1 : length(flist)

  pfile = fullfile(tdir, flist(i).name)
  load(pfile);

  if d1.packet.read_four_min_packet
    [wlaser, wtime] = metlaser(d1.packet.NeonCal);
  end

  clear d1
  datestr(wtime)
  wlaser

end

