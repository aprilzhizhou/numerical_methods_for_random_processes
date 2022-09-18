% L = 20;
% posit = 1:L;
% r_i = 0.5; r_rem = 1.1;
% tmax = 1e5;
%% initializatin
Latt = zeros(L,L);
Latt(L/2,L/2-3:L/2+3) = 1;
C = zeros(L,L);
h11 = imagesc(Latt); colorbar; caxis([0 2]);
t_exit = 0;
Ns = []; Ni = []; Nr = [];
nplots = 200;
storeLatt = [];
up_shift=circshift(posit,1);
down_shift=circshift(posit,-1);
[i_s, j_s] = ind2sub([L,L],1:L^2);

%% gillespie
for tt = 1:tmax
    
    S = Latt == 0;
    I = Latt == 1;
    R = Latt == 2;
%     I1 = I(down_shift,up_shift);   I2 = I(posit,up_shift);   I3 = I(up_shift,up_shift);
%     I4 = I(down_shift,posit);                                I5 = I(up_shift,posit);
%     I6 = I(down_shift,down_shift); I7 = I(posit,down_shift); I8 = I(up_shift,down_shift);
%     I_nb = I1 + I2 +I3 ...
%         +I4      +I5 ...
%         +I6 + I7 +I8 ;
    for ii=1:L
        for jj=1:L
            if Latt(ii,jj)==0
                I_nb(ii,jj)=I(down_shift(ii),up_shift(jj))+...
                    I(ii,up_shift(jj))+I(up_shift(ii),up_shift(jj))+...
                    I(down_shift(ii),jj)+I(up_shift(ii),jj)+...
                    I(down_shift(ii),down_shift(jj))+I(ii,down_shift(jj))+...
                    I(up_shift(ii),down_shift(jj));
                C(ii,jj)=r_i*I_nb(ii,jj);
            elseif Latt(ii,jj)==1
                C(ii,jj)=r_rem;
            else
                C(ii,jj)=0;
            end  
        end
    end 
    
    %     % update transition rates for the susceptibles
    %     Cnew(S) = r_i*I_nb(S);
    %     % update transition rates for the infected
    %     Cnew(I) = r_rem;
    %     % update transition rates for the recoverd
    %     Cnew(R) = 0;
    
    
    if C == 0
        break
    end
    Ckk = sum(sum(C));
    %% compute tau
    %         Cr = reshape(C,[L^2,1]);
    u1 = rand;
    tau = -log(u1)/Ckk;
    
    % select transition
    u2 = rand; 
    Cr = reshape(C,[L^2 1]);
    Ccs = cumsum(Cr) - u2*Ckk;
    idx = find(Ccs>0,1);
    ii2 = i_s(idx); jj2  = j_s(idx); 
    
%    Csum= 0;
%     for kk = 1:L^2
%         ii2 = i_s(kk); jj2 = j_s(kk);
%         Csum = Csum + C(ii2,jj2);
%         if  Csum/Ckk >= u2
%             break
%         end
%     end
    if Latt(ii2,jj2) ~=2
        Latt(ii2,jj2) = Latt(ii2,jj2)+1;
    end
        set(h11,'CData',Latt);
        pause(0)
    %     Ns(tt) = sum(sum(S));
    %     Ni(tt) = sum(sum(I));
    %     Nr(tt) = sum(sum(R));
    
    t_exit = t_exit + tau;
    if mod(tt,nplots) == 0
        storeLatt = [storeLatt; Latt];
    end
end

% storeLatt = [storeLatt; Latt];
% % imagesc(Latt);