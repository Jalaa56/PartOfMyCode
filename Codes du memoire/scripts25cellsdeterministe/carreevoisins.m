function [m] = carreevoisins2(n)
%carreevoisins Summary of this function goes here
%   Detailed explanation goes here
% POUR CELLULES FORMANT ENSEMBLE UN CARREES
L=length(n);
C=sqrt(L);
m=zeros(L,5);
if2=(1:C:L);
if3=(C:C:L);
for i=1:L
    for j=1:5
        if j==1
            m(i,j)=n(i,j);
        elseif j==2
            if i~=if2(:)
                m(i,j)=n(i-1,1);
            else
                m(i,j)=n(i+C-1,1);
            end
        elseif j==3
            if i~=if3(:)
                m(i,j)=n(i+1,1);
            else
                m(i,j)=n(i-C+1,1);
            end
        elseif j==4
            if i<C+1
                m(i,j)=n(L-C+i,1);
            else
                m(i,j)=n(i-C,1);
            end
        else
            if i>L-C
                m(i,j)=n(C-L+i,1);
            else
                m(i,j)=n(i+C,1);
            end
        end
    end
end

%{
if n==1
    %moy autour de i, cinq cell en tout avec lui meme et cela depend de la
    %structure des cellules celle sur le papier et differente de la mienne.
elseif n==2
    %idem mais pour la cellule deux ici
end
%}

end

