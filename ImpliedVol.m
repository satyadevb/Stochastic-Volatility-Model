
function vol = ImpliedVol(option_type, opt_price, S, K, r, tau)
    prec = 0.00001;
    u = 500.0;
    %max_vol = 500.0;
    %min_vol = 0.0001;
    l = 0.0001;
    iter = 0;
    while abs(price - opt_price) < prec
        iter = iter + 1;
        m = (u + l)/2.0;
        price = bsm_price(option_type, m, S, K, r, tau);
        if option_type == 'Call'
            lower_price = bsm_price(option_type, l, S, K, r, tau, q);
            if (lower_price - opt_price) * (price - opt_price) > 0
                l = m;
            else
                u = m;
            end
            if abs(price - opt_price) < prec
                break;
            end
        elseif option_type == 'Put'
            upper_price = bsm_price(option_type, u, S, K, r, tau);
            if (upper_price - opt_price) * (price - opt_price) > 0
                u = m;
            else
                l = m;
            end
            if abs(price - opt_price) < prec
                break;
            end
        end
vol = m;
end



