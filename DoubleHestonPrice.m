
function y = DoubleHestonPrice(PutCall,kappa1,kappa2,theta1,theta2,sigma1,sigma2,rho1,rho2,r,tau,a,b,N)
h = (b-a)/(N-1);
phi = [a:h:b];
w = h.*[1/2 ones(1,N-2) 1/2];
for k=1:length(phi)
    u = phi(k);
    f2(k) = DoubleHestonFunc(u,kappa1,kappa2,theta1,theta2,sigma1,sigma2,rho1,rho2,tau,v1,v2,S);
    f1(k) = DoubleHestonFunc(u-1i,kappa1,kappa2,theta1,theta2,sigma1,sigma2,rho1,rho2,tau,v1,v2,S);
    int2(k) = w(k)*real(exp(-1i*u*log(K))*f2(k)/1i/u);
    int1(k) = w(k)*real(exp(-1i*u*log(K))*f1(k)/1i/u );
end
P1 = 1/2 + 1/pi*sum(int1);
P2 = 1/2 + 1/pi*sum(int2);
if PutCall == 1
    y = S*P1 - K*exp(-r*tau)*P2;
else
    y = S*P1 - K*exp(-r*tau)*P2 - S + K*exp(-r*tau);
end

