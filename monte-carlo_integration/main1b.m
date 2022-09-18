clear all
%% format 
LW = 'linewidth'; lw = 2;
FZ = 'fontsize'; fz = 25;

I_hatList = [];
ErrorList = [];
VarList = [];
StdList = [];
pList = 1:9; 

Alpha = [1/4 3/4];
I_exList = [gamma(3/4) gamma(1/4)];

for mode = 1
%% define functions 
alpha = Alpha(mode); 

g =@(x) x.^(-alpha);
I_ex = I_exList(mode);


%% Markov-Carlo
    
for p = pList
    M = 4^p;
    MList(p) = M;
    generateDist1b
% exprn

    [I_hat Error Var std] = MonteCarlo(X,M,g,I_ex); 
    I_hatList = [I_hatList; I_hat];
    ErrorList = [ErrorList; Error];
    VarList = [VarList; Var];
    StdList = [StdList; std];
end 

figure (1)
subplot(2,2,1)
plot(pList,I_hatList,'k',LW,lw); 
set(gca,'fontsize',18)
ylabel('$\hat{I}$','interpreter','latex',FZ,fz); xlabel('$p$','interpreter','latex',FZ,fz);
hold on 
plot(pList,I_ex*ones(size(pList)),'k--',LW,lw)

subplot(2,2,2)
loglog(MList,ErrorList,LW,lw)
table(I_hatList,ErrorList)
set(gca,'fontsize',18)
ylabel('log(Error)','interpreter','latex',FZ,fz); xlabel('log($M$)','interpreter','latex',FZ,fz);

slope = polyfit(log(pList),log(ErrorList)',1)


subplot(2,2,3)
loglog(MList,VarList,LW,lw)
table(I_hatList,VarList)
set(gca,'fontsize',18)
ylabel('log($\hat{\sigma}_I $)','interpreter','latex',FZ,fz); xlabel('log($M$)','interpreter','latex',FZ,fz);


subplot(2,2,4)
loglog(MList,StdList,LW,lw)
table(I_hatList,StdList)
set(gca,'fontsize',18)
ylabel('log(std$(\hat{I})$)','interpreter','latex',FZ,fz); xlabel('log($M$)','interpreter','latex',FZ,fz);

end