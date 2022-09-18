clear all
%% format 
LW = 'linewidth'; lw = 2;
FZ = 'fontsize'; fz = 25;

I_hatList = [];
ErrorList = [];
VarList = [];
StdList = [];
pList = 1:9; 

I_ex = 3.563;
alpha = 3/4;
%% define functions 
A = 4*2^(1/4);
g =@(x) exp(-x)*A;
xmax =2;


%% Markov-Carlo
    
for p = pList
    M = 4^p;
    MList(p) = M; 
    generateDist1c
%     I_hat = 1/M*sum(g(X));
    [I_hat Error Var std] = MonteCarlo2(X,M,g,I_ex,xmax); 
    I_hatList = [I_hatList; I_hat];
    ErrorList = [ErrorList; Error];
    VarList = [VarList; Var];
    StdList = [StdList; std];
end 


figure (3)
subplot(2,2,1)
plot(MList,I_hatList,'k',LW,lw); 
set(gca,'fontsize',18)
ylabel('$\hat{I}$','interpreter','latex',FZ,fz); xlabel('$M$','interpreter','latex',FZ,fz);
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

