figure (2)
plot(P_im,Tm, LW, lw);
set(gca,'fontsize',15)
xlabel('$p_{im}$','interpreter','latex','fontsize',26);
ylabel('mean$(t_{exit})$','interpreter','latex','fontsize',26);


figure (3)
plot(P_im,Ndm,LW,lw)
set(gca,'fontsize',15)
xlabel('$p_{im}$','interpreter','latex','fontsize',26);
ylabel('mean$(N_d)$','interpreter','latex','fontsize',26);

figure (4)
plot(P_im,Tstd, LW, lw);
set(gca,'fontsize',15)
xlabel('$p_{im}$','interpreter','latex','fontsize',26);
ylabel('std$(t_{exit})$','interpreter','latex','fontsize',26);

figure (5)
plot(P_im,Ndstd, LW, lw);
set(gca,'fontsize',15)
xlabel('$p_{im}$','interpreter','latex','fontsize',26);
ylabel('std$(N_d)$','interpreter','latex','fontsize',26);