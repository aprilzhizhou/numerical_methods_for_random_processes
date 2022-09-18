
p = @(x) exp(-x); % given pdf 
F = @(x) -exp(-x)+1; % comppute cdf 
Finv = @(u) -log(1-u); % compute inverse cdf 
U = rand(M,1); % generate uniformly distributed random variable U (size: M by 1);
X = Finv(U); % desired random variable

