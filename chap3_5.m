cla
clear

hold off

func=@(x) (x.^2 + 10 ./ (sin(x) + 1.2));

fplot(func,[-2,8])

x=linspace(-2,8,6);  # x1〜x6 (n=6)
n=columns(x);



# hx_j=x_j+1 - x_j
# hx(j) = x(j+1) - x(j) , j=1..n-1
hx=x(2:end)-x(1:end-1);   

y=func(x)

# hy_j=y_j+1 - y_j
# hy(j) = y(j+1) - y(j) , j=1..n-1

hy=y(2:end) - y(1:end-1);

plot(x,y)

# yの2階微分の連立方程式を最初に解く
# 詳細はググる（この本には書いてない)
u=zeros(n,1);    # funcのx1〜xnでの２階微分
A=zeros(n,n);
B=zeros(n,1);


A(1,1)=1;   # (u1=0とするので、こうおく)

A(2,1)=hx(1);
A(2,2)=2*(hx(2)+hx(1));
A(2,3)=hx(2);

A(3,2)=hx(2);
A(3,3)=2*(hx(3)+hx(2));
A(3,4)=hx(3);

A(4,3)=hx(3);
A(4,4)=2*(hx(4)+hx(3));
A(4,5)=hx(4);

A(5,4)=hx(4);
A(5,5)=2*(hx(5)+hx(4));
A(5,6)=hx(5);

A(6,6)=1; # u6=0とするので、ここは1


B(1)=0;    # u6=0
B(2)=6*(hy(2)/hx(2)-hy(1)/hx(1));
B(3)=6*(hy(3)/hx(3)-hy(2)/hx(2));
B(4)=6*(hy(4)/hx(4)-hy(3)/hx(3));
B(5)=6*(hy(5)/hx(5)-hy(4)/hx(4));
B(6)=0;

A=A(2:rows(A)-1, 2:columns(A)-1);
B=B(2:end-1);

u=A\B

#hu=u(2:end)-u(1:end-1);
hu=[u(1:end);0] -[0;u(1:end)];
u=[0;u(1:end)];

# 以後、u(end)は使わないしややこしいので削除
#u=u(1:end-1);

# ややこしいので、全部列行列に合わせる
hx=hx'
hy=hy'

# S(x) = a_i(x-x_i)^3 + b_i(x-x_i)^2 + c_i(x-x_i) + d_i

# b_i = u_i / 2
b=u/2;

a=hu ./ hx / 6;

c=hy./hx - hx .* (2 * u + [u(2:end);0]) / 6

d=y(1:end-1);

xx=linspace(-2,0,100);
yy=a(1)*(xx-x(1)).^3 + b(1)*(xx-x(1)).^2+c(1)*(xx-x(1))+d(1);

hold on
plot(xx,yy, "r.");

xx=linspace(0,2,100);
yy=a(2)*(xx-x(2)).^3 + b(2)*(xx-x(2)).^2+c(2)*(xx-x(2))+d(2);

hold on
plot(xx,yy, "r.");

xx=linspace(2,4,100);
yy=a(3)*(xx-x(3)).^3 + b(3)*(xx-x(3)).^2+c(3)*(xx-x(3))+d(3);

hold on
plot(xx,yy, "r.");

xx=linspace(4,6,100);
yy=a(4)*(xx-x(4)).^3 + b(4)*(xx-x(4)).^2+c(4)*(xx-x(4))+d(4);

hold on
plot(xx,yy, "r.");
xx=linspace(6,8,100);
yy=a(5)*(xx-x(5)).^3 + b(5)*(xx-x(5)).^2+c(5)*(xx-x(5))+d(5);

hold on
plot(xx,yy, "r.");
