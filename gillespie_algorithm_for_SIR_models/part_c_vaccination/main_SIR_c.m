clear all
LW = 'linewidth'; lw = 2;
%% params
L =10; r_i = 0.5; r_rem = 1.1;
tmax = 1e5;
posit=1:L;
P_im = [0 0.1 0.2 0.3 0.4];
Nt = 100;

%% gillespie alg
count = 1;
for p_im = P_im
    for nn = 1:Nt
        init
        gillespie
        T(nn) = t_exit;
        Nd(nn) = Nr(end) - Nr0;
    end
    Tm(count) = mean(T);
    Tstd(count) = std(T);
    Ndm(count) = mean(Nd)
    Ndstd(count) = std(Nd);
    
    count = count +1
end

plots
