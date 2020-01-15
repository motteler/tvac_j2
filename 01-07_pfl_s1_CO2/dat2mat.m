
more off
clear all
addpath /home/motteler/cris/ccast/readers/MITreader380a

d1 = read_cris_ccsds('ET2.dat', 'btrim_test.mat');
save ET2 d1
clear all

d1 = read_cris_ccsds('ET1.dat', 'btrim_test.mat');
save ET1 d1
clear all

d1 = read_cris_ccsds('FT2.dat', 'btrim_test.mat');
save FT2 d1
clear all

d1 = read_cris_ccsds('FT1.dat', 'btrim_test.mat');
save FT1 d1
clear all

