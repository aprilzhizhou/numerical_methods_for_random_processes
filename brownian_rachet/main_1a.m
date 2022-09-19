clear
%% initialization 
K = 6435*pi/16384; 
f = @(x) cos(x).^16/K - 1/(2*pi);
% randn('state',100);
del = 1;
Tinit = 0; Tend = 1000;
N = Tend*10; M =12000;
dt = (Tend-Tinit)/N; 
X = zeros(N,M);
X(1) = 0;

%% Weiner process 
dW = sqrt(dt)*randn(N,M); 
% W = cumsum(dW); 
tic
for n = 1:N
    X(n+1,:) = X(n,:) + f(X(n,:))*dt + del*dW(n,:);
end
toc

STDvec = std(X');
Evec = mean(X');
avRate = Evec(end)/Tend;

plot1a

stdMean = (std(X(end,:))/Tend)/sqrt(M);
fprintf('The standard error of mean(X(is)) is %8.8f\n',stdMean)

fprintf('The average rate is %8.8f\n',avRate)