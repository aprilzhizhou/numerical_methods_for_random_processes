clear all

LW = 'linewidth'; lw = 2;
FS = 'fontsize'; fs = 20;

%% define parameters
H = 0; J = 1; L = 200; t_corr = 200; N_trial=400;
tem = 1.5;
% beta = 1/T_tilde;

%% initialization
sig = randi([0 1], L,L);
sig(sig==0)=-1;
sig_init = sig;

%% temperature loop
Tem = linspace(3,1.5,16);
TemPlot = [3 2.5 2 1.5];
EnergyList = zeros(length(Tem),1);
SHeatList = zeros(length(Tem),1);
MagnetList = zeros(length(Tem),1);
SusceptList= zeros(length(Tem),1);
FracList = zeros(length(Tem),1);


figure (1)
index_pl = 1;
for nn = 1:length(Tem)
    T_tilde = Tem(nn);
    test2
    EnergyList(nn) = Energy;
    SHeatList(nn) = SHeat;
    MagnetList(nn) = Magnet;
    SusceptList(nn) = Suscept;
    FracList(nn) = Frac;
    if ismember(T_tilde,TemPlot)
        subplot(2,2,index_pl)
        pcolor(sig); title(['$\tilde{T} = $',num2str(T_tilde)],'interpreter','latex',FS,fs)
        set(gca,'fontsize',15)
        index_pl = index_pl+1;
    end
end

%% plots
figure (2)
subplot(3,2,1)
plot(Tem,EnergyList)
set(gca,'fontsize',15)
xlabel('$\tilde{T}$','interpreter','latex',FS,fs)
title('Energy Per Spin',FS,fs)

subplot(3,2,2)
plot(Tem,SHeatList)
set(gca,'fontsize',15)
xlabel('$\tilde{T}$','interpreter','latex',FS,fs)
title('Specific Heat',FS,fs)

subplot(3,2,3)
plot(Tem,MagnetList)
set(gca,'fontsize',15)
xlabel('$\tilde{T}$','interpreter','latex',FS,fs)
title('Magnetization',FS,fs)

subplot(3,2,4)
plot(Tem,SusceptList)
set(gca,'fontsize',15)
xlabel('$\tilde{T}$','interpreter','latex',FS,fs)
title('Susceptibility',FS,fs)

subplot(3,2,5)
plot(Tem,FracList)
set(gca,'fontsize',15)
xlabel('$\tilde{T}$','interpreter','latex',FS,fs)
title('Faction of accepted flips',FS,fs)



