% figure (1)
% plot(Tinit:dt:Tend,X,'k-')
% set(gca,'fontsize',20)
% xlabel('$t$','interpreter','latex','fontsize',24)
% ylabel('$X(t)$','interpreter','latex','fontsize',24)
% 
% figure (2)
% plot(Tinit:dt:Tend,Evec,'linewidth',2);
% xlabel('$t$','interpreter','latex','fontsize',24)
% ylabel('$\mbox{Expected value}$','interpreter','latex','fontsize',24)
% set(gca,'fontsize',20)


figure (1)
% loglog(dtList,EendList,'--o','linewidth',2);
% set(gca,'fontsize',20)

relErrList = [];
for nn = 1:length(EendList)-1
    relErrList = [relErrList; (abs((EendList(nn) - EendList(nn+1)))) ];
    
end

plot(dtList(2:end),relErrList,'k-o','linewidth',2); 
hold on
plot(dtList(2:end),ones(size(NList(2:end)))*0.01,'k--','linewidth',2);
set(gca,'fontsize',20)

xlabel('$\Delta t$','interpreter','latex','fontsize',24)
ylabel('$\mbox{E}(X_{\Delta t}) - \mbox{E}(X_{\Delta t/2})$','interpreter','latex','fontsize',24)

relErrList

% plot(relErrList,'--o')
% xlabel('$t$','interpreter','latex','fontsize',24)
% ylabel('$X(t)$','interpreter','latex','fontsize',24)