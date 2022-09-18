clear all
%% params
L =50; r_i = 0.5;
tmax = 1e5;
posit=1:L;
LW = 'linewidth'; lw = 2;

r_remList = [0.5];

figure (1)
count = 1;
for r_rem = r_remList
% gillespie
gillespie3
% subplot(2,2,count)
% plot(Ns,LW,lw); hold on
% plot(Ni,LW,lw); hold on
% plot(Nr,LW,lw);
% set(gca,'fontsize',20)
% legend('S','I','R')
% xlabel('timestep'); ylabel('population')
% title(['$r_{rem} = $',num2str(r_rem)],'interpreter','latex')
count = count +1;
end

% fprintf('The mean of elapsed time is %5.3f\n',mean(T));
plots
