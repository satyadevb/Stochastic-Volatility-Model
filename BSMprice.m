
function y = BSMprice(option_type, sigma, S, k, r, tau)
    d1 = (log(S / k) + (r + sigma^2 * 0.5) * tau) / (sigma * sqrt(tau));
    d2 = d1 - sigma * sqrt(tau);
    if option_type == 'Call'
        y = exp(-r*tau) * (s * exp(r*tau) * cdf('Normal',d1,0,1) - k *  cdf('Normal',d2,0,1));
    elseif option_type == 'Put'
        y = exp(-r*tau) * (k * cdf('Normal',-d2,0,1) - s * np.exp((r - q)*tau) *  cdf('Normal',-d1,0,1));
    end
