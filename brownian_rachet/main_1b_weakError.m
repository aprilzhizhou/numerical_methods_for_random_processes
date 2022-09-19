clear
%% initialization
K = 6435*pi/16384;
f = @(x) cos(x).^16/K - 1/(2*pi);
V = @(x) -1/(12870*pi)*( 5720*sin(2*x) + 2002*sin(4*x) + 720*sin(6*x) +...
    455/2*sin(8*x) + 56*sin(10*x) + 10*sin(12*x) + 8/7*sin(14*x) + 1/16*sin(16*x)) ;

% randn('state',100);
sig2 = 0.5; sig = 0.2;
tau = 10;
Tinit = 0; Tend = 2;
M =2000;
NList = 2.^[1:8]; dtList = (Tend-Tinit)./NList;
EendList = [];
for kk = 1:length(NList)
    dt = dtList(kk); N = NList(kk);
    G = zeros(N,M); G(1,:) = 0;
    X = zeros(N,M); X(1,:) = 0;
    
    %% EM method with ON process
    dW = sqrt(dt)*randn(N,M);
    % W = cumsum(dW);
    for n = 1:N
        G(n+1,:) = G(n,:) - 1/tau*G(n,:)*dt + 1/sqrt(tau) * sig2*dW(n,:);
        X(n+1,:) = X(n,:) + f(X(n,:))*dt + G(n,:).*dt;
    end
    
    %     STDvec = std(X');
    Evec = mean(X');
    EendList = [ EendList; Evec(end)];
end

plot1b_weakError
% xlabel('$t$','interpreter','latex','fontsize',24)
% ylabel('$X(t)$','interpreter','latex','fontsize',24)