
function y = HestonFunc(phi,kappa,lambda,theta,rho,sigma,tau,v,S,K,Trap)
    x = log(S);
    a = kappa*theta;
    if Trap == 1
        u = 1/2;
        b = kappa + lambda - rho*sigma;
        d = sqrt((rho*sigma*1i*phi - b)^2 - sigma^2*(2*u*1i*phi - phi^2));
        g = (b - rho*sigma*1i*phi + d) / (b - rho*sigma*1i*phi - d);
        m = 1/g;
        G1 = (1 - exp(-d*tau))/(1 - m*exp(-d*tau));
        G2 = (1 - m*exp(-d*tau))/(1-m);
        D = G1*(b - rho*sigma*1i*phi + d)/sigma^2;
        C = r*1i*phi*tau + a/sigma^2*((b - rho*sigma*1i*phi - d)*tau - 2*log(G2) );
    elseif Trap == 2
        u = -1/2;
        b = kappa + lambda;
        d = sqrt((rho*sigma*1i*phi - b)^2 - sigma^2*(2*u*1i*phi - phi^2));
        g = (b - rho*sigma*1i*phi + d) / (b - rho*sigma*1i*phi - d);
        m = 1/g;
        G1 = (1 - exp(-d*tau))/(1 - m*exp(-d*tau));
        G2 = (1 - m*exp(-d*tau))/(1-m);
        D = G1*(b - rho*sigma*1i*phi + d)/sigma^2;
        C = r*1i*phi*tau + a/sigma^2*((b - rho*sigma*1i*phi - d)*tau - 2*log(G2) );
    end
f = exp(C + D*v + 1i*phi*x);
y = real(exp(-1i*phi*log(K))*f/(1i * phi));
