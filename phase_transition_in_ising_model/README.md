This program implements the metropolis algorithm for the Ising model on a square lattice of size $L \times L$ with periodic boundary conditions. 

`main_ising_a` plots the following quantities against temperature in the range $\tilde{T} \in [1.5,3]$ in steps of $\Delta \tilde{T} = 0.1$ for
 $H = 0, J=1, L = 25, t_{corr} = 200, N_{trial} = 400$: 

1. Energy per pin: $\langle U(\tilde{T}) \rangle = \frac{1}{L^2} \sum_{\vec{\sigma}} U(\vec{\sigma}) p (\vec{\sigma},\tilde{T}) $ 
2. Specific Heat: $\frac{1}{\tilde{T}^2} \left(  \langle U(\tilde{T})^2 \rangle - \langle U(\tilde{T}) \rangle^2 \right)$
3. Magnetization per pin: $m(\tilde{T}) = \langle \vert M(\vec{\sigma})\vert \rangle = \sum_{\vec{\sigma}} \vert M(\vec{\sigma}) \vert  p(\vec{\sigma},\tilde{T})$, where $M(\vec{\sigma}) = \frac{1}{L^2} \sum_{i,j} \sigma_{i,j}$;
4. Susceptibility: $\frac{1}{\tilde{T}} \left( \langle  M(\vec{\sigma})^2 \rangle - \langle \vert M(\vec{\sigma})\vert \rangle^2 \right)$
5. Fraction of accepted spin flips
7. Snapshots of the final spin configuration $\vec{\sigma}$

`main_ising_b` implements the metropolis algorithm for $L = 200$ and confirms the L. Onsager's theory that in the thermodynamic limit $L \rightarrow \infty$, 
the Ising model has a phase transition at a temperature $\tilde{T}$ such that $\tilde{T} > \tilde{T}_c$ the magnetization vanishes, while when $tilde{T} < \tilde{T}_c$
the magnetization increases continuously. 
