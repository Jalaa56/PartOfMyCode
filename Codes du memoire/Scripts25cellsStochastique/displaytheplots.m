clearvars
close all

A = imread('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\EVOLUTION TEMPORELLE DE NANOG ET GATA6.jpg');
B = imread('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\EVOLUTION DE GATA6 EN FONCTION DE NANOG.jpg');
C = imread('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\EVOLUTION TEMPORELLE DE FGFR2 ET DE ERK.jpg');
D = imread('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\EVOLUTION TEMPORELLE DE FGF4 ET DE FP.jpg');
E = imread('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\EVOLUTION TEMPORELLE DE SOX2.jpg');

figure('Name','EVOLUTION TEMPORELLE DE NANOG ET GATA6','NumberTitle','off');
imshow(A)
figure('Name','EVOLUTION DE GATA6 EN FONCTION DE NANOG','NumberTitle','off');
imshow(B)
figure('Name','EVOLUTION TEMPORELLE DE FGFR2 ET DE ERK','NumberTitle','off');
imshow(C)
figure('Name','EVOLUTION TEMPORELLE DE FGF4 ET DE FP','NumberTitle','off');
imshow(D)
figure('Name','EVOLUTION TEMPORELLE DE SOX2','NumberTitle','off');
imshow(E)
clear all