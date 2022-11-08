clear all;
load('data_4a_v2.mat')

a_prime = A + (length(w)/2);
b_prime = (1/B + 1/2*sum(log(w/h).^2));


theta_space=0:0.001:50;

%prior = (theta^(A-1)*exp(-theta/B))/(B^A*gamma(A));
%prior = @(x) gampdf(A,B);

%posterior = ((b_prime)^a_prime/gamma(a_prime))*(theta^(a_prime-1)*exp(-theta*(b_prime)));


for i=1:length(theta_space)
    prior(1,i) = (theta_space(1,i).^(A-1)*exp(-theta_space(1,i)/B))/(B.^A*gamma(A));
    posterior(1,i) = ((b_prime)^a_prime/gamma(a_prime))*(theta_space(1,i)^(a_prime-1)*exp(-theta_space(1,i)*(b_prime)));
end


hold on 
area(theta_space,prior)
area(theta_space,posterior)
xlabel('Theta Parameter Space')
ylabel('Probability Density')
title('Prior vs Posterior')
xline(2.2522)
legend('Prior','Posterior','MAP')
hold off



(a_prime-1)/(b_prime)