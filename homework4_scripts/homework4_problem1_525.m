clear all;
load('gen_normal.mat')
%variables
phi=2;
psi=0.5;
T=0.5;
M=0;
N=length(w);
len=25000;
%initializing based on prior
mu=zeros(1,len);
tao=zeros(1,len);
%Question we initialize based on prior's)? - correct
mu(1,1)=normrnd(M,sqrt(1/T));
tao(1,1)=gamrnd(phi,psi);


%sampling as asked in part 2
%Question: Why do we do mu(1,i+1)? In the notes it is j-1.
for i=1:len-1
    mu(1,i+1)=normrnd((tao(1,i)*sum(w)+T*M)/(tao(1,i)*length(w)+T),sqrt(1/(tao(1,i)*N+T)));
    tao(1,i+1)=gamrnd(phi+N/2,1/(1/psi+0.5*sum((w-mu(1,i+1)).^2)));   
end



expectation_mu = 1/len * sum(mu);
expectation_tao= 1/len * sum(tao);

%Question: Do we graph tao first or does it not matter? - does not matter
%either way
figure()
histogram2(mu,tao,'Normalization','pdf')
xlabel('Values of mu')
ylabel('Values of tao')
zlabel('Probability Density')
title('Characterizing the Posterior Empirically')
figure()
histogram2(mu,tao,'DisplayStyle','tile')
xlabel('Values of mu')
ylabel('Values of tao')
title('Characterizing the Posterior Empirically')