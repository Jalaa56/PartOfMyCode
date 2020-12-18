function [gammas]=randomvsa(gammasmax)

if exist('randomvsafile.mat')
load C:\Users\32473\Documents\MATLAB\NEWfiles\randomvsafile.mat gammas;
else

    gammas=zeros(25,1);

    for i=1:25
        probuni=rand();
        % pas random uniforme voir projection fact=cos(pi*probuni);
        fact=(2*probuni)-1;
        gammas(i,1)=fact*gammasmax;
    end
    
    save('C:\Users\32473\Documents\MATLAB\NEWfiles\randomvsafile.mat','gammas')
end
end