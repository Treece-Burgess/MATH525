v = 1.6581;
e=exp(1);

n=349;

w1 = 0;
for k = 1:length(w)

    w1 = w1 + w(k,1);

end

lambda_func = @(lambda) -n * log(lambda/2) - (lambda/2)*sum(lambda*v-2*w1);


lambda_hat = fminsearch(lambda_func,0.51);
lambda_hat;

fplot(lambda_func)
