clc
clearvars
close all

load('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ncellsqrt.mat')
load('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\T.mat')
load('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\Fs.mat')
load('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\Fp.mat')

formatSpec = 'Number of reactions:%7.0f\n';
fprintf(formatSpec,count)

fig=figure('Name','EVOLUTION TEMPORELLE DE FGF4 ET DE FP','NumberTitle','on');
hold on
for i=1:ncell
    minfsetfp=min(min(Fs(i,:)),min(Fp(i,:)));
    maxfsetfp=max(max(Fs(i,:)),max(Fp(i,:)))+1;
    subplot(sqrtncell,sqrtncell,i)
    hold on
    plot(T(1,:),Fs(i,1:count),'g')
    plot(T(1,:),Fp(i,1:count),'r')
    xlim([0 maxt])
    ylim([minfsetfp maxfsetfp])
    xlabel('Time')
    ylabel('FGF4,FP')
    hold off
hold off
end

saveas(fig,'C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\EVOLUTION TEMPORELLE DE FGF4 ET DE FP.jpg')

%{

figure('Name','EVOLUTION TEMPORELLE DE FGF4 ET DE FP','NumberTitle','on');
hold on
for i=1:ncell
    minfgfeterk=min(min(Fs(i,:)),min(Fp(i,:)));
    maxfgfeterk=max(max(Fs(i,:)),max(Fp(i,:)))+1;
    subplot(sqrtncell,sqrtncell,i)
    hold on
    plot(T(1,:),Fs(i,:),'g')
    plot(T(1,:),Fp(i,:),'r')
    xlim([0 maxt])
    ylim([minfgfeterk maxfgfeterk])
    xlabel('Time')
    ylabel('FGF4,FP')
    hold off
hold off
end
end

%}
