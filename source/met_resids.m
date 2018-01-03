
% get values from report tex source

COs2 = [
   -4.6499    2.0666   10.8499        7  4  1
  -10.0749         0    1.0333        8  5  2
    2.3250    0.2583    0.5167        9  6  3
];

CH4s2 = [
   -4.3916    2.0666   11.1082        7  4  1
  -11.1082         0    1.0333        8  5  2
    0.2583   -1.0333         0        9  6  3
];

NH3s2 = [
   -8.7832    0.2583    7.2333        7  4  1
   -9.8166         0   -0.5167        8  5  2
   -0.5167         0   -0.5167        9  6  3
];

CO2s2 = [
   -9.0416    1.5500    6.9749        7  4  1
  -12.6582         0   -3.1000        8  5  2
   -3.1000   -1.0333   -3.8750        9  6  3
];

COs1 = [
   -3.6172    1.2918   10.0764        7  4  1
   -9.8181         0    0.2584        8  5  2
    4.1339         0    1.0335        9  6  3
];

CH4s1 = [
   -4.3923    2.3253    9.5597        7  4  1
  -10.0764         0    0.7751        8  5  2
    1.0335   -0.5167   -1.2918        9  6  3
];

NH3s1a = [
   -6.2009    0.7751    7.7511        7  4  1
   -7.4927         0   -0.7751        8  5  2
    3.1004    1.0335    1.0335        9  6  3
];

NH3s1b = [
   -8.0095         0    5.6841        7  4  1
   -9.3013         0   -1.8086        8  5  2
    0.2584         0   -1.5502        9  6  3
];

CO2s1 = [
    -12.14    -2.33     3.62         7   4   1
    -12.14     0.00    -5.94         8   5   2
     -4.13    -2.07    -4.39         9   6   3
];

% do some comparisons

fprintf(1, 'CO residual comparison\n')
fprintf(1, 'COs2 - COs1\n')
wprint(COs2 - COs1)
fprintf(1, 'COs2 - CH4s2\n')
wprint(COs2 - CH4s2)
fprintf(1, 'COs2 - NH3s2\n')
wprint(COs2 - NH3s2)
fprintf(1, '\n')

fprintf(1, 'CH4 residual comparison\n')
fprintf(1, 'CH4s2 - CH4s1\n')
wprint(CH4s2 - CH4s1)
fprintf(1, 'CH4s2 - COs2\n')
wprint(CH4s2 - COs2)
fprintf(1, 'CH4s2 - NH3s2\n')
wprint(CH4s2 - NH3s2)
fprintf(1, '\n')

fprintf(1, 'NH3 residual comparison\n')
fprintf(1, 'NH3s2 - NH3s1b\n')
wprint(NH3s2 - NH3s1b)
fprintf(1, 'NH3s2 - COs2\n')
wprint(NH3s2 - COs2)
fprintf(1, 'NH3s2 - CH4s2\n')
wprint(NH3s2 - CH4s2)
fprintf(1, '\n')

fprintf(1, 'CO2 residual comparison\n')
fprintf(1, 'CO2s2 - NH3s2\n')
wprint(CO2s2 - NH3s2)
fprintf(1, 'CO2s2 - COs2\n')
wprint(CO2s2 - COs2)
fprintf(1, 'CO2s2 - CH4s2\n')
wprint(CO2s2 - CH4s2)


