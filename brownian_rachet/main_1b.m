clear
%% initialization 
K = 6435*pi/16384; 
f = @(x) cos(x).^16/K - 1/(2*pi);
V = @(x) -1/(12870*pi)*( 5720*sin(2*x) + 2002*sin(4*x) + 720*sin(6*x) +...
    455/2*sin(8*x) + 56*sin(10*x) + 10*sin(12*x) + 8/7*sin(14*x) + 1/16*sin(16*x)) ;

% randn('state',100);
sig2 = 0.5; sig = 0.2;
tau = 40;
Tinit = 0; Tend = 1000;
N = Tend*2; M =100;
dt = (Tend-Tinit)/N; 
G = zeros(N,M); G(1,:) = 0;
X = zeros(N,M); X(1,:) = 0;

% figure (1)
% xplot = X(1,:); V_all(1,:) = V(X(1,:));
% h=plot((xplot),V(mean(xplot')),'linewidth',2);
% set(h,'XData',xplot,'YData',yplot);

%% EM method with Ornstein-Uhlenbeck process
dW = sqrt(dt)*randn(N,M); 
for n = 1:N
    G(n+1,:) = G(n,:) - 1/tau*G(n,:)*dt + 1/sqrt(tau) * sig2*dW(n,:);
    X(n+1,:) = X(n,:) + f(X(n,:))*dt + G(n,:).*dt;
    Xplot = X(1:n+1,:);
%     V_all = V(Xplot);
%     set(h,'XData',Xplot,'YData',V_all(1:n+1,:));
%     pause(0);
end


% plot(X,V(X))
STDvec = std(X');
Evec = mean(X');

plot1b

