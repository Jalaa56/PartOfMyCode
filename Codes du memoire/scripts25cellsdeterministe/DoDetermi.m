function []=DoDetermi()
TI=[0 300];
% TI=[0 500];
ICs=zeros(150,1);
ICs(51:75,1)=ICs(51:75,1)+2.8;
ICs(76:125,1)=ICs(76:125,1)+0.25;
ICs(126:150,1)=ICs(126:150,1)+0.066;
[t,X]=ode23s(@deterministddiff,TI,ICs);
% ode45() est moins précis que l'ode23s().
% Pour FGF40=0.086 et au delà, Nanog est gagnant partout. En dessous pour 0.085 on
% revient à un pattern en poivre et sel sans grand changement. Pour FGF40
% valant en dessous de 0.066, donc 0.065 on a Nanog qui gagne partout. 

load C:\Users\32473\Documents\MATLAB\NEWfiles\randomvsafile.mat gammas;
save('C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\randomvsafile.mat','gammas')
delete randomvsafile.mat

% plot(t,X(:,1))
ncell=25;
sqrtncell=sqrt(ncell);
fig=figure('Name','EVOLUTION TEMPORELLE DE NANOG (en rouge) ET GATA6','NumberTitle','on');
hold on
for i=1:ncell
subplot(sqrtncell,sqrtncell,i)
hold on
plot(t,X(:,i),'r')
plot(t,X(:,(25+i)),'b')
%xlim([0 maxt])
%ylim([min(min(N(i,:)),min(G(i,:))) max(max(N(i,:)),max(G(i,:)))+1])
xlabel('Time')
ylabel('N,G')
hold off
end

hold off

saveas(fig,'C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\EVOLUTION TEMPORELLE DE NANOG (en rouge) ET GATA6.jpg')

%close all

fig=figure('Name','EVOLUTION DE NANOG EN FONCTION DE GATA6','NumberTitle','on');
hold on
for i=1:ncell
subplot(sqrtncell,sqrtncell,i)
hold on
plot(X(:,(25+i)), X(:,i), 'g')
xlabel('G')
ylabel('N')
%xlim([min(N(i,:)) max(N(i,:))+1])
%ylim([min(G(i,:)) max(G(i,:))+1])
hold off
end

hold off

saveas(fig,'C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\EVOLUTION DE NANOG EN FONCTION DE GATA6.jpg')

%clear N
%clear G
%close all


fig=figure('Name','EVOLUTION TEMPORELLE DE FGFR2 ET DE ERK (en bleu)','NumberTitle','on');
hold on
for i=1:ncell
%minfgfeterk=min(min(FR(i,:)),min(ERK(i,:)));
%maxfgfeterk=max(max(FR(i,:)),max(ERK(i,:)))+1;
subplot(sqrtncell,sqrtncell,i)
hold on
plot(t,X(:,(50+i)),'g')
plot(t,X(:,(75+i)),'b')
%xlim([0 maxt])
%ylim([minfgfeterk maxfgfeterk])
xlabel('Time')
ylabel('FR,ERK')
hold off
hold off
end

saveas(fig,'C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\EVOLUTION TEMPORELLE DE FGFR2 ET DE ERK (en bleu).jpg')

FS=[transpose(X(:,126));transpose(X(:,127));transpose(X(:,128));transpose(X(:,129));transpose(X(:,130));transpose(X(:,131));transpose(X(:,132));transpose(X(:,133));transpose(X(:,134));transpose(X(:,135));transpose(X(:,136));transpose(X(:,137));transpose(X(:,138));transpose(X(:,139));transpose(X(:,140));transpose(X(:,141));transpose(X(:,142));transpose(X(:,143));transpose(X(:,144));transpose(X(:,145));transpose(X(:,146));transpose(X(:,147));transpose(X(:,148));transpose(X(:,149));transpose(X(:,150))];
FP=zeros(ncell,length(t));
Fs=zeros(ncell,1);
Fp=zeros(ncell,1);

for j=1:length(t)
    Fs(:,1)=FS(:,j);
    Fp=avgfgf4(Fs);
    FP(:,j)=Fp(:,1);
end

save('C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\X.mat','X')
save('C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\t.mat','t')
save('C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\FP.mat','FP')
clearvars
close all
load C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\X.mat X;
load C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\t.mat t;
load C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\FP.mat FP;

ncell=25;
sqrtncell=sqrt(ncell);

fig=figure('Name','EVOLUTION TEMPORELLE DE FGF4 (en vert) ET DE FP (en rouge)','NumberTitle','on');
hold on
for i=1:ncell
    % minfsetfp=min(min(Fs(i,:)),min(Fp(i,:)));
    % maxfsetfp=max(max(Fs(i,:)),max(Fp(i,:)))+1;
    subplot(sqrtncell,sqrtncell,i)
    hold on
    plot(t,X(:,(125+i)),'g')
    plot(t(:),FP(i,:),'r')
    % xlim([0 maxt])
    % ylim([minfsetfp maxfsetfp])
    xlabel('Time')
    ylabel('FGF4,FP')
    hold off
hold off
end

saveas(fig,'C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\EVOLUTION TEMPORELLE DE FGF4 (en vert) ET DE FP (en rouge).jpg')

fig=figure('Name','EVOLUTION TEMPORELLE DE SOX2','NumberTitle','on');
hold on
for i=1:ncell
    subplot(sqrtncell,sqrtncell,i)
    hold on
    plot(t,X(:,(100+i)),'r')
    xlabel('Time')
    ylabel('Sox2')
    hold off
hold off
end

saveas(fig,'C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\EVOLUTION TEMPORELLE DE SOX2.jpg')

%{
clearvars
close all

plotfsfp

displaytheplots
%}