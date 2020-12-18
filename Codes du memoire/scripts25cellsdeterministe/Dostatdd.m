function []=Dostatdd()

%{
TI=[0 150];
ICs=zeros(150,1);
ICs(51:75,1)=ICs(51:75,1)+2.8;
ICs(76:125,1)=ICs(76:125,1)+0.25;
ICs(126:150,1)=ICs(126:150,1)+0.066;
gammasmax=0.001;
[t,X]=ode45(@deterministddiff,TI,ICs,gammasmax);
% prendre 0 0.000001 0.00001 0.0001 0.001 0.01 0.1 1 10 50 1 
%}

% 0.0001 0.001 0.01 0.1 0.5 1
m=zeros(3,100);
for j=1:100
    tr=zeros(25,3);
    DoDetermi
    load C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\X.mat X;
    L=length(X(:,1));
    for i=1:25
        if X(L,i)>1.7 && X(L,i+25)<0.3
            tr(i,1)=1;
        elseif X(L,i)<1.7 && X(L,i+25)>0.3 && X(L,i)>0.3 && X(L,i+25)<1.7
            tr(i,2)=1;
        elseif X(L,i)<0.3 && X(L,i+25)>1.7
            tr(i,3)=1;
        else
            tr(i,:)=26;
        end
    m(1,j)=sum(tr(:,1));
    m(2,j)=sum(tr(:,2));
    m(3,j)=sum(tr(:,3));
    end
end
save('C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\mfile.mat','m')
x=[1:3];
y=[mean(m(1,:)),mean(m(2,:)),mean(m(3,:))];
z=[std(m(1,:)),std(m(2,:)),std(m(3,:))];
ic95=[z(1,1)*1.96,z(1,2)*1.96,z(1,3)*1.96,];
fig=figure('Name','gammasmax valant 1','NumberTitle','on');
hold on
errorbar(x,y,ic95,'o')
xlim([0 4])
ylim([0 20])
hold off
saveas(fig,'C:\Users\32473\Documents\MATLAB\NEWfiles\sauvegardesimulations\gammasmax1-ordre-epiicmpreavecic95.jpg')
end

% text(5,0.5,['Ecart-type = ' num2str(ET)])