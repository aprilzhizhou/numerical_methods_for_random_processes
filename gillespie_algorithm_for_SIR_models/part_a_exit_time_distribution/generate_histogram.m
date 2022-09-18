function [t_exit] = AprilZhiZhou_HW3(N_trial,L)
%% params
r_i = 0.5; r_rem = 1.1;
tmax = 1e5; posit=1:L;

for nn = 1:N_trial
    
    
    % initializatin
    Latt = zeros(L,L);
    Latt(L/2,L/2) = 1;
%     h11 = imagesc(Latt);
    C = zeros(L,L);
    time = 0;
    
    for tt = 1:tmax
        S = Latt == 0;
        I = Latt == 1;
        R = Latt == 2;
        up_shift=circshift(posit,1);
        down_shift=circshift(posit,-1);
        I1 = I(down_shift,up_shift);   I2 = I(posit,up_shift);   I3 = I(up_shift,up_shift);
        I4 = I(down_shift,posit);                                I5 = I(up_shift,posit);
        I6 = I(down_shift,down_shift); I7 = I(posit,down_shift); I8 = I(up_shift,down_shift);
        I_nb = I1 + I2  +I3...
            +I4       +I5...
            +I6 + I7  +I8 ;
        % update transition rates for the susceptibles
        C(S) = r_i*I_nb(S);
        % update transition rates for the infected
        C(I) = r_rem;
        % update transition rates for the recovered
        C(R) = 0;
        % stopping criterion
        if C == 0
            break
        end
        
        %% compute tau
        u1 = rand;
        tau = -log(u1)/sum(sum(C));
        
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
%         set(h11,'CData',Latt);
%         pause(0)
        time = time + tau;
    end
    % update time 
    t_exit(nn) = time;
end





end

