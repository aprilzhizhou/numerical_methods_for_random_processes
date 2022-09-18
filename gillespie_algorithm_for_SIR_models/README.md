The SIR model is characterized by two transitions that the individuals undergo: the infection of an individual by its neighbors: 

$$S + I_{nb} \rightarrow 2S + I_{nb}, \quad \text{ with rate } r_{infect} $$

where $I_{nb}$ indicates infected neighbors, and the recovery (or death) of the infected individuals:

$$I \rightarrow \varnothing, \quad \text{ with rate } r_{remove}.$$

Consider a square $L\times L$ lattice of individuals who become infected by their neighbors with a rate

$$    r_{infect} = r_i I_{nb},$$

where $I_{nb}$ is the number of a adjacent individuals that are infected. 
For a site $(i,j)$, consider all 8 sites $(i+\Delta i , j + \Delta j)$ with $\Delta i, \Delta j \in \{-1,0,+1\}$ as neighbors. 
We use periodic boundary conditions (employing the Matlab function `\texttt{cirshift}`). 
We implement the model of three $L \times L$ matrices $\mathbf{S,I,R}$, which indicates which state the individual on each site is at given time. 
Thus, an infected individual $(i,j)$ corresponds to $S_{ij} = 0, I_{ij} = 1, R_{ij} = 0$, etc. 
We use the Gillespie algorithm to advance the state of the system. 
In each step, we keep track of the numbers of susceptible, infected, and removed individuals $(N_S, N_I, N_R)$. 
The simulation is terminated when no transition occur any more. 
