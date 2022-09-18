% initialize lattice
Latt = zeros(L,L);
% initialize immunization
Nr0 = p_im*L^2; 
randSam = randsample([1:L^2],Nr0);
[i_im, j_im] = ind2sub([L,L],1:L^2);
% i_imRand = i_im(randSam); j_imRand = j_im(randSam);
% Latt(i_imRand,j_imRand ) = 2;
for qq = randSam
    ii = i_im(qq); jj = j_im(qq);
    Latt(ii,jj) = 2;
end
% R = Latt == 2;
% Nr0 = sum(sum(R));


% initialize infection
Latt(L/2,L/2) = 1;

% imagesc(Latt); colorbar

