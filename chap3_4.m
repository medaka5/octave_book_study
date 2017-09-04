cla
clear
hold off
x=0:2:8;

func=@(x) (x.^2 + 10 ./ (sin(x) + 1.2));

y=func(x);

plot(x,y, "o");
hold on

xx=linspace(0,8,100);
yy=func(xx);

plot(xx,yy)

s1=interp1(x,y,xx,"next");
plot(xx,s1)
s1=interp1(x,y,xx,"cubic");
plot(xx,s1)
s1=interp1(x,y,xx);
plot(xx,s1)
s1=interp1(x,y,xx, "spline");
plot(xx,s1)



