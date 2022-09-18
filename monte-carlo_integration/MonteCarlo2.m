function [I_hat,Error,Var,std] = MonteCarlo2(X,M,g,I_ex,xmax)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

I_hat = 1/M*sum(g(X));
Error = 1/(M)*sum( abs(I_ex-I_hat));
Var = sqrt( 1/(M*(M-1)).*sum((g(X)-I_hat).^2) )
mean = 1/M*sum(I_hat)
std = sqrt(sum( (I_hat - mean).^2 )/M    );
end

