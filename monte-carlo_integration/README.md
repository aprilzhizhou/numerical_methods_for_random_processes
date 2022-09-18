This program uses Monte-Carlo integration to evaluate integrals. The program uses $M$ sample points $X_j$ and determines the Monte-Carlo estimate $\hat{I}$
of the integral as well as an estimate for the standard error of the mean $\hat{\sigma}_I$. To understand the accuracy of the integration, the program obains 
$N=500$ estimates of $\hat{I}$ and $\hat{\sigma}_1$, then plots the mean across $N_{trial}$ of the absolute values of the error, i.e., 

$$ E_m = \frac{1}{N_{trial}} \sum_{j_{trial}}  | \hat{I}_{jtrial} -  I_{exact}| , $$

as well as the corresponding standard deviation sdt$(\hat{I})$ and the average $\langle \hat{\sigma}_I \rangle$ of $\hat{\sigma}_I$ across the $N_{trials}$ 
as a function of $M = 4^p$ (or $p$).

1. `main1a` evaluates $\int_0^\infty \cos x e^{-x} dx$
2. `main1a` evaluates $\int_0^\infty x^{-\alpha} e^{-x} dx$
1. `main1a` evaluates $\int_0^{x_{max}}  x^{-\alpha} e^{-x} dx$ with $\alpha = \frac{3}{4}$ and $x_{max} = 2.$
