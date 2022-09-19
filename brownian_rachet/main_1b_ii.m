clear
%% initialization 
K = 6435*pi/16384; 
f = @(x) cos(x).^16/K - 1/(2*pi);
V = @(x) -1/(12870*pi)*( 5720*sin(2*x) + 2002*sin(4*x) + 720*sin(6*x) +...
    455/2*sin(8*x) + 56*sin(10*x) + 10*sin(12*x) + 8/7*sin(14*x) + 1/16*sin(16*x)) ;

%randn('state',100);
sig2 = 0.5; sig = 0.2;
tau = 10;
Tinit = 0; Tend = 1000;
N = Tend*5; M =100;
dt = (Tend-Tinit)/N; 
G = zeros(N,M); G(1,:) = 0;
X = zeros(N,M); X(1,:) = 0;

% EM1b_ii_t ;
dW = sqrt(dt)*randn(N,M); 
for n = 1:N
    G(n+1,:) = G(n,:) - 1/tau*G(n,:)*dt + 1/sqrt(tau) * sig2*dW(n,:);
end

% g1= mean(G1'); g2 = mean(G2'); g = [g1' g2'];
autoc = xcov(G,100);
plot(-100:100,mean(autoc'),'k','linewidth',2); 
set(gca,'fontsize',20)
xlabel('time lag','fontsize',24,'interpreter','latex'); ylabel('autocorreltion','fontsize',24,'interpreter','latex')
xlim([-100,100])

% figure (1)
% plot(g1,'linewidth',2); hold on; plot(g2,'linewidth',2);
% legend({'$G(t)$','$G(\tilde{t})$'},'fontsize',20,'interpreter','latex')
% set(gca,'fontsize',20)
% 
% figure (2)
% plot(xcov(g1,g2),'k','linewidth',2);
% set(gca,'fontsize',20)
% title('autucorrelation','fontsize',24)