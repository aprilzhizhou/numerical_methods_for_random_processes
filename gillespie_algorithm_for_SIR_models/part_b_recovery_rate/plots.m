figure (2)
count = 1;
time_idx = size(storeLatt,1)/L;
for pp =  fix(linspace(0,time_idx-1,4))
    subplot(2,2,count)
    Latt_pl = storeLatt(pp*L+1:(pp+1)*L,:);
    imagesc(Latt_pl); colorbar; caxis([0 2])
    set(gca,'fontsize',18); 
    count = count +1;
end



% figure (2)
% count = 1;
% for pp = [0 17 34 size(storeLatt,1)/L-1]
%     subplot(2,2,count)
%     Latt_pl = storeLatt(pp*L+1:(pp+1)*L,:);
%     imagesc(Latt_pl); colorbar; caxis([0 2])
%     set(gca,'fontsize',23); 
%     count = count +1;
% end

% figure (3)
% % subplot(length(r_remList),1,count)
% plot(Ns,LW,lw); hold on
% plot(Ni,LW,lw); hold on
% plot(Nr,LW,lw);
% set(gca,'fontsize',20)
% legend('S','I','R')
% xlabel('timestep'); ylabel('population')
% title(['$r_{rem} = $',num2str(r_rem)],'interpreter','latex')
% 
% 
% figure (2)
% imagesc(Latt); colorbar;
