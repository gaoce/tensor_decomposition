function perExp = decomp_parafac_perExp(data,factor,comp)

    err = data - nmodel({factor{1}(:,comp),factor{2}(:,comp),factor{3}(:,comp)});
    perExp = 1 - sum(err(:) .^ 2)/sum(data(:) .^2);

end