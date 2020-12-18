function [dX_dt]=deterministddiff2(~,X)
% On va le faire pour 25 cells avec à l'aide des script
% avfgf4.m, carreevoisins.m et moyfgf4.m à 25 cellules.
% dX_dt=zeros(150,1);
% ncell=25;
% FS=zeros(25,1);
%mettre l'ensembles des paramètres.

vsa0=1;
Kisfr=2;
vsa=1;
KSa=1;
KSn=5;
ksd=1;

vsfs=3;
Kfs=5;
m=1;

vsg1=2;
vsg2=1;
vsn1=6;
vsn2=1;
vsfr1=8;
vsfr2=8;
% par vsf=6
va=2;
vi=3;
kdg=1;
kdn=1;
kdfr=1;
% par kdf=7
kag1=8;
kag2=5;
kan=5;
kafr=5;
% par Kaf=5
kin2=2;
kig=2;
kin1=8;
kifr=5;
Ka=7;
Ki=7;
Kd=2;

r=3;
s=4;
q=4;
u=3;
v=4;
w=4;
x=1;
y=1;

vsf=6;
z=4;
Kaf=5;
kdf=3;
vsf0=0;

gammaf=0;
% gammas=1;
gammasmax=7; 
gammas=randomvsa(gammasmax);
gammas=gammas';

%apparament il faudra les deployer comme on veut tant que on garde
%a l esprit que les condition initiale et les equation si dessous 
%doivent avoir le meme ordre

N(1:25)=X(1:25);
G(1:25)=X(26:50);
FR(1:25)=X(51:75);
ERK(1:25)=X(76:100);
S(1:25)=X(101:125);
Fs(1:25)=X(126:150);

Fp=avgfgf4(Fs');
Fp=Fp';

dN_dt=((vsn2*(N.^v./(kan^v+N.^v)))+(vsn1*(kin1^u./(kin1^u+ERK.^u)))).*(kin2^w./(kin2^w+G.^w))-kdn*N ; 
dG_dt=((vsg2*(G.^s./(kag2^s+G.^s)))+(vsg1*(ERK.^r./(kag1^r+ERK.^r)))).*(kig^q./(kig^q+N.^q))-kdg*G ; 
dFR_dt=(vsfr1*(kifr^x./(kifr^x+N.^x)).*(Kisfr./(Kisfr+S)))+(vsfr2*(G.^y./(kafr^y+G.^y)))-kdfr*FR ;
dERK_dt=(va*FR.*((Fp.*(1+gammaf))./((Fp.*(1+gammaf))+Kd)).*((1-ERK)./(1-ERK+Ka)))-vi*(ERK./(ERK+Ki)) ;
dS_dt=vsa0+((vsa*(1+gammas)).*(S./(KSa+S)).*(N./(KSn+N)))-ksd*S ; 
dFs_dt=vsf0+(vsf*(N.^z./(N.^z+Kaf^z))+vsfs*(S.^m./(Kfs^m+S.^m)))-kdf*Fs ; 

dX_dt=[dN_dt';dG_dt';dFR_dt';dERK_dt';dS_dt';dFs_dt'];

end

