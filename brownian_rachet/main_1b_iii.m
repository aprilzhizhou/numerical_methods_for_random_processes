clear
%% initialization 
K = 6435*pi/16384; 
f = @(x) cos(x).^16/K - 1/(2*pi);
V = @(x) -1/(12870*pi)*( 5720*sin(2*x) + 2002*sin(4*x) + 720*sin(6*x) +...
    455/2*sin(8*x) + 56*sin(10*x) + 10*sin(12*x) + 8/7*sin(14*x) + 1/16*sin(16*x)) ;

% randn('state',100);
sig2 = 0.5; sig = 0.2;
% tau = 10;
tauList = linspace(0.1,40,40);
Tinit = 0; Tend = 5000;
dt = 0.25;
N =  (Tend-Tinit)/dt; M =500;
G = zeros(N,M); G(1,:) = 0;
X = zeros(N,M); X(1,:) = 0;
XendList = [];

%% EM method with Ornstein-Uhlenbeck process
for tau = tauList
dW = sqrt(dt)*randn(N,M); 
for n = 1:N
    G(n+1,:) = G(n,:) - 1/tau*G(n,:)*dt + 1/sqrt(tau) * sig2*dW(n,:);
    X(n+1,:) = X(n,:) + f(X(n,:))*dt + G(n,:).*dt;
end
 Evec = mean(X');
 Xend = Evec(end)/Tend;
 XendList = [XendList; Xend];
end 

figure (1)
plot(tauList,XendList,'k-o','linewidth',2)
set(gca,'fontsize',20)
xlabel('$\tau$','interpreter','latex','fontsize',24)
ylabel('$\mbox{E}(X(T))/T$','interpreter','latex','fontsize',24)

figure (2)
loglog(tauList,XendList,'k-o','linewidth',2)
set(gca,'fontsize',20)
xlabel('$\log{\tau}$','interpreter','latex','fontsize',24)
ylabel('$log{ (\mbox{E}(X(T))/T )}$','interpreter','latex','fontsize',24)