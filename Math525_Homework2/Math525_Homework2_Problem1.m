load("normal_normal.mat")

%% Designed Variable Values for M,v, and V
v = 1;
M = 0;
V = 10;

v_prime = (v*V)/(v+V*length(w));
m_prime = (M*v+V*sum(w))/(v+V*length(w));

%Parameter Space 
mu = -16:0.01:16;

%Defining posterior and prior
for i = 1:length(mu)
prior(1,i) = (1/(sqrt(2*pi*V))) * exp(-((mu(1,i)-M)^2)/(2*V));
posterior(1,i) = (1/sqrt(2*pi*v_prime))*exp((-1/2)*((mu(1,i)-m_prime)^2)/(v_prime));
end

%Graphing Prior and Posterior for problem 1 part 3 in homework set 2
area(mu,prior)
hold on
area(mu,posterior)
legend('Prior','Posterior')
xlabel('Values of Mu')
ylabel('Probability Density')
title('Comparing the Prior and Posterior for a Set of Mu Values')
hold off

%%Calculating the probability that the prior and posterior will take a
%%negative value
prior_prob = @(mu) (1/(sqrt(2*pi*V))) * exp((-(mu-M).^2)/(2*V));
posterior_prob = @(mu) (1/sqrt(2*pi*v_prime))*exp((-1/2)*((mu-m_prime).^2)/(v_prime));

ans_prior_prob = integral(prior_prob,-Inf,0);
ans_posterior_prob = integral(posterior_prob,-Inf,0);

