function [] = ICsmultiple()
%ICSMULTIPLE Summary of this function goes here
%   Detailed explanation goes here

load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ncellsqrt.mat count ncell
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\T.mat T;

ni = zeros(ncell,1);
gi = zeros(ncell,1);
erki = zeros(ncell,1);
fri = zeros(ncell,1);
si = zeros(ncell,1);
fsi = zeros(ncell,1);
%fpi = zeros(ncell,1);
ti = real(T(1,count));

load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\N.mat N;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\G.mat G;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\FR.mat FR;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ERK.mat ERK;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\S.mat S;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\T.mat T;
load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\Fs.mat Fs;
%load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\Fp.mat Fp;

for i=1:25
    ni(i,1) = N(i,count);
    gi(i,1) = G(i,count);
    erki(i,1) = ERK(i,count);
    si(i,1) = S(i,count);
    fsi(i,1) = Fs(i,count);
    %fpi(i,1) = Fp(i,count);
    fri(i,1) = FR(i,count);
end

save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ni.mat','ni')
save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\gi.mat','gi')
save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\fri.mat','fri')
save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\erki.mat','erki')
save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\fsi.mat','fsi')
%save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\fpi.mat','fpi')
save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\si.mat','si')
save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ti.mat','ti','count','ncell')
end
