
function y = HestonPrice(PutCall,Lphi,Uphi,dphi)
    phi = [Lphi:dphi:Uphi];
    N = length(PHI);
    tau = T - t;
    for k = 1:N
        int1(k) = HestonFunc(phi(k),kappa,theta,rho,sigma,tau,v,S,K,1);
        int2(k) = HestonFunc(phi(k),kappa,theta,rho,sigma,tau,v,S,K,2);
    end
    I1 = trapz(int1)*dphi;
    I2 = trapz(int2)*dphi;
    P1 = 1/2 + 1/pi*I1;
    P2 = 1/2 + 1/pi*I2;
    if PutCall == 1
        y = S*P1 - K*exp(-r*T)*P2;
    else
        y = S*P1 - K*exp(-r*T)*P2 - S + K*exp(-r*T);
    end
