
function igm = read_igm(band, mfile, sdir)

load(mfile);

switch upper(band)
  case 'LW'
    igm = d1.idata.LWES + 1i * d1.qdata.LWES;
    ix = find(d1.sweep_dir.LWES(5, :) == sdir);
  case 'MW'
    igm = d1.idata.MWES + 1i * d1.qdata.MWES;
    ix = find(d1.sweep_dir.MWES(5, :) == sdir);
  case 'SW'
    igm = d1.idata.SWES + 1i * d1.qdata.SWES;
    ix = find(d1.sweep_dir.SWES(5, :) == sdir);
  otherwise
    error(['bad band value ', band])
end

igm = igm(:, :, ix);

