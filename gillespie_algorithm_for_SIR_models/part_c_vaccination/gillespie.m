C= zeros(L,L);
% h11 = imagesc(Latt);
% colorbar;
t_exit = 0;
Ns = []; Ni = []; Nr = [];

%% gillespie
for tt = 1:tmax
    S = Latt == 0;
    I = Latt == 1;
    R = Latt == 2;
    up_shift=circshift(posit,1);
    down_shift=circshift(posit,-1);
    I1 = I(down_shift,up_shift);   I2 = I(posit,up_shift);   I3 = I(up_shift,up_shift);
    I4 = I(down_shift,posit);                                I5 = I(up_shift,posit);
    I6 = I(down_shift,down_shift); I7 = I(posit,down_shift); I8 = I(up_shift,down_shift);
    I_nb = I1 + I2 +I3 ...
        +I4      +I5 ...
        +I6 + I7 +I8 ;
    % update transition rates for the susceptibles
    C(S) = r_i*I_nb(S);
    % update transition rates for the infected
    C(I) = r_rem;
    % update transition rates for the recoverd
    C(R) = 0;
    
    if C == 0
        break
    end
    %% compute tau
    %         Cr = reshape(C,[L^2,1]);
    u1 = rand;
    tau = -log(u1)/sum(C(:));
    
    % select transition
    u2 = rand; Csum= 0;
    
    [i_s, j_s] = ind2sub([L,L],1:L^2);
    for kk = 1:L^2
        ii2 = i_s(kk); jj2 = j_s(kk);
        Csum = Csum + C(ii2,jj2);
        if  Csum/sum(sum(C)) >= u2
            break
        end
    end
    if Latt(ii2,jj2) ~=2
        Latt(ii2,jj2) = Latt(ii2,jj2)+1;
    end
%     set(h11,'CData',Latt);
%     pause(0)
    Ns(tt) = sum(sum(S));
    Ni(tt) = sum(sum(I));
    Nr(tt) = sum(sum(R));
    
    t_exit = t_exit + tau;
end

% storeLatt = [storeLatt; Latt];
% imagesc(Latt); colorbar;