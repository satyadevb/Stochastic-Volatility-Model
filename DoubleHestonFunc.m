
function y = DoubleHestonFunc(phi,kappa1,kappa2,theta1,theta2,sigma1,sigma2,rho1,rho2,tau,v1,v2,S)
    x = log(S);
    d1 = sqrt((kappa1-rho1*sigma1*1i*phi)^2 + sigma1^2 * phi * (phi + 1i));
    d2 = sqrt((kappa2-rho2*sigma2*1i*phi)^2 + sigma2^2 * phi * (phi + 1i));
    g1 = (kappa1-rho1*sigma1*phi*1i+d1)/(kappa1-rho1*sigma1*phi*1i-d1);
    g2 = (kappa2-rho2*sigma2*phi*1i+d2)/(kappa2-rho2*sigma2*phi*1i-d2);
    B1 = (kappa1-rho1*sigma1*phi*1i+d1)*(1-exp(d1*tau))/(sigma1^2 * (1 - g1 * exp(d1*tau)));
    B2 = (kappa2-rho2*sigma2*phi*1i+d2)*(1-exp(d2*tau))/(sigma2^2 * (1 - g2 * exp(d2*tau)));
    x1 = (1 - g1*exp(d1*tau))/(1-g1);
    x2 = (1 - g2*exp(d2*tau))/(1-g2);
    A = r*phi*1i*tau + (kappa1*theta1/sigma1^2)*( (kappa1 - rho1*sigma1*phi*1i + d1)*tau -2*log(x1)) + (kappa2*theta2/sigma2^2)*( (kappa2 - rho2*sigma2*phi*1i + d2)*tau -2*log(x2));
y = exp(A + 1i*phi*x + B1*v1 + B2*v2);

