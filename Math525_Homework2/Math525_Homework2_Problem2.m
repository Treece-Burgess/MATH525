load('geo_beta.mat');

%Defining variables 
a = 1;
b = 1;
N = length(w);


%Defining pi
pi_array = 0:0.0000001:1;
prior=zeros(1,length(pi_array));
posterior=zeros(1,length(pi_array));

%Defining posterior and prior
for i = 1:length(pi_array)
prior(1,i) = ((pi_array(1,i).^(a-1))*((1-pi_array(1,i)).^(b-1)))/(beta(a,b));
posterior(1,i) = (pi_array(1,i).^((N+a)-1) * ((1-pi_array(1,i))^((b + sum(w))-1)))/beta(N + a, b+sum(w));
end

%Graphing Prior and Posterior for problem 2 part 3 in homework set 2
area(pi_array,prior)
hold on
area(pi_array,posterior)
legend('Prior','Posterior')
xlabel('Values of pi')
ylabel('Probability Density')
title('Comparing the Prior and Posterior for a Set of pi Values')
hold off

%Calculating the probability that the prior and posterior will take a value
%of 0.15 or greater for problem 2 part4
func_prior = @(pi_array) ((pi_array.^(a-1)).*((1-pi_array).^(b-1)))/(beta(a,b));
func_post = @(pi_array) (pi_array.^((N+a)-1).*((1-pi_array)).^((b + sum(w))-1))/beta(N + a, b+sum(w));
integral(func_prior,0.15,1)
integral(func_post,0.15,1)

%Analytically solving for the MAP of the Posterior
pi_hat = @(pi_array) -(log((pi_array.^((N+a)-1))) + log((1-pi_array).^((b + sum(w))-1)) - log(beta(N + a, b+sum(w))))
fminsearch(pi_hat,0.1)

((N+a)-1)/((N+a+b+sum(w))-2)
