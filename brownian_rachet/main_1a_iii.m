clear
%% initialization 
K = 6435*pi/16384; 
f = @(x) cos(x).^16/K - 1/(2*pi);
V = @(x) -1/(12870*pi)*( 5720*sin(2*x) + 2002*sin(4*x) + 720*sin(6*x) +...
    455/2*sin(8*x) + 56*sin(10*x) + 10*sin(12*x) + 8/7*sin(14*x) + 1/16*sin(16*x)) ;
% randn('state',100);
del = 0.2;
Tinit = 0; Tend = 2000;
N = 5000; M =100;
dt = (Tend-Tinit)/N; 
X = zeros(N,M); V_all = zeros(N,M);
X(1,:) = 0; V_all(1,:) = V(X(1,:));

%% Weiner process 
dW = sqrt(dt)*randn(N,M); 
% W = cumsum(dW); 
tic
for n = 1:N
    X(n+1,:) = X(n,:) + f(X(n,:))*dt + del*dW(n,:);
    if Tinit + dt*N > 100
    V_all(n+1,:) = V(X(n+1,:));
    end
end
toc
figure (1)
h = histogram(V_all); 
title('histogram of potential $V$','interpreter','latex','fontsize',24)
set(gca,'fontsize',20)
% hold on
figure (2)
semilogy(h.BinEdges(1:end-1),h.Values,'r-','linewidth',3)
set(gca,'fontsize',20)

xlabel('$V$','interpreter','latex','fontsize',24)
ylabel('$\log{(P(V)}$','interpreter','latex','fontsize',24)