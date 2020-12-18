clc
close all
clearvars

ICsmultiple;

load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ni.mat ni;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\gi.mat gi;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\fri.mat fri;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\erki.mat erki;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\si.mat si;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ti.mat ti ncell;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\fsi.mat fsi;

vex = 0; %0
vsf = 6; %0.6
kaf = 5;
z = 4;
kdf = 3; %0.0825 (0.077) vari sur article, var importante   0.09table arti
va = 2;
kd = 2;
ka = 1
vi = 8;
ki = 7;
vsfr1 = 8;
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
kag1 = 8;
r = 3;
vsg2 = 1; %1
kag2 = 5;
sg = 4;
q = 4;
kig = 2;
kdg = 1;

omega = 30000; %500
tmax = 300;
% gammasmax=0.2117;

vsa0=1;
Kisfr=2;
vsa=1;
KSa=1;
KSn=5;
ksd=1;
vsfs=3;
Kfs=5;
m=1;

ni = ni/omega;
gi = gi/omega;
erki = erki/omega;
fri = fri/omega;
si = si/omega;
fsi = fsi/omega;

SecondediffChete_Gillespie25CellsSox(ncell, vex, vsf, kaf, z, kdf, va, kd, ka, vi, ki, vsfr1, kifr, x, vsfr2, kafr, y, kdfr, vsn1, kin1, u, vsn2, kan, v, kin2, w, kdn, vsg1, kag1, r, vsg2, kag2, sg, q, kig, kdg, ni, gi, fri, erki, fsi, si, vsa0, vsa, Kisfr, KSn, KSa, vsfs, Kfs, m, ksd, omega, tmax, ti)