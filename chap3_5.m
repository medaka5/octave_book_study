cla
clear

hold off

func=@(x) (x.^2 + 10 ./ (sin(x) + 1.2));


x=linspace(-2,8,6);  # x1〜x6 (n=6)
n=columns(x);
y=func(x);

plot(x,y, "o")


# 頻繁に使うので、hx = x(i+1) - x(i)  と置く (i=1...n-1)
hx=x(2:end)-x(1:end-1);   

# 同様に頻繁に使うので、hy = y(i+1) - y(i)  と置く (i=1..n-1)
hy=y(2:end) - y(1:end-1);


# yの2階微分の連立方程式を最初に解く
# 詳細はググる（この本には書いてない)
A=zeros(n,n);
B=zeros(n,1);


A(1,1)=1;   # (u_1=0とするので、ここは1)

for i=2:n-1
    A(i,i-1)=hx(i-1);
    A(i,i)=2*(hx(i)+hx(i-1));
    A(i,i+1)=hx(i);
endfor
A(n,n)=1; # u_n=0とするので、ここは1


B(1)=0;    # u6=0
for i=2:n-1
    B(i)=6*(hy(i)/hx(i)-hy(i-1)/hx(i-1));
endfor
B(n)=0;

u=A\B;

hu=u(2:end)-u(1:end-1);


# ややこしいので、全部列行列に合わせる
hx=hx';
hy=hy';

# S(x) = a_i(x-x_i)^3 + b_i(x-x_i)^2 + c_i(x-x_i) + d_i

# b_i = u_i / 2
b=u/2;

a=hu ./ hx / 6;

c=hy./hx - hx .* (2 * u(1:end-1) + u(2:end)) / 6;

d=y(1:end-1);

for i=1:n-1
    xx=linspace(x(i),x(i+1),30);
    yy=a(i)*(xx-x(i)).^3 + b(i)*(xx-x(i)).^2+c(i)*(xx-x(i))+d(i);
    hold on
    plot(xx,yy, "r.");
endfor

