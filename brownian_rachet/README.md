Consider the following euqaiton for a Brownian ratchet

$$ dX = f(X)dt + dF \mbox{ with } X(0) = 0. \quad (1)$$ 

Here $f(x) = -dV(x)/dx$ is a force field due to a asymmetric periodic potential 
and $dF$ is a random applied force. 
In this project we will take $f(x) = (\cos{x})^{16}/K -1/2\pi$ and solve equation (1) using the Euler-Maruyama scheme.

1. We simulate (1) with $dF = \sigma dW$ with $W$ the Wiener process. 
2. We simulate (1) with $dF = G dt$ with 

$$     dG = -\frac{1}{\tau} G dt + \frac{1}{\sqrt{\tau}} \tilde{\sigma} dW.$$

This equation describes the Ornstein-Uhlenbeck process. 
The dependence of the noise strength on the time scale $\tau$ is chosen such that
the variance of $G$ is independent of $\tau$. We use $\tilde{\sigma} = 0.5$ and $G(0) = 0$.
