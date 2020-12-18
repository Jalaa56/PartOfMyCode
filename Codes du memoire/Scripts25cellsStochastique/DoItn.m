clc
close all
clearvars

ti = 0;
ncell = 25;
vex = 0; %0
vsf = 0.6; %0.6
kaf = 5;
z = 4;
kdf = 3; %0.0825 (0.077) vari sur article, var importante   0.09table arti
va = 2;
kd = 2;
ka = 3;
vi = 3;
ki = 7;
vsfr1 = 2;
kifr = 5;
x = 1;
vsfr2 = 2;
kafr = 5;
y = 1;
kdfr = 1;
vsn1 = 6;
kin1 = 8;
u = 2;
vsn2 = 1; %1
kan = 5;
v = 4;
kin2 = 2;
w = 4;
kdn = 1;
vsg1 = 2;
kag1 = 2;
r = 3;
vsg2 = 1; %1
kag2 = 5;
sg = 4;
q = 4;
kig = 2;
kdg = 1;
n0 = zeros(25,1)+0; 
g0 = zeros(25,1)+0; 
fr0 = zeros(25,1)+8;    
erk0 = zeros(25,1)+5;    
fs0 = zeros(25,1)+6;     
s0 = zeros(25,1)+0.25;
omega = 30000; 
tmax = 100;
% gammasmax=21;

vsa0=1;
Kisfr=2;
vsa=1;
KSa=1;
KSn=5;
ksd=1;
vsfs=3;
Kfs=95;
m=1;

SecondediffChete_Gillespie25CellsSox(ncell, vex, vsf, kaf, z, kdf, va, kd, ka, vi, ki, vsfr1, kifr, x, vsfr2, kafr, y, kdfr, vsn1, kin1, u, vsn2, kan, v, kin2, w, kdn, vsg1, kag1, r, vsg2, kag2, sg, q, kig, kdg, n0, g0, fr0, erk0, fs0, s0, vsa0, vsa, Kisfr, KSn, KSa, vsfs, Kfs, m, ksd, omega, tmax, ti)
