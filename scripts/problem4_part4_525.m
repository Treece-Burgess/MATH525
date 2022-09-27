v = 1.6581;


f = 0;
for k = 1:length(w)

    f = f + w(k,1);

end

lambda_func = @(lambda) (1/lambda) - 437.3346 + lambda * v



lambda_hat = fminsearch(lambda_func,0.61);

fplot(anon_func)