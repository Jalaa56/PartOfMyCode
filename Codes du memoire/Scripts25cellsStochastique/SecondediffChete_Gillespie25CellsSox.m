function []=SecondediffChete_Gillespie25CellsSox(ncell, vex, vsf, kaf, z, kdf, va, kd, ka, vi, ki, vsfr1, kifr, x, vsfr2, kafr, y, kdfr, vsn1, kin1, u, vsn2, kan, v, kin2, w, kdn, vsg1, kag1, r, vsg2, kag2, sg, q, kig, kdg, n0, g0, fr0, erk0, fs0, s0, vsa0, vsa, Kisfr, KSn, KSa, vsfs, Kfs, m, ksd, omega, tmax, ti)

% in output T, N, G, FR, ERK, Fs, Fp, S in images.

nokcell = (1:13).^2;
cocell=0;
    for ii=1:13
        save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\nokcellii.mat','nokcell','ii','cocell')
        if ncell==nokcell(ii)
            
            nmax = 1.0e+7;
            N = zeros(ncell,nmax);
            G = zeros(ncell,nmax);
            FR = zeros(ncell,nmax);
            ERK = zeros(ncell,nmax);
            Fs = zeros(ncell,nmax);
            Fp = zeros(ncell,nmax);
            S = zeros(ncell,nmax);
            T = zeros(1,nmax);
            N(:,1) = n0(:,1)*omega;
            G(:,1) = g0(:,1)*omega;
            FR(:,1) = fr0(:,1)*omega;
            ERK(:,1) = erk0(:,1)*omega;
            Fs(:,1) = fs0(:,1)*omega;
            Fp(:,1) = fs0(:,1)*omega;
            S(:,1) = s0(:,1)*omega;
            n = n0*omega;
            g = g0*omega;
            fr = fr0*omega;
            erk = erk0*omega;
            fs = fs0*omega;
            s = s0*omega;
            vsa0=vsa0*omega;
            Kisfr=Kisfr*omega;
            vsa=vsa*omega;
            KSa=KSa*omega;
            KSn=KSn*omega;
            % ksd=1;
            vsfs=vsfs*omega;
            Kfs=Kfs*omega;
            % m=1;
            kig = kig*omega;
            %kdg = kdg*omeg;
            kag2 = kag2*omega;
            vsg2 = vsg2*omega;
            kag1 = kag1*omega;
            vsg1 = vsg1*omega;
            %kdn = kdn*omeg;
            kin2 = kin2*omega;
            kan = kan*omega;
            vsn2 = vsn2*omega;
            kin1 = kin1*omega;
            vsn1 = vsn1*omega;
            %kdfr = kdfr*omeg;
            kafr = kafr*omega;
            vsfr1 = vsfr1*omega;
            kifr = kifr*omega;
            vsfr2 = vsfr2*omega;
            ki = ki*omega;
            vi = vi*omega;
            ka = ka*omega;
            kd = kd*omega;
            %va = va*omeg;
            %kdf = kdf*omeg;
            kaf = kaf*omega;
            vsf = vsf*omega;
            vex = vex*omega;


            t = ti;
            count = 1;
            while count < nmax && t < tmax
                
                fp = avfgf4(Fs(:,count)); % moyenne des cinq cellules autour de la ieme.
                for i=1:ncell
                    if (omega-erk(i,1))/(ka+omega-erk(i,1))>=0
                        w1 = ((vsn2*(n(i,1)^v/(kan^v+n(i,1)^v)))+(vsn1*(kin1^u/(kin1^u+erk(i,1)^u))))*(kin2^w/(kin2^w+g(i,1)^w));
                        w2 = kdn*n(i,1);
                        w3 = ((vsg2*(g(i,1)^sg/(kag2^sg+g(i,1)^sg)))+(vsg1*(erk(i,1)^r/(kag1^r+erk(i,1)^r))))*(kig^q/(kig^q+n(i,1)^q));
                        w4 = kdg*g(i,1);
                        w5 = ((vsfr1*(kifr^x/(kifr^x+n(i,1)^x)))*(Kisfr/(Kisfr+s(i,1))))+(vsfr2*(g(i,1)^y/(kafr^y+g(i,1)^y)));
                        w6 = kdfr*fr(i,1);
                        w7 = va*fr(i,1)*(fp(i,1)/(kd+fp(i,1)))*((omega-erk(i,1))/(ka+omega-erk(i,1)));
                        w8 = vi*(erk(i,1)/(ki+erk(i,1)));
                        w9 = vex+(vsf*(n(i,1)^z/(kaf^z+n(i,1)^z)))+(vsfs*(s(i,1)^m/(Kfs^m+s(i,1)^m)));
                        w10 = kdf*fs(i,1);
                        w11 = vsa0+(vsa*(s(i,1)/(KSa+s(i,1)))*(n(i,1)/(KSn+n(i,1))));
                        w12 = ksd*s(i,1);
                 
                        
                    elseif (omega-erk(i,1))/(ka+omega-erk(i,1))<0
                        w1 = ((vsn2*(n(i,1)^v/(kan^v+n(i,1)^v)))+vsn1*(kin1^u/(kin1^u+erk(i,1)^u)))*(kin2^w/(kin2^w+g(i,1)^w));
                        w2 = kdn*n(i,1);
                        w3 = ((vsg2*(g(i,1)^sg/(kag2^sg+g(i,1)^sg)))+vsg1*(erk(i,1)^r/(kag1^r+erk(i,1)^r)))*(kig^q/(kig^q+n(i,1)^q));
                        w4 = kdg*g(i,1);
                        w5 = ((vsfr1*(kifr^x/(kifr^x+n(i,1)^x)))*(Kisfr/(Kisfr+s(i,1))))+(vsfr2*(g(i,1)^y/(kafr^y+g(i,1)^y)));
                        w6 = kdfr*fr(i,1);
                        w7 = 0;
                        w8 = vi*(erk(i,1)/(ki+erk(i,1)))+va*fr(i,1)*(fp(i,1)/(kd+fp(i,1)))*abs((omega-erk(i,1))/(ka+omega-erk(i,1)));
                        w9 = vex+(vsf*(n(i,1)^z/(kaf^z+n(i,1)^z)))+(vsfs*(s(i,1)^m/(Kfs^m+s(i,1)^m)));
                        w10 = kdf*fs(i,1);
                        w11 = vsa0+(vsa*(s(i,1)/(KSa+s(i,1)))*(n(i,1)/(KSn+n(i,1))));
                        w12 = ksd*s(i,1);
                   
                    else
                        fprintf('Erreur à arranger')
                    end
                    if i==1
                        cttot=0;
                    end
                    ct=w1+w2+w3+w4+w5+w6+w7+w8+w9+w10+w11+w12;
                    cttot=cttot+ct;

                    z2 = rand();

                    random = z2 * ct;
                    if random < w1
                    n(i,1) = n(i,1) + 1;
                    elseif random < w1+w2
                    n(i,1) = n(i,1) - 1;
                    elseif random < w1+w2+w3
                    g(i,1) = g(i,1) + 1;
                    elseif random < w1+w2+w3+w4
                    g(i,1) = g(i,1) - 1;
                    elseif random < w1+w2+w3+w4+w5
                    fr(i,1) = fr(i,1) + 1;
                    elseif random < w1+w2+w3+w4+w5+w6
                        if fr(i,1)<1
                            fr(i,1)=0;
                        else
                        fr(i,1) = fr(i,1) - 1;
                        end
                    elseif random < w1+w2+w3+w4+w5+w6+w7
                    erk(i,1) = erk(i,1) + 1;
                    elseif random < w1+w2+w3+w4+w5+w6+w7+w8
                        if erk(i,1)<1
                            erk(i,1)=0;
                        else
                        erk(i,1) = erk(i,1) - 1;
                        end
                    elseif random < w1+w2+w3+w4+w5+w6+w7+w8+w9
                    fs(i,1) = fs(i,1) + 1;
                    elseif random < w1+w2+w3+w4+w5+w6+w7+w8+w9+w10
                        if fs(i,1)<1
                            fs(i,1)=0;
                        else
                            fs(i,1) = fs(i,1) - 1;
                        end
                    elseif random < w1+w2+w3+w4+w5+w6+w7+w8+w9+w10+w11
                        s(i,1)=s(i,1)+1;
                    elseif random < w1+w2+w3+w4+w5+w6+w7+w8+w9+w10+w11+w12
                        if s(i,1)<1
                            s(i,1)=0;
                        else
                            s(i,1) = s(i,1)-1;
                        end
                    else
                        talerte = 'erreur à résoudre\n';
                        fprintf(talerte)
                    end

                    N(i,count+1) = n(i,1);
                    G(i,count+1) = g(i,1);
                    FR(i,count+1) = fr(i,1);
                    ERK(i,count+1) = erk(i,1);
                    Fs(i,count+1) = fs(i,1);
                    Fp(i,count+1) = fp(i,1);
                    S(i,count+1) = s(i,1);

                end
                cttot=cttot/ncell;
                z1 = rand();
                dt = -(1.0/cttot)*log(z1);
                t = t + dt;
                T(1,count+1) = t;
                count = count + 1;
                
            end
            

            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ncellsqrt.mat','count','ncell')
            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\T.mat','T')
            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\N.mat','N')
            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\G.mat','G')
            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\FR.mat','FR')
            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ERK.mat','ERK')
            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\Fs.mat','Fs')
            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\Fp.mat','Fp')
            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\S.mat','S')

            clearvars
            clear global
            clear variables

            load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ncellsqrt.mat count ncell
            load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\T.mat T;
            maxt=real(max(T(1,:)))+1;
            sqrtncell=sqrt(ncell);

            Gg=T;
            T=zeros(1,count);
            T(1,1:count)=Gg(1,1:count);
            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\T.mat','T')

            formatSpec = 'Number of reactions:%7.0f\n';
            fprintf(formatSpec,count)

            save('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ncellsqrt.mat','maxt','count','ncell','sqrtncell')

            load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\N.mat N;
            load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\G.mat G;
            fig=figure('Name','EVOLUTION TEMPORELLE DE NANOG ET GATA6','NumberTitle','on');
            hold on
            for i=1:ncell
                subplot(sqrtncell,sqrtncell,i)
                hold on
                plot(T(1,:),N(i,1:count),'r')
                plot(T(1,:),G(i,1:count),'b')
                xlim([0 maxt])
                ylim([min(min(N(i,:)),min(G(i,:))) max(max(N(i,:)),max(G(i,:)))+1])
                xlabel('Time')
                ylabel('N,G')
                hold off
            end

            hold off
            saveas(fig,'C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\EVOLUTION TEMPORELLE DE NANOG ET GATA6.jpg')
            close all

            fig=figure('Name','EVOLUTION DE GATA6 EN FONCTION DE NANOG','NumberTitle','on');
            hold on
            for i=1:ncell
                subplot(sqrtncell,sqrtncell,i)
                hold on
                plot(N(i,1:count), G(i,1:count), 'g')
                xlabel('N')
                ylabel('G')
                xlim([min(N(i,:)) max(N(i,:))+1])
                ylim([min(G(i,:)) max(G(i,:))+1])
                hold off
            end

            hold off
            saveas(fig,'C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\EVOLUTION DE GATA6 EN FONCTION DE NANOG.jpg')

            clear N
            clear G
            close all

            load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\FR.mat FR;
            load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ERK.mat ERK;
            fig=figure('Name','EVOLUTION TEMPORELLE DE FGFR2 ET DE ERK','NumberTitle','on');
            hold on
            for i=1:ncell
                minfgfeterk=min(min(FR(i,:)),min(ERK(i,:)));
                maxfgfeterk=max(max(FR(i,:)),max(ERK(i,:)))+1;
                subplot(sqrtncell,sqrtncell,i)
                hold on
                plot(T(1,:),FR(i,1:count),'g')
                plot(T(1,:),ERK(i,1:count),'b')
                xlim([0 maxt])
                ylim([minfgfeterk maxfgfeterk])
                xlabel('Time')
                ylabel('FR,ERK')
                hold off
            hold off
            end
            saveas(fig,'C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\EVOLUTION TEMPORELLE DE FGFR2 ET DE ERK.jpg')
            clear ERK
            clear FR
            close all
            
            load C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\S.mat S;
            fig=figure('Name','EVOLUTION TEMPORELLE DE SOX2','NumberTitle','on');
            hold on
            for i=1:ncell
                minSox=min(S(i,:));
                maxSox=max(S(i,:))+1;
                subplot(sqrtncell,sqrtncell,i)
                hold on
                plot(T(1,:),S(i,1:count),'r')
                xlim([0 maxt])
                ylim([minSox maxSox])
                xlabel('Time')
                ylabel('Sox2')
                hold off
            hold off
            end
            
            saveas(fig,'C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\EVOLUTION TEMPORELLE DE SOX2.jpg')
            
            clearvars
            close all

            plotfsfp

            displaytheplots
            
            load('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\nokcellii.mat','nokcell','ii','cocell')
            load('C:\Users\32473\Documents\MATLAB\gill\Sauvegarde\ncellsqrt.mat','ncell')
        elseif ncell~=nokcell(ii)
            cocell=cocell+1;
            if cocell==13
                textealerte = 'ncell must be a squared number';
                fprintf(textealerte)
            end
        end
    end
end
