function [r] = monte_algorithm(m,S,n,plot)
%This function is designed to implement a monte carlo algorithm to generate
%samples from a Normal_3(m,S) where m and S are given.
%Arguments
% m - a 3x1 column vector
% S - a 3x3 spd matrix
% n - number of data points to generate
% plot - string "Yes" or "No" if you want to generate a plotmatrix

%Checking to see if m is a column vector
if iscolumn(m) == false
    disp('Error: A column vector must be passed for m')
    return
end
%Checking to see if S is a matrix
[numRows,numCols] = size(S);
if numRows ~= 3 || numCols ~=3
    disp('Error: S must be a 3x3 matrix')
    return
end
%Checking to see if S is spd
try chol(S)
    %If spd check passes then perform the monte-carlo algorithm
    L = chol(S,'lower');
    for i=1:n
        x(:,i) = normrnd(0,sqrt(1)); %generate x
        y(:,i) = normrnd(0,sqrt(1)); %generate y
        z(:,i) = normrnd(0,sqrt(1)); %generate z
        vals = [x(:,i);y(:,i);z(:,i)]; %creating column vector
        r(:,i) = m + L * vals; %calculating r    
    end    
catch Me
   disp('S is not symmetric positive definite(spd), please make sure S is spd')
   return  
end
%Graphically representing r if requested
if plot == "Yes"
    hold on
    plotmatrix(r')
    title("Plotmatrix for Normal_3(m,S)")
    hold off
end