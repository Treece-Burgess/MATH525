clear all;

x_old=zeros();
y_old=zeros();
x_prop=zeros();
y_prop=zeros();

x_old(1,1) = 1;
y_old(1,1) = 0;

s=0.5;
n=10^4;


%Question: You are graphing x_old and y_old and not the proposal values?
u=rand(1);
for i=2:10^4
    x_prop=normrnd(x_old(1,i-1),sqrt(s^2)); %Is this correct to generate a proposal?
    y_prop=normrnd(y_old(1,i-1),sqrt(s^2)); %Is this correct to generate a proposal?
    accept_ratio(1,i)=exp(-10*(x_prop^2-y_prop)^2-(y_prop-0.25)^4+(10*(x_old(1,i-1)^2-y_old(1,i-1))^2+(y_old(1,i-1)-0.25)^4));
    %If the check fails do you keep the same u, or generate a new u?
    if u < accept_ratio(1,i) 
        x_old(1,i)=x_prop;
        y_old(1,i)=y_prop;
    else
        x_old(1,i)=x_old(1,i-1);
        y_old(1,i)=y_old(1,i-1);
    end
end
figure()
histogram2(x_old,y_old,'DisplayStyle','tile')

character=zeros(1,n);
for j=1:n
    if x_old(1,j) >= 0 && y_old(1,j) >=0
        character(1,j)=1;
    else
        character(1,j)=0;
    end
end



I=(1/n)*sum(sqrt(x_old.^2 + y_old.^2).*character);