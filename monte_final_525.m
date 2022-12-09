clear all;
samples=25000;

r=monte_algorithm_final([-2;0;1;-1],[1 4/5 0 0;4/5 5 -1 0;0 -1 3 0;0 0 0 2],samples,'Yes');

character=zeros();
for i=1:samples
    x=r(1,i);
    y=r(2,i);
    z=r(3,i);
    in=0.5*(x+3)^2+0.5*y^2+z^2/9;

    if in <= 1
        character(1,i)=1;
    else
        character(1,i)=0;
    end
end

I=(1/samples)*sum((r(1,:)-r(2,:)).^2.*character);
    



function [r] = monte_algorithm_final(m,S,n,plot)
%This function is designed to implement a monte carlo algorithm to generate
%samples from a Normal_3(m,S) where m and S are given.
%Arguments
% m - a 4x1 column vector
% S - a 4x4 spd matrix
% n - number of data points to generate
% plot - string "Yes" or "No" if you want to generate a plotmatrix
x=zeros();
y=zeros();
z=zeros();
w=zeros();

%Checking to see if m is a column vector
if iscolumn(m) == false
    disp('Error: A column vector must be passed for m')
    return
end
%Checking to see if S is a matrix
[numRows,numCols] = size(S);
if numRows ~= 4 || numCols ~=4
    disp('Error: S must be a 4x4 matrix')
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
        w(:,i) = normrnd(0,sqrt(1)); %generate w

        vals = [x(:,i);y(:,i);z(:,i);w(:,i)]; %creating column vector
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
    title("Plotmatrix for Normal_4(m,S)")
    hold off
end

end