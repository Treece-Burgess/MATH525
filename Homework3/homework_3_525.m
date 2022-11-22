clear all;
%Problem 1 Part 1
n=1;
m=10;
phi=2;
psi=2.5;


for i = 1:10000
    t = gamrnd(phi,psi);
    mu = normrnd(m,sqrt(n/t));
    w(1,i) = normrnd(mu,sqrt(1/t));
end 

figure
histogram(w(1,:),55,'Normalization','pdf')
ylabel('Probability Density')
xlabel('w')
title('10,000 Sampled Values of w')
%%
%Problem 1 Part 3
w_space = -5:0.01:30;

for i=1:length(w_space)
    analytic_w(1,i) = gamma(phi+(1/2))/(psi^phi*gamma(phi)*sqrt(2*pi*(n+1))*(1/psi+w_space(1,i)^2/2 + m^2/(2*n)-(n*w_space(1,i)+m)^2/(2*n*(n+1)))^(phi+(1/2)));   
end

figure
hold on
histogram(w(1,:),55,'Normalization','pdf')
plot(w_space,analytic_w,'LineWidth',2.0)
legend('Empirical p(w)','Analytic p(w)')
title('Empirical p(w) vs Analytic p(w)')
ylabel('Probability Density')
xlabel('w')
hold off

