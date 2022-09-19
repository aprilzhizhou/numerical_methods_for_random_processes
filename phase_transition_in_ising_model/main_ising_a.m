clear all 

LW = 'linewidth'; lw = 2;
FS = 'fontsize'; fs = 28;

%% define parameters
H = 0; J = 1; L = 25; t_corr = 200; N_trial=400;
% T_tilde = 1.5;
% beta = 1/T_tilde;

%% initialization
sig = randi([0 1], L,L);
sig(sig==0)=-1;
sig_init = sig;

%% algorithm
T_tildeList = linspace(3,1.5,5);
Energy_end = zeros(length(T_tildeList),1);
SHeat_end = zeros(length(T_tildeList),1);
Magnet_end = zeros(length(T_tildeList),1);
Suscept_end = zeros(length(T_tildeList),1);
Frac_end = zeros(length(T_tildeList),1);

for nn = 1:length(T_tildeList)
    T_tilde = T_tildeList(nn);
    test 
    Energy_end(nn) = Energy(end);
    SHeat_end(nn) = SHeat(end);
    Magnet_end(nn) = Magnet(end);
    Suscept_end(nn) = Suscept(end);
end

%% plots
figure (1)
plot(T_tildeList,Energy_end )
title('Energy Per Spin',FS,fs)

figure (2)
plot(T_tildeList,SHeat_end )
title('Specific Heat',FS,fs)

figure (3)
plot(T_tildeList,Magnet_end )
title('Magnetization',FS,fs)

figure (4)
plot(T_tildeList,Suscept_end )
title('Susceptibility',FS,fs)

% figure (1)
% pcolor(sig_init);
% 
% figure (2)
% pcolor(sig_new)
% 
% figure (3)
% plot(1:N,Energy,LW,lw);
% title('Energy',FS,fs)
% 
% figure (4)
% plot(1:N,SHeat,LW,lw);
% title('Specific Heat',FS,fs)
% 
% figure (5)
% plot(1:N,Magnet,LW,lw);
% title('Magnetization',FS,fs)
% 
% figure (6)
% plot(1:N,Suscept,LW,lw);
% title('Susceptibility',FS,fs)
