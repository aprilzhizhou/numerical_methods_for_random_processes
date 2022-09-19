figure (1)
plot(Tinit:dt:Tend,X,'k-')
set(gca,'fontsize',20)
xlabel('$t$','interpreter','latex','fontsize',24)
ylabel('$X(t)$','interpreter','latex','fontsize',24)

figure (2)
plot(Tinit:dt:Tend,STDvec,'linewidth',2);
xlabel('$t$','interpreter','latex','fontsize',24)
ylabel('$\mbox{standard deviation}$','interpreter','latex','fontsize',24)
set(gca,'fontsize',20)

figure (3)
plot(Tinit:dt:Tend,Evec,'linewidth',2);
xlabel('$t$','interpreter','latex','fontsize',24)
ylabel('$\mbox{Expected value}$','interpreter','latex','fontsize',24)
set(gca,'fontsize',20)


figure (4)
plot(Evec,V(Evec),'linewidth',2);
set(gca,'fontsize',20)
xlabel('$X(T)$','interpreter','latex','fontsize',24)
ylabel('$V(X(t))$','interpreter','latex','fontsize',24)


% figure (5)
% plot(1:M,X(end,:),'linewidth',2);
% set(gca,'fontsize',20)
% xlabel('$M$','interpreter','latex','fontsize',24)
% ylabel('$X(T)$','interpreter','latex','fontsize',24)


% figure (1)
% plot(G)
% 
% figure (2)
% plot(X)