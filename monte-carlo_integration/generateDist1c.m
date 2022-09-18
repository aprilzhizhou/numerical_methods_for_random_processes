alpha = 3/4;
A = 4*2^(1/4);
p = @(x) x.^(-alpha)./A; % given pdf 
F = @(x) 4*x.^(1/4)./A; % compute cdf 
Finv = @(u) (A*u/4).^4; % compute inverse cdf 

a = 0;
b = 2;
U = rand(M,1); % generate uniformly distributed random variable U (size: M by 1);
X = Finv(U); % desired random variable


xx = linspace(0,max(X),100);
% figure (1)
% plot(xx,p(xx),LW,lw); hold on
% plot(xx,F(xx),LW,lw);
% legend('p(x)','F(x)')
% xlabel('x')
% set(gca,'fontsize',18)
% 
% figure (2)
% histogram(X,'normalization','pdf'); hold on
% plot2 = plot(xx,p(xx),'k-',LW,lw); 
% legend(plot2,'p(x)')
% xlabel('x')
% set(gca,'fontsize',18)