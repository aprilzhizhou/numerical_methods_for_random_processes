Consider the following euqaiton for a Brownian ratchet

$$ dX = f(X)dt + dF \mbox{ with } X(0) = 0. \quad (1)$$ 

Here $f(x) = -dV(x)/dx$ is a force field due to a asymmetric periodic potential 
and $dF$ is a random applied force. 
In this project we will take $f(x) = (\cos{x})^{16}/K -1/2\pi$ and solve equation (1) using the Euler-Maruyama scheme.

1. We simulate (1) with $dF = \sigma dW$ with $W$ the Wiener process. 
`main_1a` plots different trajectories of $X(t)$ with $t = 1000, M = 1000, N = 5000,$ and the mean and standard deviation of $X(t)$ across $M=1000$ trials. `main_1a_iii` plots the histogram of potential $V(X(T))$ and `semilogy` of the histogram.   
2. We simulate (1) with $dF = G dt$ with    $dG = -\frac{1}{\tau} G dt + \frac{1}{\sqrt{\tau}} \tilde{\sigma} dW.$  This equation describes the Ornstein-Uhlenbeck process. 
The dependence of the noise strength on the time scale $\tau$ is chosen such that
the variance of $G$ is independent of $\tau$. We use $\tilde{\sigma} = 0.5$ and $G(0) = 0$.
`main_1b` plots different trajectories of $X(t)$ and the mean and standard deviation of $X(t)$ across $M$ trials. `main_1b_weakError ` computes and plots the estimated weak error against step size $\Delta t$. `main_1b_ii` plots the auto-correlation function (using `xcov` and average over 100 trials). `main_1b_iii` computes $\langle X(T)\rangle/T$ as a function of $\tau$ for $0.1 < \tau < 40$, $T = 5000$ and $\Delta t= 0.25$. The result is shown in a `loglog` plot.
