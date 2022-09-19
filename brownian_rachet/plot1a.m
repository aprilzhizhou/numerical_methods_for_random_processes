figure (1)
plot(Tinit:dt:Tend,X(:,1:200:end),'linewidth',2)
set(gca,'fontsize',20)
xlabel('$t$','interpreter','latex','fontsize',24)
ylabel('$X(t)$','interpreter','latex','fontsize',24)

figure (2)
plot(Tinit:dt:Tend,STDvec,'k-','linewidth',2);
xlabel('$t$','interpreter','latex','fontsize',24)
ylabel('$\mbox{standard deviation}$','interpreter','latex','fontsize',24)
set(gca,'fontsize',20)

figure (3)
plot(Tinit:dt:Tend,Evec,'k','linewidth',2);
xlabel('$t$','interpreter','latex','fontsize',24)
ylabel('$\mbox{Expected value}$','interpreter','latex','fontsize',24)
set(gca,'fontsize',20)